-- Keymaps for better default experience
-- See `:help vim.api.nvim_set_keymap()`
-- vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap{{{
vim.api.nvim_set_keymap(
	'n',
	'k',
	"v:count == 0 ? 'gk' : 'k'",
	{ expr = true, silent = true }
)
vim.api.nvim_set_keymap(
	'n',
	'j',
	"v:count == 0 ? 'gj' : 'j'",
	{ expr = true, silent = true }
) -- }}}

-- Custom {{{
-- Easier Indent moving in
vim.api.nvim_set_keymap('v', '>', '> gv', { noremap = true })
vim.api.nvim_set_keymap('v', '<', '< gv', { noremap = true })

-- Space + y|d yanks or cuts to system clipboard
vim.keymap.set({ 'n', 'v' }, '<leader>y', '"+y', { noremap = true })
vim.keymap.set({ 'n', 'v' }, '<leader>d', '"+d', { noremap = true })
-- Correct Pasting
vim.keymap.set(
	{ 'n', 'v' },
	'<leader>p',
	'<CMD> set paste<CR>"+p<CMD>set paste!<CR>',
	{ noremap = true }
)
vim.keymap.set(
	{ 'n', 'v' },
	'<leader>P',
	'<CMD> set paste<CR>"+P<CMD>set paste!<CR>',
	{ noremap = true }
)

-- local function bufdel ()
--   local currentbuf = vim.api.nvim_get_current_buf()
--   local bufremove = require("mini.bufremove")
--   if not bufremove.delete(currentbuf, false) then
--     local choice = vim.fn.confirm("Save changes to " .. vim.fn.expand("%:p"), "&Yes\n&No\n&Cancel", 3)
--
--     if choice == 1 then
--         vim.cmd('update')
--         bufremove.delete(currentbuf, false)
--     elseif choice == 2 then
--         bufremove.delete(currentbuf, true)
--     end
--   end
-- end

-- nm('<leader>c', bufdel())
-- fat \/
-- vim.api.nvim_set_keymap('-- n', '<leader>ww', '<CMD>w<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>w', '<CMD>w<CR>', { noremap = true })

-- Middle positioned C+ D/U
vim.api.nvim_set_keymap('n', '<C-d>', '<C-d>zz', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-u>', '<C-u>zz', { noremap = true })
-- }}}

-- Harpoon {{{
vim.api.nvim_set_keymap(
	'n',
	'<leader>a',
	'<CMD> lua require("harpoon.mark").add_file() <CR>',
	{ noremap = true }
)
vim.api.nvim_set_keymap(
	'n',
	'<leader>`',
	'<CMD> lua require("harpoon.ui").toggle_quick_menu() <CR>',
	{ noremap = true }
)
vim.api.nvim_set_keymap(
	'n',
	'<leader>1',
	'<CMD> lua require("harpoon.ui").nav_file(1) <CR>',
	{ noremap = true }
)
vim.api.nvim_set_keymap(
	'n',
	'<leader>2',
	'<CMD> lua require("harpoon.ui").nav_file(2) <CR>',
	{ noremap = true }
)
vim.api.nvim_set_keymap(
	'n',
	'<leader>3',
	'<CMD> lua require("harpoon.ui").nav_file(3) <CR>',
	{ noremap = true }
)
vim.api.nvim_set_keymap(
	'n',
	'<leader>4',
	'<CMD> lua require("harpoon.ui").nav_file(4) <CR>',
	{ noremap = true }
)
vim.api.nvim_set_keymap(
	'n',
	'<leader>5',
	'<CMD> lua require("harpoon.ui").nav_file(5) <CR>',
	{ noremap = true }
)
vim.api.nvim_set_keymap(
	'n',
	'<leader>6',
	'<CMD> lua require("harpoon.ui").nav_file(6) <CR>',
	{ noremap = true }
)
-- }}}

-- LSP {{{
vim.api.nvim_set_keymap(
	'n',
	'K',
	'<cmd>lua vim.lsp.buf.hover()<CR>',
	{ noremap = true }
) -- Hover object
vim.api.nvim_set_keymap(
	'n',
	'ga',
	'<cmd>lua vim.lsp.buf.code_action()<CR>',
	{ noremap = true }
) -- Code actions
vim.api.nvim_set_keymap(
	'n',
	'gR',
	'<cmd>lua vim.lsp.buf.rename()<CR>',
	{ noremap = true }
) -- Rename an object
vim.api.nvim_set_keymap(
	'n',
	'gD',
	'<cmd>lua vim.lsp.buf.declaration()<cr>',
	{ noremap = true }
) -- Go to declaration
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
	{ noremap = true }
) -- Show recent files
vim.api.nvim_set_keymap(
	'n',
	'<leader>fj',
	'<cmd>Telescope git_files<CR>',
	{ noremap = true }
) -- Search for a file in project
vim.api.nvim_set_keymap(
	'n',
	'<leader>ff',
	'<cmd>Telescope find_files<CR>',
	{ noremap = true }
) -- Search for a file (ignoring dotfiles)
vim.api.nvim_set_keymap(
	'n',
	'<leader>fa',
	'<cmd>Telescope find_files hidden=true no_ignore=true<CR>',
	{ noremap = true }
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
	{ noremap = true }
) -- Find a string in project
vim.api.nvim_set_keymap(
	'n',
	'<leader>fb',
	'<cmd>Telescope buffers<CR>',
	{ noremap = true }
) -- Show all buffers
vim.api.nvim_set_keymap(
	'n',
	'<leader>f?',
	'<cmd>Telescope<CR>',
	{ noremap = true }
) -- Show all commands
vim.api.nvim_set_keymap(
	'n',
	'<leader>fs',
	'<cmd>Telescope lsp_dynamic_workspace_symbols<CR>',
	{ noremap = true }
) -- Search for dynamic symbols
vim.api.nvim_set_keymap(
	'n',
	'<leader>fu',
	'<cmd>Telescope undo<CR>',
	{ noremap = true }
) -- Show undotree
vim.api.nvim_set_keymap(
	'n',
	'<leader>fn',
	'<cmd>Telescope notify<CR>',
	{ noremap = true }
) -- Show nvim-notify history
-- }}}

