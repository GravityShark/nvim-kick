return {
	-- Theme {{{
	-- {
	-- 	-- Theme inspired by Atom
	-- 	'navarasu/onedark.nvim',
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	config = function()
	-- 		vim.cmd.colorscheme('onedark')
	-- 	end,
	-- },
	{
		'sainnhe/sonokai',
		lazy = false,
		enabled = false,
		priority = 1000,
		opts = { disable_background = true },
		config = function()
			vim.opt.termguicolors = true
			vim.g.sonokai_style = 'andromeda'
			vim.g.sonokai_better_performance = 1
			vim.g.sonokai_transparent_background = 1
			vim.g.sonokai_enable_italic = 1

			vim.cmd.colorscheme('sonokai')
		end,
	},
	--
	--    {
	--        'rktjmp/lush.nvim',
	--        enabled = false,
	--        lazy = false,
	--        config = function()
	-- 		vim.opt.termguicolors = true
	--
	--            require('pluggers.sonokai_lush')
	--        end
	--    },
	--
	-- {
	-- 	'catppuccin/nvim',
	-- 	enabled = false,
	-- 	lazy = false,
	-- 	name = 'catppuccin',
	-- 	priority = 1000,
	-- 	config = function()
	-- 		vim.opt.termguicolors = true
	-- 		require('pluggers.catppuccin')
	-- 		vim.cmd.colorscheme('catppuccin')
	-- 	end,
	-- },
	{
		'tanvirtin/monokai.nvim',
		enabled = true,
		lazy = false,
		dependencies = { 'xiyaowong/transparent.nvim', opt = {} },
		config = function()
			require('monokai').setup({
				pallette = {
					black = '#181a1c',
					-- black = '#000000',
					base1 = '#252630',
					base2 = '#2b2d3a',
					base3 = '#333648',
					base4 = '#363a4e',
					base5 = '#393e53',
					base6 = '#3f445b',
					base7 = '#5a5e7a',
					-- pink = '#ff6188',
					white = '#e1e3e4',
					red = '#fb617e',
					orange = '#f89860',
					yellow = '#edc763',
					green = '#9ed06c',
					aqua = '#6dcae8',
					purple = '#bb97ee',
					grey = '#7e8294',
					bg_green = '#a9dc76',
					bg_blue = '#77d5f0',
					diff_add = '#394634',
					diff_remove = '#55393d',
					diff_change = '#354157',
					-- diff_text = '#4e432f',
					brown = '#4e432f',
				},
			})
		end,
	},

	{ 'dstein64/vim-startuptime', cmd = 'StartupTime' },
	-- }}}

	-- mini.nvim {{{
	-- Auto pairs ()
	{
		'echasnovski/mini.pairs',
		version = false,
		event = 'InsertEnter',
		opts = {},
	},

	-- Indent indicators
	{
		'echasnovski/mini.indentscope',
		version = false,
		event = { 'BufReadPost', 'BufNewFile' },
		opts = {
			options = {
				try_as_border = false,
			},
			symbol = '▎',
		},
	},

	-- "gc" to comment visual regions/lines
	{
		'echasnovski/mini.comment',
		version = false,
		keys = { 'gcc', { 'gc', mode = 'v' } },
		opts = {},
	},

	-- Fast bufferline
	{
		'echasnovski/mini.tabline',
		version = false,
		event = { 'BufReadPost', 'BufNewFile' },
		dependencies = 'nvim-tree/nvim-web-devicons',
		opts = { set_vim_settings = false },
	},

	{ 'echasnovski/mini.bufremove', version = false, opts = {} },

	{
		'echasnovski/mini.surround',
		version = false,
		keys = { 'sa', 'sd', 'sr', 'sf', 'sF', 'sh', 'sn', mode = 'nv' },
		opts = {},
	},
	-- }}}

	-- Undotree{{{
	{
		'mbbill/undotree',
		cmd = { 'UndotreeToggle', 'UndotreeFocus' },
		keys = {
			{ '<leader>u', '<cmd>UndotreeToggle<cr><cmd>UndotreeFocus<cr>' },
		},
	},
	-- {
	--   "jiaoshijie/undotree",
	--   dependencies = "nvim-lua/plenary.nvim",
	--   config = true,
	--   keys = { -- load the plugin only when using it's keybinding:
	--     { "<leader>u", "<cmd>lua require('undotree').toggle()<cr>" },
	--   },
	-- },}}}

	-- Blazingly fast {{{
	{ 'ThePrimeagen/harpoon' },

	{
		'ThePrimeagen/vim-be-good',
		cmd = { 'VimBeGood' },
	}, -- }}}

	-- Git related plugins{{{
	{ 'tpope/vim-fugitive', cmd = { 'Git' } },
	'tpope/vim-rhubarb', -- }}}

	-- Detect tabstop and shiftwidth automatically{{{
	-- {
	-- 	'tpope/vim-sleuth',
	-- 	event = 'VeryLazy',
	-- },}}}

	-- LSP & Mason {{{
	{
		-- LSP Configuration & Plugins
		'neovim/nvim-lspconfig',
		event = { 'BufReadPre', 'BufNewFile' },
		config = function()
			require('pluggers.lspconfig')
		end,
		dependencies = {
			{ 'williamboman/mason.nvim', config = true },
			'williamboman/mason-lspconfig.nvim',

			{ 'j-hui/fidget.nvim', tag = 'legacy', opts = {} },
			{ 'folke/neodev.nvim', ft = { 'lua', 'vim' }, opts = {} },
		},
	}, -- }}}

	-- nvim-cmp {{{
	{
		-- Autocompletion
		'hrsh7th/nvim-cmp',
		event = 'InsertEnter',
		dependencies = {
			-- Adds paths to sources
			'hrsh7th/cmp-path',

			-- Adds LSP completion capabilities
			'hrsh7th/cmp-nvim-lsp',
			--
			-- Adds the built-in vim auto-complete
			'hrsh7th/cmp-buffer',

			'hrsh7th/cmp-cmdline',

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

	-- Useful plugin to show you pending keybinds.{{{
	{
		'folke/which-key.nvim',
		opts = {},
		keys = { '<leader>', 'z', 'g' },
	}, -- }}}

	-- Git Signs{{{
	{
		-- Adds git related signs to the gutter, as well as utilities for managing changes
		'lewis6991/gitsigns.nvim',
		opts = {
			-- See `:help gitsigns.txt`
			signs = {
				add = { text = '+' },
				change = { text = '~' },
				delete = { text = '_' },
				topdelete = { text = '‾' },
				changedelete = { text = '~' },
			},
			on_attach = function(bufnr)
				vim.keymap.set(
					'n',
					'<leader>hp',
					require('gitsigns').preview_hunk,
					{ buffer = bufnr, desc = 'Preview git hunk' }
				)

				-- don't override the built-in and fugitive keymaps
				local gs = package.loaded.gitsigns
				vim.keymap.set(
					{ 'n', 'v' },
					']c',
					function()
						if vim.wo.diff then
							return ']c'
						end
						vim.schedule(function()
							gs.next_hunk()
						end)
						return '<Ignore>'
					end,
					{ expr = true, buffer = bufnr, desc = 'Jump to next hunk' }
				)
				vim.keymap.set({ 'n', 'v' }, '[c', function()
					if vim.wo.diff then
						return '[c'
					end
					vim.schedule(function()
						gs.prev_hunk()
					end)
					return '<Ignore>'
				end, {
					expr = true,
					buffer = bufnr,
					desc = 'Jump to previous hunk',
				})
			end,
		},
	}, -- }}}

	-- Fuzzy Finder (files, lsp, etc) {{{
	{
		'nvim-telescope/telescope.nvim',
		branch = '0.1.x',
		cmd = 'Telescope',
		dependencies = {
			'nvim-lua/plenary.nvim',
			-- Fuzzy Finder Algorithm which requires local dependencies to be built.
			-- Only load if `make` is available. Make sure you have the system
			-- requirements installed.
			{
				'nvim-telescope/telescope-fzf-native.nvim',
				-- NOTE: If you are having trouble with this installation,
				--       refer to the README for telescope-fzf-native for more instructions.
				build = 'make',
				cond = function()
					return vim.fn.executable('make') == 1
				end,
			},
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
			telescope.load_extension('fzf')
		end,
	},
	-- }}}

	-- Tree Sitter {{{
	{
		-- Highlight, edit, and navigate code
		'nvim-treesitter/nvim-treesitter',
		event = { 'BufReadPost', 'BufNewFile' },
		-- dependencies = {
		-- 	'nvim-treesitter/nvim-treesitter-textobjects',
		-- },
		-- config = function()
		--           require('pluggers.treesitter')
		--       end,
		build = ':TSUpdate',
	}, -- }}}

	-- nvim-colizer.lua {{{
	{
		'norcalli/nvim-colorizer.lua',
		cmd = { 'ColorizerToggle' },
		opts = {},
	}, -- }}}

	-- NOTE: Next Step on Your Neovim Journey: Add/Configure additional "plugins" for kickstart
	--       These are some example plugins that I've included in the kickstart repository.
	--       Uncomment any of the lines below to enable them.
	-- require 'kickstart.plugins.autoformat',
	-- require 'kickstart.plugins.debug',

	-- NOTE: The import below can automatically add your own plugins, configuration, etc from `lua/custom/plugins/*.lua`
	--    You can use this folder to prevent any conflicts with this init.lua if you're interested in keeping
	--    up-to-date with whatever is in the kickstart repo.
	--    Uncomment the following line and add your plugins to `lua/custom/plugins/*.lua` to get going.
	--
	--    For additional information see: https://github.com/folke/lazy.nvim#-structuring-your-plugins
}
