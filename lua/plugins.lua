local LazyFile = { 'BufReadPost', 'BufWritePost', 'BufNewFile' }
local VeryLazyFile = { 'BufReadPost', 'BufWritePost', 'BufNewFile', 'VeryLazy' }

return {

	-- Starttime Makes me feel good{{{
	{
		'dstein64/vim-startuptime',
		cmd = 'StartupTime',
		config = function()
			vim.g.startuptime_tries = 100
		end,
	},
	-- }}}

	-- Theme {{{
	{
		'echasnovski/mini.statusline',
		opts = { set_vim_settings = false },
		event = 'VeryLazy',
	},

	require('colorscheme.monokai'),
	-- }}}

	-- mini.nvim {{{
	--[[ Things that i wanna add from mini.nvim
    *  mini.base16 -- coolors
    ** mini.colors
    ** mini.hues
    * mini.bracketed -- better bracket movement
    * mini.cursorword -- lighter vim-illuminate
    * mini.files -- like a netrw    
    * mini.jump2d -- adds labels, kinda like how qutebrowser does it
    * mini.move -- like that one ThePrimeagen keybinding with autoindenting selection
    ]]
	{ 'echasnovski/mini.ai', event = 'VeryLazy', opts = {} },
	{ 'echasnovski/mini.jump', event = 'VeryLazy', opts = {} },
	-- Auto pairs ()
	{
		'echasnovski/mini.pairs',
		event = 'InsertEnter',
		opts = {},
	},

	-- Indent indicators
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

	-- "gcc/gc" to comment visual regions/lines
	{
		'echasnovski/mini.comment',
		keys = { 'gcc', { 'gc', mode = 'v' } },
		opts = {
			custom_commentstring = function()
				return require('ts_context_commentstring.internal').calculate_commentstring()
					or vim.bo.commentstring
			end,
		},
	},

	-- Fast bufferline
	{
		'echasnovski/mini.tabline',
		-- event = { 'BufReadPost', 'BufNewFile' },
		dependencies = 'nvim-tree/nvim-web-devicons',
		opts = { set_vim_settings = false },
	},

	-- Kill buffers and preserve window layout
	{ 'echasnovski/mini.bufremove', opts = {} },

	-- 's' to surround with '' or ()
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

	{ 'echasnovski/mini.animate', event = 'VeryLazy', opts = {} },

	{
		'echasnovski/mini.clue',
		keys = { '<leader>', 'z', 'g', '[', ']' },
		config = function()
			require('pluggers.mini-clue')
		end,
	},

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
			{ 'williamboman/mason.nvim', config = true },
			'williamboman/mason-lspconfig.nvim',

			{ 'j-hui/fidget.nvim', tag = 'legacy', opts = {} },
			{ 'folke/neodev.nvim', ft = { 'lua', 'vim' }, opts = {} },
		},
	}, -- }}}

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
			--
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

			-- Shows all projects / folders
			'nvim-telescope/telescope-project.nvim',
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
			pcall(telescope.load_extension('project'))
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

		-- Easy diagnostics
	},
	{ 'folke/trouble.nvim', cmd = { 'TroubleToggle' } },
	-- }}}

	-- Color the background of color codes {{{
	{
		'norcalli/nvim-colorizer.lua',
		cmd = { 'ColorizerToggle' },
		opts = {},
	}, -- }}}

	-- Blazingly fast {{{
	{ 'ThePrimeagen/harpoon' },

	{
		'ThePrimeagen/vim-be-good',
		cmd = { 'VimBeGood' },
	},
	-- }}}

	-- Git Signs{{{
	{
		-- Adds git related signs to the gutter, as well as utilities for managing changes
		event = LazyFile,
		'lewis6991/gitsigns.nvim',
		opts = require('pluggers.gitsigns'),
	}, -- }}}

	-- Undotree {{{
	{
		'mbbill/undotree',
		cmd = { 'UndotreeToggle', 'UndotreeFocus' },
	},
	-- {
	--   "jiaoshijie/undotree",
	--   dependencies = "nvim-lua/plenary.nvim",
	--   config = true,
	--   keys = { -- load the plugin only when using it's keybinding:
	--     { "<leader>u", "<cmd>lua require('undotree').toggle()<cr>" },
	--   },
	-- },}}}

	-- Git related plugins {{{

	{
		'tpope/vim-fugitive',
		cmd = { 'Git', 'GBrowse' },
		dependencies = 'tpope/vim-rhubarb',
	},
	-- }}}

	-- Detect tabstop and shiftwidth automatically{{{
	-- {
	-- 	'tpope/vim-sleuth',
	-- 	event = 'VeryLazy',
	-- },
	--}}}

	-- NOTE: Next Step on Your Neovim Journey: Add/Configure additional "plugins" for kickstart
	--       These are some example plugins that I've included in the kickstart repository.
	--       Uncomment any of the lines below to enable them.
	-- require 'kickstart.plugins.autoformat',
	-- require('kickstart.plugins.debug'),

	-- NOTE: The import below can automatically add your own plugins, configuration, etc from `lua/custom/plugins/*.lua`
	--    You can use this folder to prevent any conflicts with this init.lua if you're interested in keeping
	--    up-to-date with whatever is in the kickstart repo.
	--    Uncomment the following line and add your plugins to `lua/custom/plugins/*.lua` to get going.
	--
	--    For additional information see: https://github.com/folke/lazy.nvim#-structuring-your-plugins
}
