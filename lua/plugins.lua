local LazyFile = { 'BufReadPost', 'BufWritePost', 'BufNewFile' }
local VeryLazyFile = { 'BufReadPost', 'BufWritePost', 'BufNewFile', 'VeryLazy' }

--[[ todo and stuff{{{
### plugins to look into
- [ ] noice, notify
    - [ ] dressing.nvim
- [ ] nvim-dap
- [ ] none-ls/ linting, format
- [ ] navic / barbeque
- [ ] nvim-treesitter-textobjects
- [ ] under mini.comments. nvim-ts-context-commentstring
- [ ] neoconf
- [ ] terminal in neovim
- [ ] [hydra.nvim](https://github.com/anuvyklack/hydra.nvim) is very interesting
#### mini.nvim
- [ ]  mini.base16 -- coolors
    - [ ] mini.colors
    - [ ] mini.hues
- [ ] mini.bracketed -- better bracket movement
- [ ] mini.cursorword -- lighter vim-illuminate
- [ ] mini.files -- like a netrw    
- [ ] mini.jump2d -- adds labels, kinda like how qutebrowser does it
- [ ] mini.move -- like that one ThePrimeagen keybinding with autoindenting selection
- [ ] mini.sessions  -- persistence.nvim
- [ ] mini.starter or alpha-nvim -starting tihg
- [ ] mini.splitjoin -- cool way of like splitting lines like
> but basically anything from https://www.lazyvim.org/plugins/ or lunarvim

### TODO
- [ ] a option to set for like 'lite' and 'full' graphics
- [ ] and also have mini.colors/base16 easy otions
	- [ ] setup highlighting to be better but thats like on the colors part idk
- [ ] maybe replace like the mini.clue with which-key or another whichkey cause mini.clue is very limited
- [ ] make nvim-lsp lighter and faster
- [ ] get html lsp to wor
- [ ] setup treesitter keybindings and such
 like anything in this https://www.lazyvim.org/plugins/
]]
--}}}

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
		lazy = false,
		-- event = VeryLazyFile,
	},

	-- vim.cmd.colorscheme('habamax'),
	require('colorscheme.monokai'),

	-- }}}

	-- mini.nvim {{{

	-- better (a)round and (i)nside commands{{{
	{ 'echasnovski/mini.ai', event = 'VeryLazy', opts = {} },
	-- }}}
	-- better f/F and t/T{{{
	{ 'echasnovski/mini.jump', event = 'VeryLazy', opts = {} },
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
		opts = {
			custom_commentstring = function()
				return require('ts_context_commentstring.internal').calculate_commentstring()
					or vim.bo.commentstring
			end,
		},
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
		opts = { scroll = { enable = false } },
	},
	-- }}}
	-- Which-key but kinda good but bad??{{{
	{
		'echasnovski/mini.clue',
		keys = { '<leader>', 'z', 'g', '[', ']' },
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
			'williamboman/mason.nvim',
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

	-- Orgmode{{{
	{
		'nvim-orgmode/orgmode',
		dependencies = {
			{ 'nvim-treesitter/nvim-treesitter', lazy = true },
		},
		event = 'VeryLazy',
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
			require('orgmode').setup({
				org_agenda_files = '~/Notes/**/*',
				org_default_notes_file = '~/Notes/refile.org',
			})
		end,
	},
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
	{
		'tpope/vim-sleuth',
		event = 'VeryLazy',
	},
	--}}}

	-- cmd ZenMode{{{
	{
		'folke/zen-mode.nvim',
		cmd = { 'ZenMode' },
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
				},
				gitsigns = { enabled = true },
			},
		},
	},
	-- }}}

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
