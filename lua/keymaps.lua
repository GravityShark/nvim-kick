-- Keymaps for better default experience
-- See `:help vim.api.nvim_set_keymap()`
-- vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- X Remap for dealing with word wrap{{{
-- vim.api.nvim_set_keymap(
--     'n',
--     'k',
--     "v:count == 0 ? 'gk' : 'k'",
--     { expr = true, silent = true }
-- )
-- vim.api.nvim_set_keymap(
--     'n',
--     'j',
--     "v:count == 0 ? 'gj' : 'j'",
--     { expr = true, silent = true }
-- )
-- }}}

-- Easier visual mode indents {{{
vim.api.nvim_set_keymap('v', '>', '> gv', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<', '< gv', { noremap = true, silent = true })
-- }}}

-- Space + y|d yanks or cuts to system clipboard{{{
vim.keymap.set(
    { 'n', 'v' },
    '<leader>y',
    '"+y',
    { noremap = true, silent = true, desc = '[y]ank to system clipboard' }
)
vim.keymap.set(
    { 'n', 'v' },
    '<leader>d',
    '"+d',
    { noremap = true, silent = true, desc = '[d]elete to system clipboard' }
) -- }}}

-- Correct Pasting{{{
vim.keymap.set(
    { 'n', 'v' },
    '<leader>p',
    '<CMD> set paste<CR>"+p<CMD>set paste!<CR>',
    { noremap = true, silent = true, desc = '[p]aste System Clipboard' }
)
vim.keymap.set(
    { 'n', 'v' },
    '<leader>P',
    '<CMD> set paste<CR>"+P<CMD>set paste!<CR>',
    { noremap = true, silent = true, desc = '[P]aste System Clipboard' }
) -- }}}

-- Middle positioned C+ D/U{{{
vim.api.nvim_set_keymap(
    'n',
    '<C-d>',
    '<C-d>zz',
    { noremap = false, silent = true }
)
vim.api.nvim_set_keymap(
    'n',
    '<C-u>',
    '<C-u>zz',
    { noremap = false, silent = true }
)
-- }}}

-- LSP {{{
-- vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
-- vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)
-- vim.api.nvim_set_keymap(
--     'n',
--     'K',
--     '<cmd>lua vim.lsp.buf.hover()<CR>',
--     { noremap = true }
-- ) -- Hover object
-- vim.api.nvim_set_keymap(
--     'n',
--     'ga',
--     '<cmd>lua vim.lsp.buf.code_action()<CR>',
--     { noremap = true, desc = 'Diagnostic Code [a]ction' }
-- ) -- Code actions
-- vim.api.nvim_set_keymap(
--     'n',
--     'gR',
--     '<cmd>lua vim.lsp.buf.rename()<CR>',
--     { noremap = true }
-- ) -- Rename an object
-- vim.api.nvim_set_keymap(
--     'n',
--     'gD',
--     '<cmd>lua vim.lsp.buf.definition()<cr>',
--     { noremap = true }
-- ) -- Go to declaration
--
vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(ev)
        local opts = { buffer = ev.buf }
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
        vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        vim.keymap.set('i', '<C-h>', vim.lsp.buf.signature_help, opts)
        vim.keymap.set('n', '<space>vws', vim.lsp.buf.workspace_symbol, opts)
        vim.keymap.set('n', '<space>vd', vim.diagnostic.open_float, opts)
        vim.keymap.set('n', '<space>vca', vim.lsp.buf.code_action, opts)
        vim.keymap.set('n', '<space>vrr', vim.lsp.buf.references, opts)
        vim.keymap.set('n', '<space>vrn', vim.lsp.buf.rename, opts)
        -- vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
        -- vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
        -- vim.keymap.set(
        --     'n',
        --     '<space>wr',
        --     vim.lsp.buf.remove_workspace_folder,
        --     opts
        -- )
        -- vim.keymap.set('n', '<space>wl', function()
        --     print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        -- end, opts)
        -- vim.keymap.set('n', '<space>f', function()
        --     vim.lsp.buf.format({ async = true })
        -- end, opts)
    end,
})

-- vim.api.nvim_create_autocmd('LspAttach', {
--     group = vim.api.nvim_create_augroup('UserLspConfig', {}),
--     callback = function(ev)
--         local opts = { buffer = ev.buf, remap = false }
--         vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
--         vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
--         vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
--     end,
-- })
-- }}}