-- Neo Tree {{{
vim.api.nvim_set_keymap(
	'n',
	'<leader>n',
	'<cmd>Neotree toggle<CR>',
	{ noremap = true }
) -- Toggle file explorer
vim.api.nvim_set_keymap(
	'n',
	'<leader>e',
	'<cmd>Neotree focus<CR>',
	{ noremap = true }
) -- Focus file explorer
-- }}}

-- Buffers {{{
-- Tabs to move around buffers
vim.api.nvim_set_keymap('n', '<Tab>', '<cmd>bnext<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<S-Tab>', '<cmd>bprev<CR>', { noremap = true })

vim.api.nvim_set_keymap(
	'n',
	'<leader>c',
	'<cmd>lua BufRem(0)<CR>',
	{ noremap = true }
)
-- }}}

-- vim-fugtive {{{
vim.api.nvim_set_keymap('n', '<leader>gg', '<cmd>Git<CR>', { noremap = true })
vim.api.nvim_set_keymap(
	'n',
	'<leader>gd',
	'<cmd>Git diff<CR>',
	{ noremap = true }
)
vim.api.nvim_set_keymap(
	'n',
	'<leader>gc',
	'<cmd>Git commit<CR>',
	{ noremap = true }
)
vim.api.nvim_set_keymap(
	'n',
	'<leader>ga',
	'<cmd>Git add<CR>',
	{ noremap = true }
)
vim.api.nvim_set_keymap(
	'n',
	'<leader>gs',
	'<cmd>Git show<CR>',
	{ noremap = true }
)
-- }}}

-- Troublin{{{
vim.api.nvim_set_keymap(
	'n',
	'<leader>xx',
	'<cmd>TroubleToggle<cr>',
	{ noremap = true }
)
vim.api.nvim_set_keymap(
	'n',
	'<leader>xw',
	'<cmd>TroubleToggle workspace_diagnostics<cr>',
	{ noremap = true }
)
vim.api.nvim_set_keymap(
	'n',
	'<leader>xd',
	'<cmd>TroubleToggle document_diagnostics<cr>',
	{ noremap = true }
)
vim.api.nvim_set_keymap(
	'n',
	'<leader>xq',
	'<cmd>TroubleToggle quickfix<cr>',
	{ noremap = true }
)
vim.api.nvim_set_keymap(
	'n',
	'<leader>xl',
	'<cmd>TroubleToggle loclist<cr>',
	{ noremap = true }
)
vim.api.nvim_set_keymap(
	'n',
	'gR',
	'<cmd>TroubleToggle lsp_references<cr>',
	{ noremap = true }
)
-- }}}

