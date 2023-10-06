-- Keymaps for better default experience
-- See `:help vim.api.nvim_set_keymap()`
-- vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- X Remap for dealing with word wrap{{{
-- vim.api.nvim_set_keymap(
-- 	'n',
-- 	'k',
-- 	"v:count == 0 ? 'gk' : 'k'",
-- 	{ expr = true, silent = true }
-- )
-- vim.api.nvim_set_keymap(
-- 	'n',
-- 	'j',
-- 	"v:count == 0 ? 'gj' : 'j'",
-- 	{ expr = true, silent = true }
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

-- X Save keymap{{{
-- vim.api.nvim_set_keymap('n', '<leader>w', '<CMD>w<CR>', { noremap = true })}}}

-- Middle positioned C+ D/U{{{
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
) -- }}}

-- Harpoon {{{
vim.api.nvim_set_keymap(
	'n',
	'<leader>a',
	'<CMD> lua require("harpoon.mark").add_file() <CR>',
	{ noremap = true, desc = 'Harpoon [A]dd' }
)
vim.api.nvim_set_keymap(
	'n',
	'<leader>`',
	'<CMD> lua require("harpoon.ui").toggle_quick_menu() <CR>',
	{ noremap = true, desc = 'Harpoon Open Menu' }
)
vim.api.nvim_set_keymap(
	'n',
	'<A-1>',
	'<CMD> lua require("harpoon.ui").nav_file(1) <CR>',
	{ noremap = true }
)
vim.api.nvim_set_keymap(
	'n',
	'<A-2>',
	'<CMD> lua require("harpoon.ui").nav_file(2) <CR>',
	{ noremap = true }
)
vim.api.nvim_set_keymap(
	'n',
	'<A-3>',
	'<CMD> lua require("harpoon.ui").nav_file(3) <CR>',
	{ noremap = true }
)
vim.api.nvim_set_keymap(
	'n',
	'<A-4>',
	'<CMD> lua require("harpoon.ui").nav_file(4) <CR>',
	{ noremap = true }
)
vim.api.nvim_set_keymap(
	'n',
	'<A-5>',
	'<CMD> lua require("harpoon.ui").nav_file(5) <CR>',
	{ noremap = true }
)
vim.api.nvim_set_keymap(
	'n',
	'<A-6>',
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
	{ noremap = true, desc = 'Find [R]ecent' }
) -- Show recent files
vim.api.nvim_set_keymap(
	'n',
	'<leader>fj',
	'<cmd>Telescope git_files<CR>',
	{ noremap = true, desc = 'Find [G]it Files' }
) -- Search for a file in project
vim.api.nvim_set_keymap(
	'n',
	'<leader>ff',
	'<cmd>Telescope find_files<CR>',
	{ noremap = true, desc = 'Find [F]iles' }
) -- Search for a file (ignoring dotfiles)
vim.api.nvim_set_keymap(
	'n',
	'<leader>fa',
	'<cmd>Telescope find_files hidden=true no_ignore=true<CR>',
	{ noremap = true, desc = 'Find [A]ll Files' }
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
	{ noremap = true, desc = 'Find text using [G]rep' }
) -- Find a string in project
vim.api.nvim_set_keymap(
	'n',
	'<leader>fb',
	'<cmd>Telescope buffers<CR>',
	{ noremap = true, desc = 'Find [B]uffers' }
) -- Show all buffers
vim.api.nvim_set_keymap(
	'n',
	'<leader>f?',
	'<cmd>Telescope<CR>',
	{ noremap = true, desc = 'Find ?' }
) -- Show all commands
vim.api.nvim_set_keymap(
	'n',
	'<leader>fs',
	'<cmd>Telescope lsp_dynamic_workspace_symbols<CR>',
	{ noremap = true, desc = 'Find [N]' }
) -- Search for dynamic symbols
vim.api.nvim_set_keymap(
	'n',
	'<leader>fu',
	'<cmd>Telescope undo<CR>',
	{ noremap = true, desc = 'Find [U]ndo History' }
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
	{ noremap = true, desc = 'Find [P]rojects' }
) -- Show projects
vim.api.nvim_set_keymap(
	'n',
	'<leader>fd',
	'<cmd>Telescope diagnostics<CR>',
	{ noremap = true, desc = 'Find [D]iagnostics' }
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
	'<leader>n',
	'<cmd>Vex!<CR>',
	{ noremap = true, desc = 'SEEX!!!' }
)
-- Open current window as netrw
vim.api.nvim_set_keymap(
	'n',
	'<leader>e',
	'<cmd>Ex<CR>',
	{ noremap = true, desc = '[E]xplorer in current window' }
)
-- }}}

-- Buffers {{{
-- Tabs to move around buffers
vim.api.nvim_set_keymap('n', '<Tab>', '<cmd>bnext<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<S-Tab>', '<cmd>bprev<CR>', { noremap = true })

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
end

vim.api.nvim_set_keymap(
	'n',
	'<leader>c',
	'<cmd>lua BufRem(0)<CR>',
	{ noremap = true, desc = '[C]lose current buffer' }
)
-- }}}

-- vim-fugtive {{{
vim.api.nvim_set_keymap(
	'n',
	'<leader>gg',
	'<cmd>Git<CR>',
	{ noremap = true, desc = '[G]it' }
)
vim.api.nvim_set_keymap(
	'n',
	'<leader>gd',
	'<cmd>Git diff<CR>',
	{ noremap = true, desc = 'Git [C]ommit' }
)
vim.api.nvim_set_keymap(
	'n',
	'<leader>gc',
	'<cmd>Git commit<CR>',
	{ noremap = true, desc = 'Git [C]ommit' }
)
vim.api.nvim_set_keymap(
	'n',
	'<leader>ga',
	'<cmd>Git add %<CR>',
	{ noremap = true, desc = 'Git [A]dd current buffer' }
)
vim.api.nvim_set_keymap(
	'n',
	'<leader>gs',
	'<cmd>Git show<CR>',
	{ noremap = true, desc = 'Git [S]how' }
)
-- }}}

-- Troublin{{{
vim.api.nvim_set_keymap(
	'n',
	'<leader>xx',
	'<cmd>TroubleToggle<cr>',
	{ noremap = true, desc = 'Trouble [T]oggle' }
)
vim.api.nvim_set_keymap(
	'n',
	'<leader>xw',
	'<cmd>TroubleToggle workspace_diagnostics<cr>',
	{ noremap = true, desc = 'Trouble [W]orkspace Diagnostics' }
)
vim.api.nvim_set_keymap(
	'n',
	'<leader>xd',
	'<cmd>TroubleToggle document_diagnostics<cr>',
	{ noremap = true, desc = 'Trouble [D]ocument Diagnostics' }
)
vim.api.nvim_set_keymap(
	'n',
	'<leader>xq',
	'<cmd>TroubleToggle quickfix<cr>',
	{ noremap = true, desc = 'Trouble [Q]uick Fix' }
)
vim.api.nvim_set_keymap(
	'n',
	'<leader>xl',
	'<cmd>TroubleToggle loclist<cr>',
	{ noremap = true, desc = 'Trouble [L]OC/Diagnostic List' }
)
vim.api.nvim_set_keymap(
	'n',
	'gR',
	'<cmd>TroubleToggle lsp_references<cr>',
	{ noremap = true, desc = 'Trouble LSP [R]eferences' }
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
vim.keymap.set({ 's' }, '<Tab>', function()
	require('luasnip').jump(1)
end, { silent = true })
vim.keymap.set({ 's' }, '<S-Tab>', function()
	require('luasnip').jump(-1)
end, { silent = true })

vim.keymap.set({ 'i', 's' }, '<C-e>', function()
	if require('luasnip').choice_active() then
		require('luasnip').change_choice(1)
	end
end, { silent = true }) -- }}}
