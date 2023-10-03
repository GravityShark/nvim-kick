-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set(
	'n',
	'k',
	"v:count == 0 ? 'gk' : 'k'",
	{ expr = true, silent = true }
)
vim.keymap.set(
	'n',
	'j',
	"v:count == 0 ? 'gj' : 'j'",
	{ expr = true, silent = true }
)

-- g.maplocalleader = ','                                                                 -- Use Space, like key for alternative hotkeys
-- Custom {{{
-- Easier Indent moving in
vim.keymap.set('v', '>', '> gv', { noremap = true })
vim.keymap.set('v', '<', '< gv', { noremap = true })

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
vim.keymap.set(
	'n',
	'<leader>c',
	'<CMD>lua require("extensions.bufferline").bufrem(vim.api.nvim_get_current_buf())<CR>'
)
-- vim.keymap.set('-- n', '<leader>ww', '<CMD>w<CR>', {noremap = true})
vim.keymap.set('n', '<leader>w', '<CMD>w<CR>', { noremap = true })

-- Middle positioned C+ D/U
vim.keymap.set('n', '<C-d>', '<C-d>zz', { noremap = true })
vim.keymap.set('n', '<C-u>', '<C-u>zz', { noremap = true })
-- }}}

-- Harpoon {{{
vim.keymap.set(
	'n',
	'<leader>a',
	'<CMD> lua require("harpoon.mark").add_file() <CR>',
	{ noremap = true }
)
vim.keymap.set(
	'n',
	'<leader>`',
	'<CMD> lua require("harpoon.ui").toggle_quick_menu() <CR>',
	{ noremap = true }
)
vim.keymap.set(
	'n',
	'<leader>1',
	'<CMD> lua require("harpoon.ui").nav_file(1) <CR>',
	{ noremap = true }
)
vim.keymap.set(
	'n',
	'<leader>2',
	'<CMD> lua require("harpoon.ui").nav_file(2) <CR>',
	{ noremap = true }
)
vim.keymap.set(
	'n',
	'<leader>3',
	'<CMD> lua require("harpoon.ui").nav_file(3) <CR>',
	{ noremap = true }
)
vim.keymap.set(
	'n',
	'<leader>4',
	'<CMD> lua require("harpoon.ui").nav_file(4) <CR>',
	{ noremap = true }
)
vim.keymap.set(
	'n',
	'<leader>5',
	'<CMD> lua require("harpoon.ui").nav_file(5) <CR>',
	{ noremap = true }
)
vim.keymap.set(
	'n',
	'<leader>6',
	'<CMD> lua require("harpoon.ui").nav_file(6) <CR>',
	{ noremap = true }
)
-- }}}

-- LSP {{{
vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', { noremap = true }) -- Hover object
vim.keymap.set(
	'n',
	'ga',
	'<cmd>lua vim.lsp.buf.code_action()<CR>',
	{ noremap = true }
) -- Code actions
vim.keymap.set(
	'n',
	'gR',
	'<cmd>lua vim.lsp.buf.rename()<CR>',
	{ noremap = true }
) -- Rename an object
vim.keymap.set(
	'n',
	'gD',
	'<cmd>lua vim.lsp.buf.declaration()<cr>',
	{ noremap = true }
) -- Go to declaration
-- }}}

-- Telescope {{{
vim.keymap.set(
	'n',
	'gd',
	'<cmd>Telescope lsp_definitions<CR>',
	{ noremap = true }
) -- Goto declaration
vim.keymap.set(
	'n',
	'<leader>fr',
	'<cmd>Telescope oldfiles<CR>',
	{ noremap = true }
) -- Show recent files
vim.keymap.set(
	'n',
	'<leader>fg',
	'<cmd>Telescope git_files<CR>',
	{ noremap = true }
) -- Search for a file in project
vim.keymap.set(
	'n',
	'<leader>ff',
	'<cmd>Telescope find_files<CR>',
	{ noremap = true }
) -- Search for a file (ignoring dotfiles)
vim.keymap.set(
	'n',
	'<leader>fa',
	'<cmd>Telescope find_files hidden=true no_ignore=true<CR>',
	{ noremap = true }
) -- Search for a file (with dotfiles)
vim.keymap.set(
	'n',
	'<leader>fp',
	'<cmd>Telescope jumplist<CR>',
	{ noremap = true }
) -- Show jumplist (previous locations)
vim.keymap.set(
	'n',
	'<leader>fb',
	'<cmd>Telescope git_branches<CR>',
	{ noremap = true }
) -- Show git branches
vim.keymap.set(
	'n',
	'<leader>fg',
	'<cmd>Telescope live_grep<CR>',
	{ noremap = true }
) -- Find a string in project
vim.keymap.set(
	'n',
	'<leader>ft',
	'<cmd>Telescope buffers<CR>',
	{ noremap = true }
) -- Show all buffers
vim.keymap.set('n', '<leader>f?', '<cmd>Telescope<CR>', { noremap = true }) -- Show all commands
vim.keymap.set(
	'n',
	'<leader>fs',
	'<cmd>Telescope lsp_dynamic_workspace_symbols<CR>',
	{ noremap = true }
) -- Search for dynamic symbols
vim.keymap.set('n', '<leader>fu', '<cmd>Telescope undo<CR>', { noremap = true }) -- Show undotree
vim.keymap.set(
	'n',
	'<leader>fn',
	'<cmd>Telescope notify<CR>',
	{ noremap = true }
) -- Show nvim-notify history
-- }}}