-- Telescope {{{
-- vim.api.nvim_set_keymap(
-- 	'n',
-- 	'gd',
-- 	'<cmd>Telescope lsp_definitions<CR>',
-- 	{ noremap = true }
-- ) -- Goto declaration
vim.api.nvim_set_keymap(
    'n',
    '<leader>fr',
    '<cmd>Telescope oldfiles<CR>',
    { noremap = true, desc = 'Find [r]ecent' }
) -- Show recent files
vim.api.nvim_set_keymap(
    'n',
    '<leader>fj',
    '<cmd>Telescope git_files<CR>',
    { noremap = true, desc = 'Find [j]it Files' }
) -- Search for a file in project
vim.api.nvim_set_keymap(
    'n',
    '<leader>ff',
    '<cmd>Telescope find_files<CR>',
    { noremap = true, desc = 'Find [f]iles' }
) -- Search for a file (ignoring dotfiles)
vim.api.nvim_set_keymap(
    'n',
    '<leader>fa',
    '<cmd>Telescope find_files hidden=true no_ignore=true<CR>',
    { noremap = true, desc = 'Find [a]ll Files' }
) -- Search for a file (with dotfiles)
-- vim.api.nvim_set_keymap(
-- 	'n',
-- 	'<leader>fp',
-- 	'<cmd>Telescope jumplist<CR>',
-- 	{ noremap = true }
-- ) -- Show jumplist (previous locations)
-- vim.api.nvim_set_keymap(
-- 	'n',
-- 	'<leader>fb',
-- 	'<cmd>Telescope git_branches<CR>',
-- 	{ noremap = true }
-- ) -- Show git branches
vim.api.nvim_set_keymap(
    'n',
    '<leader>fg',
    '<cmd>Telescope live_grep<CR>',
    { noremap = true, desc = 'Find text using [g]rep' }
) -- Find a string in project
vim.api.nvim_set_keymap(
    'n',
    '<leader>fb',
    '<cmd>Telescope buffers<CR>',
    { noremap = true, desc = 'Find [b]uffers' }
) -- Show all buffers
vim.api.nvim_set_keymap(
    'n',
    '<leader>f?',
    '<cmd>Telescope<CR>',
    { noremap = true, desc = 'Find ?' }
) -- Show all commands
-- vim.api.nvim_set_keymap(
--     'n',
--     '<leader>fs',
--     '<cmd>Telescope lsp_dynamic_workspace_symbols<CR>',
--     { noremap = true, desc = 'Find [s]ymbls' }
-- ) -- Search for dynamic symbols
vim.api.nvim_set_keymap(
    'n',
    '<leader>fu',
    '<cmd>Telescope undo<CR>',
    { noremap = true, desc = 'Find [u]ndo History' }
) -- Show undotree
-- vim.api.nvim_set_keymap(
-- 	'n',
-- 	'<leader>fn',
-- 	'<cmd>Telescope notify<CR>',
-- 	{ noremap = true , desc = 'Find [N]otification History' }
-- ) -- Show nvim-notify history
vim.api.nvim_set_keymap(
    'n',
    '<leader>fp',
    '<cmd>Telescope project<CR>',
    { noremap = true, desc = 'Find [p]rojects' }
) -- Show projects
vim.api.nvim_set_keymap(
    'n',
    '<leader>fd',
    '<cmd>Telescope diagnostics<CR>',
    { noremap = true, desc = 'Find [d]iagnostics' }
) -- Show diagnostics
vim.keymap.set('n', '<leader>f/', function()
    -- You can pass additional configuration to telescope to change theme, layout, etc.
    require('telescope.builtin').current_buffer_fuzzy_find(
        require('telescope.themes').get_dropdown({
            winblend = 10,
            previewer = false,
        })
    )
end, { desc = '[/] Fuzzily search in current buffer' })

-- }}}

-- netrw {{{
-- Open netrw on the right
vim.api.nvim_set_keymap(
    'n',
    '<leader>.',
    '<cmd>Sex<CR>',
    { noremap = true, desc = 'SEEX!!!' }
)
vim.api.nvim_set_keymap(
    'n',
    '<leader>n',
    '<cmd>Sex!<CR>',
    { noremap = true, desc = 'SEEX!!!' }
)
-- Open current window as netrw
vim.api.nvim_set_keymap(
    'n',
    '<leader>e',
    '<cmd>Ex<CR>',
    { noremap = true, desc = '[e]xplorer in current window' }
)
-- }}}

