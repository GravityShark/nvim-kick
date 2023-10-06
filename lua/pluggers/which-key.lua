require('which-key').register({
	-- mappings
	f = { 'Telescope (F)ile' },
	g = { 'Fu[G]itive' },
	x = { '[X] is for Trouble' },
	u = { '[U]ndotree Toggle' },
}, { prefix = '<leader>' })

return {
	-- triggers = {
	--   "<leader>",
	--   "z",
	--   "g"
	-- }
	window = {
		border = 'double',
		winblend = 100,
	},
}