-- Neo Tree {{{
vim.keymap.set('n', '<leader>n', '<cmd>Neotree toggle<CR>', { noremap = true }) -- Toggle file explorer
vim.keymap.set('n', '<leader>e', '<cmd>Neotree focus<CR>', { noremap = true }) -- Focus file explorer
-- }}}

-- Bufferline {{{
vim.keymap.set('n', '<Tab>', '<cmd>BufferLineCycleNext<CR>', { noremap = true }) -- Toggle file explorer
vim.keymap.set(
	'n',
	'<S-Tab>',
	'<cmd>BufferLineCyclePrev<CR>',
	{ noremap = true }
) -- Toggle file explorer
-- }}}

-- vim undotree
vim.keymap.set('n', '<leader>u', '<cmd>UndotreeToggle<CR>', { noremap = true }) -- Toggle file explorer
vim.keymap.set('n', '<leader>i', '<cmd>UndotreeFocus<CR>', { noremap = true }) -- Toggle file explorer
-- nm('<leader>i', '<cmd>UndotreeHide<CR>')                                        -- Toggle file explorer

-- vim-fugtive {{{
vim.keymap.set('n', '<leader>gg', '<cmd>Git<CR>', { noremap = true })
vim.keymap.set('n', '<leader>gd', '<cmd>Git diff<CR>', { noremap = true })
vim.keymap.set('n', '<leader>gc', '<cmd>Git commit<CR>', { noremap = true })
vim.keymap.set('n', '<leader>ga', '<cmd>Git add<CR>', { noremap = true })
vim.keymap.set('n', '<leader>gs', '<cmd>Git show<CR>', { noremap = true })
-- nm('<leader>gp', '<cmd>Git pull<CR>')
-- nm('<leader>gP', '<cmd>Git push<CR>')
-- }}}

-- Troublin{{{
vim.keymap.set('n', '<leader>xx', '<cmd>TroubleToggle<cr>', { noremap = true })
vim.keymap.set(
	'n',
	'<leader>xw',
	'<cmd>TroubleToggle workspace_diagnostics<cr>',
	{ noremap = true }
)
vim.keymap.set(
	'n',
	'<leader>xd',
	'<cmd>TroubleToggle document_diagnostics<cr>',
	{ noremap = true }
)
vim.keymap.set(
	'n',
	'<leader>xq',
	'<cmd>TroubleToggle quickfix<cr>',
	{ noremap = true }
)
vim.keymap.set(
	'n',
	'<leader>xl',
	'<cmd>TroubleToggle loclist<cr>',
	{ noremap = true }
)
vim.keymap.set(
	'n',
	'gR',
	'<cmd>TroubleToggle lsp_references<cr>',
	{ noremap = true }
)
-- }}}

-- Diagnostic keymaps
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
)

-- See `:help telescope.builtin`
vim.keymap.set(
	'n',
	'<leader>?',
	require('telescope.builtin').oldfiles,
	{ desc = '[?] Find recently opened files' }
)
vim.keymap.set(
	'n',
	'<leader><space>',
	require('telescope.builtin').buffers,
	{ desc = '[ ] Find existing buffers' }
)
vim.keymap.set('n', '<leader>/', function()
	-- You can pass additional configuration to telescope to change theme, layout, etc.
	require('telescope.builtin').current_buffer_fuzzy_find(
		require('telescope.themes').get_dropdown({
			winblend = 10,
			previewer = false,
		})
	)
end, { desc = '[/] Fuzzily search in current buffer' })

vim.keymap.set(
	'n',
	'<leader>gf',
	require('telescope.builtin').git_files,
	{ desc = 'Search [G]it [F]iles' }
)
vim.keymap.set(
	'n',
	'<leader>sf',
	require('telescope.builtin').find_files,
	{ desc = '[S]earch [F]iles' }
)
vim.keymap.set(
	'n',
	'<leader>sh',
	require('telescope.builtin').help_tags,
	{ desc = '[S]earch [H]elp' }
)
vim.keymap.set(
	'n',
	'<leader>sw',
	require('telescope.builtin').grep_string,
	{ desc = '[S]earch current [W]ord' }
)
vim.keymap.set(
	'n',
	'<leader>sg',
	require('telescope.builtin').live_grep,
	{ desc = '[S]earch by [G]rep' }
)
vim.keymap.set(
	'n',
	'<leader>sd',
	require('telescope.builtin').diagnostics,
	{ desc = '[S]earch [D]iagnostics' }
)
vim.keymap.set(
	'n',
	'<leader>sr',
	require('telescope.builtin').resume,
	{ desc = '[S]earch [R]esume' }
)
