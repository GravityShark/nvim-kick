-- Plugin remaps are located in the respective plugin definition
-- under their keys map

-- Groups
vim.api.nvim_set_keymap('n', '<leader>c', '', { desc = '+code' })

-- Terminal helpers {{{
-- To escape terminal mode
vim.api.nvim_set_keymap('t', '<C-space>', '<C-\\><C-n>', { silent = true })
-- Enter terminal
vim.api.nvim_set_keymap(
    'n',
    '<leader>s',
    '<CMD>split term://$SHELL<CR><CMD>set nu!<CR><CMD>set rnu!<CR>i',
    { desc = 'shell' }
)
-- }}}
-- Run/Compile code inside {{{
-- Saved compile arguments are stolen from here
-- https://github.com/xiyaowong/transparent.nvim/blob/b075d5bb07fa1615b09585e1a2f7d2418c251562/lua/transparent/cache.lua
vim.keymap.set('n', '<leader>r', function()
    local dir = vim.fn.stdpath('data') .. '/compile/'
    if vim.fn.isdirectory(dir) == 0 then
        vim.fn.mkdir(dir, 'p')
    else
        local path = dir .. vim.api.nvim_buf_get_name(0):gsub('/', '@')
        local exists, lines = pcall(vim.fn.readfile, path)
        if exists and #lines > 0 then
            vim.b.runwithparameters = lines[1]
        end
    end
    vim.ui.input({
        prompt = 'Run: ',
        default = vim.b.runwithparameters,
        completion = 'file',
    }, function(input)
        if input == nil or input == '' then
            print('See :h cmdline-special and :h filename-modifiers')
            return
        end

        vim.b.runwithparameters = input
        vim.fn.writefile({ input }, path)
        vim.cmd.split('term://' .. input)
        vim.opt_local.relativenumber = false
        vim.opt_local.number = false

        vim.api.nvim_buf_set_keymap(
            0,
            't',
            '<C-space>',
            '<C-\\><C-n><C-w>h',
            { silent = true }
        )
        vim.cmd.startinsert()
    end)
end, { desc = 'run command' })
vim.keymap.set('n', '<leader>R', function()
    local path = vim.fn.stdpath('data')
        .. '/compile/'
        .. vim.fn.getcwd():gsub('/', '@')
    local exists, lines = pcall(vim.fn.readfile, path)
    if exists and #lines > 0 then
        vim.g.runwithparametersglobally = lines[1]
    end
    vim.ui.input({
        prompt = 'Run Globally: ',
        default = vim.g.runwithparametersglobally,
        completion = 'shellcmd',
    }, function(input)
        if input == nil or input == '' then
            print('See :h cmdline-special and :h filename-modifiers')
            return
        end
        vim.g.runwithparametersglobally = input
        vim.fn.writefile({ input }, path)
        vim.cmd.split('term://' .. input)
        vim.opt_local.relativenumber = false
        vim.opt_local.number = false
        vim.cmd.startinsert()
        vim.api.nvim_buf_set_keymap(
            0,
            't',
            '<C-space>',
            '<C-\\><C-n><C-w>h',
            { silent = true }
        )
    end)
end, { desc = 'run command save globally' })
--}}}
-- Save, close and quit bindings {{{
vim.api.nvim_set_keymap(
    'n',
    '<leader>w',
    '<CMD>w<CR>',
    { silent = true, desc = 'write current buffer' }
)
-- vim.api.nvim_set_keymap(
--     'n',
--     '<leader>W',
--     '<CMD>wa<CR>',
--     { silent = true, desc = 'Write all buffers' }
-- )
-- Use ZZ instead
vim.api.nvim_set_keymap(
    'n',
    '<leader>q',
    '<CMD>wq<CR>',
    { silent = true, desc = 'quit with saving' }
)
vim.api.nvim_set_keymap(
    'n',
    '<leader>Q',
    '<CMD>qa!<CR>',
    { silent = true, desc = 'Quit forcefully' }
)

vim.api.nvim_set_keymap(
    'n',
    '<leader>x',
    '<CMD>close<CR>',
    { desc = 'close window' }
)
-- }}}
-- Allow for using the script ~t~ inside nvim {{{
vim.api.nvim_set_keymap('n', '<C-g>', '<CMD>silent !t<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<A-g>', '<CMD>silent !T<CR>', { silent = true })
-- }}}
-- Visual mode indents reenters visual mode {{{
vim.api.nvim_set_keymap('v', '>', '> gv', { noremap = true })
vim.api.nvim_set_keymap('v', '<', '< gv', { noremap = true })
-- }}}
-- g[y|d|p|P] uses to system clipboard, and also gd to delete without copying{{{
vim.keymap.set({ 'n', 'v' }, 'gd', '"_d', { desc = 'delete empty' })
vim.keymap.set({ 'n', 'v' }, 'gy', '"+y', { desc = 'Yank to system clipboard' })
vim.keymap.set(
    { 'n', 'v' },
    'gp',
    '<CMD> set paste<CR>"+p<CMD>set paste!<CR>',
    { desc = 'Paste system clipboard' }
)
vim.keymap.set(
    { 'n', 'v' },
    'gP',
    '<CMD> set paste<CR>"+P<CMD>set paste!<CR>',
    { desc = 'Paste system clipboard' }
) -- }}}
-- Middle positioned C+[D/U] and [n/N] {{{
vim.keymap.set(
    { 'n', 'v' },
    '<C-d>',
    '<C-d>zz',
    { noremap = true, silent = true }
)
vim.keymap.set(
    { 'n', 'v' },
    '<C-u>',
    '<C-u>zz',
    { noremap = true, silent = true }
)
vim.api.nvim_set_keymap('n', 'n', 'nzzzv', { silent = true })
vim.api.nvim_set_keymap('n', 'N', 'Nzzzv', { silent = true })
-- }}}
-- Netrw {{{
-- Open netrw on the left as nerdtree
-- vim.api.nvim_set_keymap(
--     'n',
--     '<leader>>',
--     '<CMD>Lex<CR>iii',
--     { desc = 'nerdtree' }
-- )

-- Open current window as netrw
-- '<CMD>edit .<CR>',
-- '<CMD>Explore<CR>',
-- vim.api.nvim_set_keymap(
--     'n',
--     '<leader>.',
--     '<CMD>Explore<CR>',
--     { desc = 'file explorer' }
-- )

-- Open a floating window with netrw
-- vim.keymap.set('n', '<leader>.', function()
--     require('floating_netrw').toggle()
-- end, { desc = 'file explorer', noremap = true, silent = true })

-- }}}
-- blazingly fast https://github.com/ThePrimeagen/init.lua/blob/master/lua/theprimeagen/remap.lua {{{
-- greatest remap ever
-- vim.api.nvim_set_keymap('x', '<leader>p', '"_dP', { desc = 'paste empty' })
-- vim.api.nvim_set_keymap(
--     'n',
--     '<leader><leader>',
--     '<CMD>e<CR>',
--     { desc = 'refresh buffer' }
-- )
-- }}}
-- square bracket motions {{{
vim.api.nvim_set_keymap(
    'n',
    '[b',
    '<CMD>bprev<CR>',
    { desc = 'Previous buffer' }
)
vim.api.nvim_set_keymap('n', ']b', '<CMD>bnext<CR>', { desc = 'Next buffer' })
vim.api.nvim_set_keymap(
    'n',
    '[q',
    '<CMD>cprev<CR>',
    { desc = 'Previous quickfix' }
)
vim.api.nvim_set_keymap('n', ']q', '<CMD>cnext<CR>', { desc = 'Next quickfix' })

-- }}}
-- plus and minus for decrement and increment {{{
vim.api.nvim_set_keymap('n', '+', '<C-a>', { desc = 'Increment' })
vim.api.nvim_set_keymap('n', '-', '<C-x>', { desc = 'Decrement' })
-- }}}
-- vim:foldmethod=marker:
