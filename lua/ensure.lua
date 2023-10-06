M = {}

M.treesitter = {
	'lua',
	'python',
	'c',
	'bash',
}

M.mason = {
	clangd = {},
	gopls = {},
	pyright = {},
	rust_analyzer = {},
	tsserver = {},
	html = { filetypes = { 'html', 'twig', 'hbs' } },

	lua_ls = {
		Lua = {
			workspace = { checkThirdParty = false },
			telemetry = { enable = false },
		},
	},
}

return M
