-- Keymaps for better default experience
-- See `:help vim.api.nvim_set_keymap()`
-- vim.keymap.set({ 'n', 'v' }, '<leader>', '<Nop>', { silent = true })
--
-- Plugin remaps are located in the respective plugin definition under their init function

-- Run/Compile code inside {{{
vim.keymap.set(
    'n',
    '<leader>rgc',
    function()
        local file = vim.api.nvim_buf_get_name(0)
        local file_noext = file:match('^(.+)%.+')
        os.execute('gcc ' .. file .. ' --debug -o ' .. file_noext)
        vim.api.nvim_command('echo "Compiled to ' .. file_noext .. '"')
    end,
    -- '<CMD>!gcc % --debug -o %<CR>',
    { desc = '[c]ompile' }
)
vim.keymap.set(
    'n',
    '<leader>rgr',
    "<CMD>!gcc % --debug -o /tmp/a.out<CR><CMD>!'/tmp/a.out<CR>'",
    { desc = '[r]un' } -- runs in
)
vim.keymap.set(
    'n',
    '<leader>rgR',
    function()
        os.execute(
            'gcc ' .. vim.api.nvim_buf_get_name(0) .. ' --debug -o /tmp/a.out'
        )
        vim.ui.input({ prompt = 'Prompt: ' }, function(input)
            vim.api.nvim_command('!/tmp/a.out ' .. input)
        end)
    end,
    { desc = '[R]un with parameters' } -- runs in
)
-- vim.keymap.set('n', '<leader>rgd', '<CMD><CR>', { desc = '[d]ebug' })
vim.keymap.set(
    'n',
    '<leader>rx',
    '<CMD>silent !chmod +x %<CR>',
    { desc = 'chmod +[x] %' }
)
-- }}}
-- Exit term mode{{{
vim.keymap.set('t', '<C-space>', '<C-\\><C-n><C-w>h', { silent = true }) -- }}}
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
    { silent = true, desc = 'write and [q]uit' }
)
vim.api.nvim_set_keymap(
    'n',
    '<leader>Q',
    '<CMD>qa!<CR>',
    { silent = true, desc = '[Q]uit without saving' }
) -- }}}
-- Allow for using t inside nvim {{{
vim.api.nvim_set_keymap('n', '<C-t>', '<CMD>silent !t<CR>', { silent = true })
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
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')
-- }}}
-- Netrw {{{
-- Open netrw on the right
vim.api.nvim_set_keymap('n', '<leader>.', '<CMD>Sex!<CR>', { desc = 'SEEX!!!' })
-- vim.api.nvim_set_keymap(
--     'n',
--     '<leader>l',
--     '<CMD>Lex<CR><CMD>vertical resize 50<CR>',
--     { desc = 'Lex??' }
-- )
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
    '<leader>X',
    -- '<CMD>lua BufRem(0)<CR>',
    "<CMD>lua require('mini.bufremove').delete(0, true); CheckTabline()<CR>",
    { desc = '[X] force close current buffer' }
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
-- vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
-- vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")
-- Unmoving cursor while doing J
vim.keymap.set('n', 'J', 'mzJ`z')
-- }}}
