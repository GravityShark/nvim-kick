M = {}

M.treesitter = {
	'lua',
	'python',
	'c',
	'cpp',
	'tsx',
	'javascript',
	'typescript',
	'vim',
	'vimdoc',
	'bash',
}

M.mason = {
	clangd = {},
	gopls = {},
	pyright = {},
	rust_analyzer = {},
	tsserver = {},
	html = { filetypes = { 'html', 'twig', 'hbs' } },
	tailwindcss = {},

	lua_ls = {
		Lua = {
			workspace = { checkThirdParty = false },
			telemetry = { enable = false },
		},
	},
}

return M
