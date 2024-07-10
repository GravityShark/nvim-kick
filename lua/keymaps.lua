-- Keymaps for better default experience
-- See `:help vim.api.nvim_set_keymap()`
-- vim.api.nvim_set_keymap({ 'n', 'v' }, '<leader>', '<Nop>', { silent = true })
-- Plugin remaps are located in the respective plugin definition under their init function

-- Run/Compile code inside {{{
-- Saved compile arguments are stolen from here
-- https://github.com/xiyaowong/transparent.nvim/blob/b075d5bb07fa1615b09585e1a2f7d2418c251562/lua/transparent/cache.lua
-- Just precreate the directory ~/.local/share/nvim/compile/
vim.keymap.set('n', '<leader>r', function()
    local path = vim.fn.stdpath('data')
        .. '/compile/'
        .. vim.api.nvim_buf_get_name(0):gsub('/', '@')
    local exists, lines = pcall(vim.fn.readfile, path)
    if exists and #lines > 0 then
        vim.b.runwithparameters = vim.trim(lines)
    end
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
end, { desc = 'un command' })

vim.api.nvim_set_keymap(
    'n',
    '<leader>R',
    '<CMD>silent !chmod +x %<CR>',
    { desc = 'unnable file' }
) --}}}
-- Save and quit binings{{{
vim.api.nvim_set_keymap(
    'n',
    '<leader>w',
    '<CMD>w<CR>',
    { silent = true, desc = 'rite current buffer' }
)
vim.api.nvim_set_keymap(
    'n',
    '<leader>W',
    '<CMD>wa<CR>',
    { silent = true, desc = 'rite all buffers' }
)

vim.api.nvim_set_keymap(
    'n',
    '<leader>q',
    '<CMD>wqa<CR>',
    { silent = true, desc = 'uit with saving' }
)
vim.api.nvim_set_keymap(
    'n',
    '<leader>Q',
    '<CMD>qa!<CR>',
    { silent = true, desc = 'uit forcefully' }
) -- }}}
-- Allow for using t inside nvim {{{
vim.api.nvim_set_keymap('n', '<C-t>', '<CMD>silent !t<CR>', { silent = true })
-- }}}
-- Visual mode indents reenters visual mode {{{
vim.api.nvim_set_keymap('v', '>', '> gv', { noremap = true })
vim.api.nvim_set_keymap('v', '<', '< gv', { noremap = true })
-- }}}
-- g[y|d|p|P] uses to system clipboard{{{
vim.keymap.set({ 'n', 'v' }, 'gy', '"+y', { desc = 'ank to system clipboard' })
vim.keymap.set(
    { 'n', 'v' },
    'gd',
    '"+d',
    { desc = 'elete to system clipboard' }
)
vim.keymap.set(
    { 'n', 'v' },
    'gp',
    '<CMD> set paste<CR>"+p<CMD>set paste!<CR>',
    { desc = 'aste system clipboard' }
)
vim.keymap.set(
    { 'n', 'v' },
    'gP',
    '<CMD> set paste<CR>"+P<CMD>set paste!<CR>',
    { desc = 'aste system clipboard' }
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
-- Open netrw on the left as nerdtree
vim.api.nvim_set_keymap('n', '<leader>n', '<CMD>Lex<CR>', { desc = 'erdtree' })
-- Open current window as netrw
vim.api.nvim_set_keymap(
    'n',
    '<leader>.',
    '<CMD>Ex<CR>',
    { desc = 'file explorer' }
)
-- }}}
-- Closing buffers {{{
vim.api.nvim_set_keymap(
    'n',
    '<leader>c',
    '<CMD>bdelete<CR>',
    { desc = 'lose buffer' }
)
vim.api.nvim_set_keymap(
    'n',
    '<leader>c',
    '<CMD>bdelete<CR>',
    { desc = 'lose forcefully' }
)-- }}}
-- vim:foldmethod=marker:
