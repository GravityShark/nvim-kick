-- Absolute minimum config for Treesitter

vim.defer_fn(function()
	require('nvim-treesitter.configs').setup({
		ensure_installed = require('ensure').treesitter,
		highlight = {
			enable = true,
			use_languagetree = true,
		},
		indent = { enable = true },
	})
end, 0)
