-- Keymaps for better default experience
-- See `:help vim.api.nvim_set_keymap()`
-- vim.api.nvim_set_keymap({ 'n', 'v' }, '<leader>', '<Nop>', { silent = true })
-- Plugin remaps are located in the respective plugin definition under their init function

-- Run/Compile code inside {{{

vim.api.nvim_set_keymap(
    'n',
    '<leader>t',
    '<CMD>split term://$SHELL<CR>',
    { desc = '[t]erminal create' }
)

-- Saved compile arguments are stolen from here
-- https://github.com/xiyaowong/transparent.nvim/blob/b075d5bb07fa1615b09585e1a2f7d2418c251562/lua/transparent/cache.lua
-- Just precreate the directory ~/.local/share/nvim/compile/
local path = vim.fn.stdpath('data')
    .. '/compile/'
    .. vim.api.nvim_buf_get_name(0):gsub('/', '@')
local exists, lines = pcall(vim.fn.readfile, path)
if exists and #lines > 0 then
    vim.b.runwithparameters = vim.trim(lines[1])
end

vim.keymap.set('n', '<leader>r', function()
    vim.ui.input({
        prompt = 'Run: ',
        default = vim.b.runwithparameters,
        completion = 'shellcmd',
    }, function(input)
        if input == nil or input == '' then
            print('See :h cmdline-special and :h filename-modifiers')
            return
        end

        vim.b.runwithparameters = input
        vim.fn.writefile({ input }, path)
        vim.cmd.split('term://' .. input)
    end)
end, { desc = '[r]un and [r]emember an input' })

vim.keymap.set(
    'n',
    '<leader>Rgc',
    function()
        local file = vim.api.nvim_buf_get_name(0)
        local file_noext = file:match('^(.+)%.+')

        vim.cmd.split(
            'term://gcc '
                .. file
                .. ' --debug -o '
                .. file_noext
                .. '&& echo "Compiled to '
                .. file
                .. ' "'
        )
    end,
    -- '<CMD>!gcc % --debug -o %<CR>',
    { desc = 'GCC [c]ompile' }
)
vim.keymap.set(
    'n',
    '<leader>RgC',
    function()
        local file = vim.api.nvim_buf_get_name(0)
        local file_noext = file:match('^(.+)%.+')

        vim.cmd.split(
            'term://gcc ' .. file .. ' --debug -o ' .. file_noext .. '&& fish'
        )
        vim.api.nvim_chan_send(
            vim.api.nvim_get_current_buf(),
            file_noext .. ' '
        )
    end,
    -- '<CMD>!gcc % --debug -o %<CR>',
    { desc = 'GCC [C]ompile and run' }
)
vim.api.nvim_set_keymap(
    'n',
    '<leader>Rgr',
    '<CMD>split term://gcc % --debug -o /tmp/a.out && /tmp/a.out<CR>',
    { desc = 'GCC [r]un' }
)

vim.api.nvim_set_keymap(
    'n',
    '<leader>RG',
    '<CMD>split term://go run %<CR>',
    { desc = '[G]o run' }
)
vim.keymap.set(
    'n',
    '<leader>RgR',
    function()
        os.execute(
            'gcc ' .. vim.api.nvim_buf_get_name(0) .. ' --debug -o /tmp/a.out'
        )
        vim.ui.input({ prompt = 'Prompt: ' }, function(input)
            vim.cmd.split('term:///tmp/a.out ' .. input)
        end)
    end,
    { desc = 'GCC [R]un with parameters' } -- runs in
)

-- vim.api.nvim_set_keymap('n', '<leader>Rgd', '<CMD><CR>', { desc = '[d]ebug' })
vim.api.nvim_set_keymap(
    'n',
    '<leader>Rx',
    '<CMD>silent !chmod +x %<CR>',
    { desc = 'chmod +[x] %' }
)

vim.api.nvim_set_keymap(
    'n',
    '<leader>Rf',
    '<CMD>split term://%<CR>',
    { desc = 'Run [f]ile' }
)
vim.api.nvim_set_keymap(
    'n',
    '<leader>RF',
    '<CMD>split term://fish<CR>' .. vim.api.nvim_buf_get_name(0) .. ' ',
    { desc = 'Run [F]ile with parameters' }
)
-- }}}
-- Exit term mode{{{
vim.api.nvim_set_keymap(
    't',
    '<C-space>',
    '<C-\\><C-n><C-w>h',
    { silent = true }
) -- }}}
-- Remove highlighting with escape{{{
vim.api.nvim_set_keymap(
    'n',
    '<esc>',
    ':noh<return><esc>',
    { silent = true, noremap = true }
) -- }}}
-- Save and quit binings{{{
vim.api.nvim_set_keymap(
    'n',
    '<leader>w',
    '<CMD>w<CR>',
    { silent = true, desc = '[w]rite current buffer' }
)
vim.api.nvim_set_keymap(
    'n',
    '<leader>W',
    '<CMD>wa<CR>',
    { silent = true, desc = '[W]rite all buffers' }
)

vim.api.nvim_set_keymap(
    'n',
    '<leader>q',
    '<CMD>wq<CR>',
    { silent = true, desc = '[q]uit with saving' }
)
vim.api.nvim_set_keymap(
    'n',
    '<leader>Q',
    '<CMD>qa!<CR>',
    { silent = true, desc = '[Q]uit forcefully' }
) -- }}}
-- Allow for using t inside nvim {{{
vim.api.nvim_set_keymap('n', '<C-t>', '<CMD>silent !t<CR>', { silent = true })
-- vim.api.nvim_set_keymap('n', '<C-S-t>', '<CMD>silent !T<CR>', { silent = true })
-- }}}
-- Visual mode indents reenters visual mode {{{
vim.api.nvim_set_keymap('v', '>', '> gv', { noremap = true })
vim.api.nvim_set_keymap('v', '<', '< gv', { noremap = true })
-- }}}
-- g[y|d|p|P] uses to system clipboard{{{
vim.keymap.set(
    { 'n', 'v' },
    'gy',
    '"+y',
    { desc = '[y]ank to system clipboard' }
)
vim.keymap.set(
    { 'n', 'v' },
    'gd',
    '"+d',
    { desc = '[d]elete to system clipboard' }
)
vim.keymap.set(
    { 'n', 'v' },
    'gp',
    '<CMD> set paste<CR>"+p<CMD>set paste!<CR>',
    { desc = '[p]aste System Clipboard' }
)
vim.keymap.set(
    { 'n', 'v' },
    'gP',
    '<CMD> set paste<CR>"+P<CMD>set paste!<CR>',
    { desc = 'reverse [P]aste System Clipboard' }
) -- }}}
-- Middle positioned C+[D/U] and [n/N] {{{
vim.api.nvim_set_keymap(
    'n',
    '<C-d>',
    '<C-d>zz',
    { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
    'n',
    '<C-u>',
    '<C-u>zz',
    { noremap = true, silent = true }
)
vim.api.nvim_set_keymap('n', 'n', 'nzzzv', { silent = true })
vim.api.nvim_set_keymap('n', 'N', 'Nzzzv', { silent = true })
-- }}}
-- Netrw {{{
-- Open netrw on the right
vim.api.nvim_set_keymap('n', '<leader>n', '<CMD>Lex<CR>', { desc = 'Lex?' })
-- Open current window as netrw
vim.api.nvim_set_keymap(
    'n',
    '<leader>e',
    '<CMD>Ex<CR>',
    { desc = '[e]xplorer in current window' }
)
-- }}}
-- Buffer {{{
-- Tabs to move around buffers
vim.api.nvim_set_keymap('n', '<C-I>', '<Tab>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Tab>', '<CMD>bnext<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<S-Tab>', '<CMD>bprev<CR>', { noremap = true })

-- function BufRem(number)
--     local bufremove = require('mini.bufremove')
--     if not bufremove.delete(number, false) then
--         local choice = vim.fn.confirm(
--             'Save changes to ' .. vim.fn.expand('%:p'),
--             '&Yes\n&No\n&Cancel',
--             3
--         )
--
--         if choice == 1 then
--             vim.cmd('update')
--             bufremove.delete(number, false)
--         elseif choice == 2 then
--             bufremove.delete(number, true)
--         end
--     end
--     CheckTabline()
-- end

vim.api.nvim_set_keymap(
    'n',
    '<leader>c',
    -- '<CMD>lua BufRem(0)<CR>',
    "<CMD>lua require('mini.bufremove').delete(); CheckTabline()<CR>",
    { desc = '[c]lose current buffer' }
)

vim.api.nvim_set_keymap(
    'n',
    '<leader>C',
    -- '<CMD>lua BufRem(0)<CR>',
    "<CMD>lua require('mini.bufremove').delete(0, true); CheckTabline()<CR>",
    { desc = '[C]lose forcefully current buffer' }
)

vim.api.nvim_set_keymap(
    'n',
    'gb',
    '<CMD>lua ToggleBar()<CR>',
    { desc = 'Toggle buffer [b]ar' }
)

for i = 0, 9 - 1 do
    vim.api.nvim_set_keymap(
        'n',
        '<A-' .. i .. '>',
        -- '<CMD>lua if MiniTabline ~= nil then MiniTabline.select, ('
        --     .. i
        --     .. ') end<CR>',
        -- '<CMD>lua if MiniTabline ~= nil then pcall(MiniTabline.select, '
        --     .. i
        --     .. ') end<CR>',
        '<CMD>lua pcall(MiniTabline.select, '
            .. i
            .. ')<CR>',
        { silent = true }
    )
end
-- }}}
-- Windows {{{
-- https://github.com/echasnovski/mini.basics
vim.api.nvim_set_keymap(
    'n',
    '<C-Left>',
    '"<Cmd>vertical resize -" . v:count1 . "<CR>"',
    { expr = true, replace_keycodes = false, desc = 'Decrease window width' }
)
vim.api.nvim_set_keymap(
    'n',
    '<C-Down>',
    '"<Cmd>resize -"          . v:count1 . "<CR>"',
    { expr = true, replace_keycodes = false, desc = 'Decrease window height' }
)
vim.api.nvim_set_keymap(
    'n',
    '<C-Up>',
    '"<Cmd>resize +"          . v:count1 . "<CR>"',
    { expr = true, replace_keycodes = false, desc = 'Increase window height' }
)
vim.api.nvim_set_keymap(
    'n',
    '<C-Right>',
    '"<Cmd>vertical resize +" . v:count1 . "<CR>"',
    { expr = true, replace_keycodes = false, desc = 'Increase window width' }
)
vim.api.nvim_set_keymap(
    'n',
    '<C-H>',
    '<C-w>h',
    { desc = 'Focus on left window' }
)
vim.api.nvim_set_keymap(
    'n',
    '<C-J>',
    '<C-w>j',
    { desc = 'Focus on below window' }
)
vim.api.nvim_set_keymap(
    'n',
    '<C-K>',
    '<C-w>k',
    { desc = 'Focus on above window' }
)
vim.api.nvim_set_keymap(
    'n',
    '<C-L>',
    '<C-w>l',
    { desc = 'Focus on right window' }
)
-- }}}
-- Blazingly fast remaps {{{
-- vim.api.nvim_set_keymap('v', 'J', ":m '>+1<CR>gv=gv") vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")
-- Unmoving cursor while doing J
-- vim.api.nvim_set_keymap('n', 'J', 'mzJ`z')
-- }}}
-- vim:foldmethod=marker:
