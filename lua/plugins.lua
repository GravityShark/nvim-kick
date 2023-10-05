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
		"sainnhe/sonokai",
		lazy = false,
		enabled = false,
		priority = 1000,
		opts = { disable_background = true },
		config = function()
			vim.g.sonokai_style = "andromeda"
			vim.g.sonokai_better_performance = 1
			vim.g.sonokai_transparent_background = 1
			vim.g.sonokai_floatin = 1
			vim.g.sonokai_enable_italic = 1

			vim.cmd.colorscheme("sonokai")
		end,
	},
	-- }}}

	-- mini.nvim {{{
	{
		"echasnovski/mini.pairs",
		version = false,
		event = "InsertEnter",
		opts = {},
	},

	{
		"echasnovski/mini.indentscope",
		version = false,
		event = { "BufReadPost", "BufNewFile" },
		opts = {
			options = {
				try_as_border = false,
			},
			symbol = "▎",
		},
	},

	-- "gc" to comment visual regions/lines
	{
		"echasnovski/mini.comment",
		version = false,
		keys = { "gcc", { "gc", mode = "v" } },
		opts = {},
	},
	-- }}}

	-- Git related plugins
	-- 'tpope/vim-fugitive',
	-- 'tpope/vim-rhubarb',

	-- Detect tabstop and shiftwidth automatically
	-- {
	-- 	'tpope/vim-sleuth',
	-- 	event = 'VeryLazy',
	-- },
	-- LSP Config{{{
	-- NOTE: This is where your plugins related to LSP can be installed.
	--  The configuration is done below. Search for lspconfig to find it below.
	{
		-- LSP Configuration & Plugins
		"neovim/nvim-lspconfig",
		event = { "BufReadPost", "BufNewFile" },
		config = function()
			require("pluggers.lspconfig")
		end,
		dependencies = {
			-- Automatically install LSPs to stdpath for neovim

			-- Useful status updates for LSP
			{ "williamboman/mason.nvim", config = true },
			"williamboman/mason-lspconfig.nvim",
			-- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
			-- { 'j-hui/fidget.nvim', tag = 'legacy', opts = {}, lazy = false },

			-- Additional lua configuration, makes nvim stuff amazing!
			"folke/neodev.nvim",
		},
	}, -- }}}

	-- nvim-cmp {{{
	{
		-- Autocompletion
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			-- Snippet Engine & its associated nvim-cmp source
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",

			-- Adds paths to sources
			"hrsh7th/cmp-path",

			-- Adds LSP completion capabilities
			"hrsh7th/cmp-nvim-lsp",
			--
			-- Adds regl
			"hrsh7th/cmp-buffer",

			-- Adds a number of user-friendly snippets
			"rafamadriz/friendly-snippets",
		},
		config = function()
			require("pluggers.cmp")
		end,
	}, -- }}}

	-- Useful plugin to show you pending keybinds.
	{
		"folke/which-key.nvim",
		opts = {},
		keys = { "<leader>", "z", "g" },
	},

	-- Git Signs{{{
	{
		-- Adds git related signs to the gutter, as well as utilities for managing changes
		"lewis6991/gitsigns.nvim",
		opts = {
			-- See `:help gitsigns.txt`
			signs = {
				add = { text = "+" },
				change = { text = "~" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
			},
			on_attach = function(bufnr)
				vim.keymap.set(
					"n",
					"<leader>hp",
					require("gitsigns").preview_hunk,
					{ buffer = bufnr, desc = "Preview git hunk" }
				)

				-- don't override the built-in and fugitive keymaps
				local gs = package.loaded.gitsigns
				vim.keymap.set({ "n", "v" }, "]c", function()
					if vim.wo.diff then
						return "]c"
					end
					vim.schedule(function()
						gs.next_hunk()
					end)
					return "<Ignore>"
				end, { expr = true, buffer = bufnr, desc = "Jump to next hunk" })
				vim.keymap.set({ "n", "v" }, "[c", function()
					if vim.wo.diff then
						return "[c"
					end
					vim.schedule(function()
						gs.prev_hunk()
					end)
					return "<Ignore>"
				end, {
					expr = true,
					buffer = bufnr,
					desc = "Jump to previous hunk",
				})
			end,
		},
	}, -- }}}

	-- {
	-- 	-- Set lualine as statusline
	-- 	'nvim-lualine/lualine.nvim',
	-- 	-- See `:help lualine.txt`
	--
	-- 	opts = {
	-- 		options = {
	-- 			icons_enabled = false,
	-- 			theme = 'onedark',
	-- 			component_separators = '|',
	-- 			section_separators = '',
	-- 		},
	-- 	},
	-- },

	-- Fuzzy Finder (files, lsp, etc) {{{
	{
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		cmd = "Telescope",
		dependencies = {
			"nvim-lua/plenary.nvim",
			-- Fuzzy Finder Algorithm which requires local dependencies to be built.
			-- Only load if `make` is available. Make sure you have the system
			-- requirements installed.
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				-- NOTE: If you are having trouble with this installation,
				--       refer to the README for telescope-fzf-native for more instructions.
				build = "make",
				cond = function()
					return vim.fn.executable("make") == 1
				end,
			},
		},
		config = function()
			local telescope = require("telescope")
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
			telescope.load_extension("fzf")
		end,
	},
	-- }}}

	-- Tree Sitter {{{
	{
		-- Highlight, edit, and navigate code
		"nvim-treesitter/nvim-treesitter",
		event = { "BufReadPost", "BufNewFile" },
		-- dependencies = {
		-- 	'nvim-treesitter/nvim-treesitter-textobjects',
		-- },
		config = function() end,
		build = ":TSUpdate",
	}, -- }}}

	-- Fast bufferline
	{
		"nvoid-lua/bufferline.lua",
		dependencies = "nvim-tree/nvim-web-devicons",
		config = function()
			require("bufferline").setup({ kind_icons = true })
		end,
	},
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
	-- { import = 'custom.plugins' },
}