-- Buffers {{{
-- Tabs to move around buffers
-- vim.api.nvim_set_keymap('n', '<Tab>', '<cmd>bnext<CR>', { noremap = true })
-- vim.api.nvim_set_keymap('n', '<S-Tab>', '<cmd>bprev<CR>', { noremap = true })

function BufRem(number)
    local bufremove = require('mini.bufremove')
    if not bufremove.delete(number, false) then
        local choice = vim.fn.confirm(
            'Save changes to ' .. vim.fn.expand('%:p'),
            '&Yes\n&No\n&Cancel',
            3
        )

        if choice == 1 then
            vim.cmd('update')
            bufremove.delete(number, false)
        elseif choice == 2 then
            bufremove.delete(number, true)
        end
    end
    -- ToggleTabline()
end

vim.api.nvim_set_keymap(
    'n',
    '<leader>c',
    '<cmd>lua BufRem(0)<CR>',
    { noremap = true, desc = '[c]lose current buffer' }
)

-- vim.api.nvim_set_keymap(
--     'n',
--     '<leader>b',
--     '<cmd>lua ToggleBar()<CR>',
--     { noremap = true, desc = 'Toggle buffer [b]ar' }
-- )
-- }}}

-- vim-fugtive {{{
vim.api.nvim_set_keymap(
    'n',
    '<leader>gg',
    '<cmd>Git<CR>',
    { noremap = true, desc = '[g]it' }
)
vim.api.nvim_set_keymap(
    'n',
    '<leader>gd',
    '<cmd>Git diff<CR>',
    { noremap = true, desc = 'Git [d]iff' }
)
vim.api.nvim_set_keymap(
    'n',
    '<leader>gc',
    '<cmd>Git commit<CR>',
    { noremap = true, desc = 'Git [c]ommit' }
)
vim.api.nvim_set_keymap(
    'n',
    '<leader>gaa',
    '<cmd>Git add %<CR>',
    { noremap = true, desc = 'Git Add [a]ll' }
)
vim.api.nvim_set_keymap(
    'n',
    '<leader>gac',
    '<cmd>Git add %<CR>',
    { noremap = true, desc = 'Git Add [c]urrent buffer' }
)
vim.api.nvim_set_keymap(
    'n',
    '<leader>gs',
    '<cmd>Git show<CR>',
    { noremap = true, desc = 'Git [s]how' }
)
vim.api.nvim_set_keymap(
    'n',
    '<leader>gp',
    '<cmd>Git push<CR>',
    { noremap = true, desc = 'Git [p]ush' }
)
-- }}}

-- Diagnostic keymaps{{{
-- vim.keymap.set(
--     'n',
--     '[d',
--     vim.diagnostic.goto_prev,
--     { desc = 'Go to previous diagnostic message' }
-- )
-- vim.keymap.set(
--     'n',
--     ']d',
--     vim.diagnostic.goto_next,
--     { desc = 'Go to next diagnostic message' }
-- )
-- vim.keymap.set(
-- 	'n',
-- 	'<leader>e',
-- 	vim.diagnostic.open_float,
-- 	{ desc = 'Open floating diagnostic message' }
-- )
-- vim.keymap.set(
-- 	'n',
-- 	'<leader>q',
-- 	vim.diagnostic.setloclist,
-- 	{ desc = 'Open diagnostics list' }
-- )
-- }}}

-- Luasnips{{{
vim.keymap.set({ 'i' }, '<C-K>', function()
    require('luasnip').expand()
end, { silent = true })
vim.keymap.set({ 'i', 's' }, '<C-L>', function()
    require('luasnip').jump(1)
end, { silent = true })
vim.keymap.set({ 'i', 's' }, '<C-J>', function()
    require('luasnip').jump(-1)
end, { silent = true })

vim.keymap.set({ 'i', 's' }, '<C-E>', function()
    if require('luasnip').choice_active() then
        require('luasnip').change_choice(1)
    end
end, { silent = true })
-- }}}
