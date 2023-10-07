return {
	'tanvirtin/monokai.nvim',
	-- enabled = true,
	--    event = 'VeryLazy',
	lazy = false,
	dependencies = {
		'xiyaowong/transparent.nvim',
		opts = {
			extra_groups = {
				'NormalFloat',
				'Pmenu',
				'TelescopeNormal',
			},
		},
	},
	config = function()
		local monokai = require('monokai')
		local palette = monokai.pro
		-- local palette = {
		--     black = '#181a1c',
		--     black = '#000000',
		--     base1 = '#252630',
		--     base2 = '#2b2d3a',
		--     base3 = '#333648',
		--     base4 = '#363a4e',
		--     base5 = '#393e53',
		--     base6 = '#3f445b',
		--     base7 = '#5a5e7a',
		--     pink = '#ff6188',
		--     white = '#e1e3e4',
		--     red = '#fb617e',
		--     orange = '#f89860',
		--     yellow = '#edc763',
		--     green = '#9ed06c',
		--     aqua = '#6dcae8',
		--     purple = '#bb97ee',
		--     grey = '#7e8294',
		--     bg_green = '#a9dc76',
		--     bg_blue = '#77d5f0',
		--     diff_add = '#394634',
		--     diff_remove = '#55393d',
		--     diff_change = '#354157',
		--     -- diff_text = '#4e432f',
		--     brown = '#4e432f'
		-- }
		monokai.setup({
			-- palette = palette,
			custom_hlgroups = {
				TelescopeBorder = { fg = palette.pink },
				FloatBorder = { fg = palette.pink },
				LineNrAbove = { fg = palette.orange },
				LineNrBelow = { fg = palette.orange },
				-- StatusLineNC = {
				--     fg = palette.pink,
				-- },
				MiniTablineModifiedHidden = { fg = palette.pink },
				MiniTablineModifiedCurrent = {
					bg = palette.base4,
					fg = palette.pink,
				},

				MiniStatuslineModeInsert = {
					fg = palette.base1,
					bg = palette.aqua,
				},
				MiniStatuslineModeVisual = {
					fg = palette.base1,
					bg = palette.purple,
				},
				MiniStatuslineModeCommand = {
					fg = palette.white,
					bg = palette.black,
				},
				-- StatusLine = {
				-- 	-- fg = palette.white,
				-- 	bg = palette.base1,
				-- },
				-- StatusLineNC = {
				-- 	-- fg = palette.white,
				-- 	bg = palette.base1,
				-- },
				-- FidgetTask = { fg = palette.grey },
				FidgetTitle = { fg = palette.pink },
			},
		})
	end,
}
