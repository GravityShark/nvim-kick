M = {}

M.treesitter = {
	'lua',
	'python',
	'c',
	'cpp',
	'javascript',
	'css',
	'vim',
	'vimdoc',
	'bash',
	'sql',
	'json',
	'markdown',
	'gitcommit',
	'org',
}

M.mason = {
	clangd = {},
	pylsp = {},
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
