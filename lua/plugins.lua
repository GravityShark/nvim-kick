local LazyFile = { 'BufReadPost', 'BufWritePost', 'BufNewFile' }
local VeryLazyFile = { 'BufReadPost', 'BufWritePost', 'BufNewFile', 'VeryLazy' }

-- Please Read the README.md
return {

	-- Starttime Makes me feel good {{{
	{
		'dstein64/vim-startuptime',
		cmd = 'StartupTime',
		init = function()
			vim.g.startuptime_tries = 100
		end,
	},
	-- }}}

	-- Theme {{{

	-- Statusline {{{
	{
		'echasnovski/mini.statusline',
		opts = { set_vim_settings = false },
		lazy = false,
	},
	-- }}}

	-- go to the lua/colorscheme dir to see more
	-- vim.cmd.colorscheme('habamax'),
	require('colorscheme.monokai'),
	require('colorscheme.transparent'),

	-- }}}

	-- mini.nvim {{{

	-- better (a)round and (i)nside commands{{{
	{ 'echasnovski/mini.ai',       event = 'VeryLazy', opts = {} },
	-- }}}
	-- better f/F and t/T{{{
	{
		'echasnovski/mini.jump',
		keys = { 'f', 'F', 't', 'T', ';' },
		opts = { highlight = 0 },
	},
	-- }}}
	-- Auto pairs (){{{
	{
		'echasnovski/mini.pairs',
		event = 'InsertEnter',
		opts = {},
	}, -- }}}
	-- Indent indicators{{{
	{
		'echasnovski/mini.indentscope',
		event = LazyFile,
		opts = {
			-- symbol = '▎',
			-- symbol = "▏",
			symbol = '│',
			options = { try_as_border = true },
		},
	},
	-- }}}
	-- "gcc/gc" to comment visual regions/lines{{{
	{
		'echasnovski/mini.comment',
		keys = { 'gcc', { 'gc', mode = 'v' } },
		opts = {},
	},
	-- }}}
	-- Fast bufferline{{{
	{
		'echasnovski/mini.tabline',
		-- event = { 'BufReadPost', 'BufNewFile' },
		dependencies = 'nvim-tree/nvim-web-devicons',
		opts = { set_vim_settings = false },
	},
	-- }}}
	-- Kill buffers and preserve window layout{{{
	{ 'echasnovski/mini.bufremove' },
	-- }}}
	-- 's' to surround with '' or (){{{
	{
		'echasnovski/mini.surround',
		keys = {
			{ 'sa', mode = 'v' },
			'sa',
			'sd',
			'sr',
			'sf',
			'sF',
			'sh',
			'sn',
		},
		opts = {},
	},
	-- }}}
	-- Animations on things{{{

	{
		'echasnovski/mini.animate',
		event = 'VeryLazy',
		enabled = function()
			if vim.g.neovide then
				return false
			else
				return true
			end
		end,
		opts = {
			scroll = {
				enable = false,
			},
		},
	},

	-- }}}
	-- Which-key but kinda good but bad??{{{
	{
		'echasnovski/mini.clue',
		keys = {
			'<leader>',
			'z',
			'g',
			"'",
			'"',
			'`',
			'<C-w>',
			{ '<C-r>', mode = 'i' },
			{ '<C-x>', mode = 'i' },
		},
		config = function()
			require('pluggers.mini-clue')
		end,
	},
	-- }}}
	-- Illuminate same words{{{
	{
		'echasnovski/mini.cursorword',
		event = VeryLazyFile,
		opts = {},
	},
	-- }}}

	-- }}}

	-- LSP & Mason {{{
	{
		-- LSP Configuration & Plugins
		'neovim/nvim-lspconfig',
		event = LazyFile,
		config = function()
			require('pluggers.lspconfig')
		end,
		dependencies = {
			-- Easy installation of LSPs and more
			{ 'williamboman/mason.nvim', cmd = 'Mason',  opts = {} },

			-- Easier configuration, might remove
			'williamboman/mason-lspconfig.nvim',

			-- Better Neovim Lua LSP configuration
			'folke/neodev.nvim',

			-- Shows a little widget showing the status of LSP
			{ 'j-hui/fidget.nvim',       tag = 'legacy', opts = {} },

			-- Allows the usage of Linters and Formatters
			{
				'nvimtools/none-ls.nvim',
				config = function()
					require('pluggers.none-ls')
				end,
			},
			-- No time to make work
		},
	},

	-- }}}

	-- Trouble Diagnostic Viewer {{{
	{
		'folke/trouble.nvim',
		cmd = { 'TroubleToggle' },
		keys = { {
			'<leader>x',
			'<CMD>TroubleToggle<CR>',
			desc = 'Trouble [x] Toggle',
		}, {
			'<leader>xw',
			'<cmd>TroubleToggle workspace_diagnostics<cr>',
			desc = 'Trouble [w]orkspace Diagnostics',
		}, {
			'<leader>xd',
			'<cmd>TroubleToggle document_diagnostics<cr>',
			desc = 'Trouble [d]ocument Diagnostics',
		}, {
			'<leader>xq',
			'<cmd>TroubleToggle quickfix<cr>',
			desc = 'Trouble [q]uickfix',
		}, {
			'<leader>xl',
			'<cmd>TroubleToggle loclist<cr>',
			desc = 'Trouble [l]OC/Diagnostic List',
		}, {
			'gR',
			'<cmd>TroubleToggle lsp_references<cr>',
			desc = 'Trouble LSP [R]eferences',
		}
		},
	},
	-- }}}

	-- Completion {{{
	{
		-- Autocompletion
		'hrsh7th/nvim-cmp',
		event = 'InsertEnter',
		dependencies = {
			-- Adds paths to sources
			'hrsh7th/cmp-path',

			-- Adds LSP completion capabilities
			'hrsh7th/cmp-nvim-lsp',

			-- Adds the built-in vim auto-complete
			'hrsh7th/cmp-buffer',

			-- Snippet Engine & its associated nvim-cmp source
			'L3MON4D3/LuaSnip',
			'saadparwaiz1/cmp_luasnip',

			-- Adds a number of user-friendly snippets
			'rafamadriz/friendly-snippets',
		},
		config = function()
			require('pluggers.cmp')
		end,
	}, -- }}}

	-- Fuzzy Finder (files, lsp, etc) {{{
	{
		'nvim-telescope/telescope.nvim',
		branch = '0.1.x',
		cmd = 'Telescope',
		dependencies = {
			'nvim-lua/plenary.nvim',
			{
				'nvim-telescope/telescope-fzf-native.nvim',
				build = 'make',
				cond = function()
					return vim.fn.executable('make') == 1
				end,
			},
			-- Shows a diff of all undo changes
			'debugloop/telescope-undo.nvim',
		},
		config = function()
			local telescope = require('telescope')
			telescope.setup({
				defaults = {
					layout_config = {
						horizontal = {
							preview_width = 0.55,
							results_width = 0.5,
						},
						width = 0.95,
						height = 0.90,
						preview_cutoff = 120,
					},
				},
			})
			pcall(telescope.load_extension('fzf'))
			pcall(telescope.load_extension('undo'))
		end,
	},
	-- }}}

	-- Treesitter {{{
	{
		-- Highlight, edit, and navigate code
		'nvim-treesitter/nvim-treesitter',
		event = VeryLazyFile,
		-- dependencies = {
		-- 	'nvim-treesitter/nvim-treesitter-textobjects',
		-- },
		config = function()
			require('pluggers.treesitter')
		end,
		build = ':TSUpdate',
	},
	-- }}}

	-- Orgmode{{{
	{
		'nvim-orgmode/orgmode',
		-- Disabled for now
		enabled = false,
		dependencies = {
			{ 'nvim-treesitter/nvim-treesitter', lazy = true },
		},
		ft = 'org',
		keys = '<leader>o',
		config = function()
			-- Load treesitter grammar for org
			require('orgmode').setup_ts_grammar()

			-- Setup treesitter
			require('nvim-treesitter.configs').setup({
				highlight = {
					enable = true,
					additional_vim_regex_highlighting = { 'org' },
				},
				ensure_installed = { 'org' },
			})

			-- Setup orgmode
			local agenda_files = '~/Notes/**/*'
			local default_notes_file = '~/Notes/refile.org'
			if vim.g.is_termux then
				local agenda_files = '/storage/self/primary/**/*'
				local default_notes_file = '/storage/self/primary/refile.org'
			else
			end
			require('orgmode').setup({
				org_agenda_files = agenda_files,
				org_default_notes_file = default_notes_file,
			})
		end,
	},
	-- }}}

	-- Color the background of color codes {{{
	{
		'norcalli/nvim-colorizer.lua',
		cmd = { 'ColorizerToggle' },
	}, -- }}}

	-- Blazingly fast {{{
	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		keys = { '<leader>`', '<leader>a', '<A-1>', '<A-2>', '<A-3>', '<A-4>', '<A-5>', '<A-6>', },
		requires = { { "nvim-lua/plenary.nvim" } },
		opts = function()
			local harpoon = require("harpoon")
			harpoon:setup()

			vim.keymap.set("n", "<leader>a", function() harpoon:list():append() end)
			vim.keymap.set("n", "<leader>`", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

			for i = 1, 6, 1 do
				vim.keymap.set('n', '<A-' .. i .. '>',
					function() harpoon:list():select(i) end,
					{ noremap = true, desc = 'Harpoon open buffer ' .. i }
				)
			end
		end
	},

	{
		'ThePrimeagen/vim-be-good',
		cmd = { 'VimBeGood' },
	},
	-- }}}

	-- Undotree {{{
	{
		'mbbill/undotree',
		cmd = { 'UndotreeToggle', 'UndotreeFocus' },
		keys = { {
			'<leader>u',
			'<cmd>UndotreeToggle<cr><cmd>UndotreeFocus<CR>',
			desc = '[u]ndotree Toggle'
		} },
	},
	-- }}}

	-- Git related plugins {{{
	-- Git Signs{{{
	-- Adds git related signs to the gutter, as well as utilities for managing changes
	{
		'lewis6991/gitsigns.nvim',
		event = LazyFile,
		opts = require('pluggers.gitsigns'),
	}, -- }}}
	-- Fugitive {{{
	{
		'tpope/vim-fugitive',
		cmd = { 'Git', 'GBrowse' },
		dependencies = 'tpope/vim-rhubarb',
	}, -- }}}
	-- }}}

	-- vim-sleuth Detect tabstop and shiftwidth automatically {{{
	{
		'tpope/vim-sleuth',
		event = LazyFile,
	},
	--}}}

	-- ZenMode{{{
	{
		'folke/zen-mode.nvim',
		cmd = { 'ZenMode' },
		keys = { {
			'<leader>z',
			'<CMD>ZenMode<CR>',
			desc = '[z]enmode Toggle',
		} },
		opts = {
			window = {
				width = 85, -- width of the Zen window
			},
			plugins = {
				options = {
					enabled = true,
					ruler = false, -- disables the ruler text in the cmd line area
					showcmd = true, -- disables the command in the last line of the screen
					-- you may turn on/off statusline in zen mode by setting 'laststatus'
					-- statusline will be shown only if 'laststatus' == 3
					laststatus = 1, -- turn off the statusline in zen mode
					showmode = true,
				},
				gitsigns = { enabled = true },
				tmux = { enabled = true },
			},

			-- on_open = function(win)
			--     vim.fn.system('st')
			-- end
		},
	},
	-- }}}

	-- require 'kickstart.plugins.autoformat',
	-- require('kickstart.plugins.debug'),
	-- For additional information see: https://github.com/folke/lazy.nvim#-structuring-your-plugins
}
