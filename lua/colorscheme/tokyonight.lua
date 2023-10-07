return {
	'folke/tokyonight.nvim',
	event = 'VeryLazy',
	config = function()
		require('tokyonight').setup({
			transparent = true,
			styles = {
				sidebars = 'transparent',
				floats = 'transparent',
			},
			style = 'moon',
		})
		vim.cmd.colorscheme('tokyonight')
	end,
}
