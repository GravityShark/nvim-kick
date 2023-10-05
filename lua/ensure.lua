M = {}

M.treesitter = {
	'lua',
	'python',
	'c',
	'bash',
}

M.mason = {
	'lua_ls',
	'pyright',
	'clangd',
	lua_ls = {
		Lua = {
			workspace = { checkThirdParty = false },
			telemetry = { enable = false },
		},
	},
}
-- local servers = {
-- clangd = {},
-- gopls = {},
-- pyright = {},
-- rust_analyzer = {},
-- tsserver = {},
-- html = { filetypes = { 'html', 'twig', 'hbs'} },
--
-- 	lua_ls = {
-- 		Lua = {
-- 			workspace = { checkThirdParty = false },
-- 			telemetry = { enable = false },
-- 		},
-- 	},
-- }
--

return M
