return {
    'tanvirtin/monokai.nvim',
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
        -- local monokai = require('monokai')
        -- local paletter = monokai.pro
        local paletter = {
            black = '#181a1c',
            base1 = '#252630',
            base2 = '#2b2d3a',
            base3 = '#333648',
            base4 = '#363a4e',
            base5 = '#393e53',
            -- base6 = '#3f445b',
            base7 = '#5a5e7a',
            pink = '#ff6188',
            white = '#e1e3e4',
            red = '#fb617e',
            orange = '#f89860',
            yellow = '#edc763',
            green = '#9ed06c',
            aqua = '#6dcae8',
            purple = '#bb97ee',
            grey = '#7e8294',
            bg_green = '#a9dc76',
            bg_blue = '#77d5f0',
            diff_add = '#394634',
            diff_remove = '#55393d',
            diff_change = '#354157',
            diff_text = '#4e432f',
            brown = '#4e432f',
        }
        require('monokai').setup({
            palette = paletter,
            custom_hlgroups = {
                TelescopeBorder = { fg = paletter.pink },
                FloatBorder = { fg = paletter.pink },
                LineNrAbove = { fg = paletter.orange },
                LineNrBelow = { fg = paletter.orange },
                MiniTablineModifiedHidden = { fg = paletter.pink },
                MiniTablineModifiedCurrent = {
                    bg = paletter.base4,
                    fg = paletter.pink,
                },
                MiniStatuslineModeInsert = {
                    fg = paletter.base1,
                    bg = paletter.aqua,
                },
                MiniStatuslineModeVisual = {
                    fg = paletter.base1,
                    bg = paletter.purple,
                },
                MiniStatuslineModeCommand = {
                    fg = paletter.white,
                    bg = paletter.black,
                },
                StatusLine = {
                    bg = paletter.base2,
                },
                StatusLineNC = {
                    bg = paletter.base1,
                },
                FidgetTitle = { fg = paletter.pink },
                PmenuThumb = { bg = paletter.base4 },
            },
        })
    end,
}