-- Diagnostic keymaps{{{
vim.keymap.set(
	'n',
	'[d',
	vim.diagnostic.goto_prev,
	{ desc = 'Go to previous diagnostic message' }
)
vim.keymap.set(
	'n',
	']d',
	vim.diagnostic.goto_next,
	{ desc = 'Go to next diagnostic message' }
)
vim.keymap.set(
	'n',
	'<leader>e',
	vim.diagnostic.open_float,
	{ desc = 'Open floating diagnostic message' }
)
vim.keymap.set(
	'n',
	'<leader>q',
	vim.diagnostic.setloclist,
	{ desc = 'Open diagnostics list' }
) -- }}}

-- See `:help telescope.builtin`{{{
-- vim.api.nvim_set_keymap(
-- 	'n',
-- 	'<leader>?',
-- 	require('telescope.builtin').oldfiles,
-- 	{ desc = '[?] Find recently opened files' }
-- )
-- vim.api.nvim_set_keymap(
-- 	'n',
-- 	'<leader><space>',
-- 	require('telescope.builtin').buffers,
-- 	{ desc = '[ ] Find existing buffers' }
-- )
-- vim.api.nvim_set_keymap('n', '<leader>/', function()
-- 	-- You can pass additional configuration to telescope to change theme, layout, etc.
-- 	require('telescope.builtin').current_buffer_fuzzy_find(
-- 		require('telescope.themes').get_dropdown({
-- 			winblend = 10,
-- 			previewer = false,
-- 		})
-- 	)
-- end, { desc = '[/] Fuzzily search in current buffer' })
--
-- vim.api.nvim_set_keymap(
-- 	'n',
-- 	'<leader>gf',
-- 	require('telescope.builtin').git_files,
-- 	{ desc = 'Search [G]it [F]iles' }
-- )
-- vim.api.nvim_set_keymap(
-- 	'n',
-- 	'<leader>sf',
-- 	require('telescope.builtin').find_files,
-- 	{ desc = '[S]earch [F]iles' }
-- )
-- vim.api.nvim_set_keymap(
-- 	'n',
-- 	'<leader>sh',
-- 	require('telescope.builtin').help_tags,
-- 	{ desc = '[S]earch [H]elp' }
-- )
-- vim.api.nvim_set_keymap(
-- 	'n',
-- 	'<leader>sw',
-- 	require('telescope.builtin').grep_string,
-- 	{ desc = '[S]earch current [W]ord' }
-- )
-- vim.api.nvim_set_keymap(
-- 	'n',
-- 	'<leader>sg',
-- 	require('telescope.builtin').live_grep,
-- 	{ desc = '[S]earch by [G]rep' }
-- )
-- vim.api.nvim_set_keymap(
-- 	'n',
-- 	'<leader>sd',
-- 	require('telescope.builtin').diagnostics,
-- 	{ desc = '[S]earch [D]iagnostics' }
-- )
-- vim.api.nvim_set_keymap(
-- 	'n',
-- 	'<leader>sr',
-- 	require('telescope.builtin').resume,
-- 	{ desc = '[S]earch [R]esume' }
-- )}}}

-- Luasnips{{{
vim.keymap.set({ 'i' }, '<C-K>', function()
	require('luasnip').expand()
end, { silent = true })
vim.keymap.set({ 'i', 's' }, '<Tab>', function()
	require('luasnip').jump(1)
end, { silent = true })
vim.keymap.set({ 'i', 's' }, '<S-Tab>', function()
	require('luasnip').jump(-1)
end, { silent = true })

vim.keymap.set({ 'i', 's' }, '<C-E>', function()
	if require('luasnip').choice_active() then
		require('luasnip').change_choice(1)
	end
end, { silent = true }) -- }}}
