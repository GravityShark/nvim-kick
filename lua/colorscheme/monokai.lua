return {
    'tanvirtin/monokai.nvim',
    lazy = false,
    config = function()
        -- local monokai = require('monokai')
        -- local paletter = monokai.pro

        -- Custom palette{{{
        local paletter = {
            black = '#181a1c',
            base1 = '#252630',
            base2 = '#2b2d3a',
            base3 = '#333648',
            base4 = '#363a4e',
            base5 = '#393e53',
            base6ed = '#3f445b',
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
        } -- }}}

        -- List of custom highlights {{{
        local custom_hlgroupers = {
            -- Title = { fg = paletter.aqua },
            -- Constant = { fg = paletter.orange },
            -- Identifier = { fg = paletter.yellow },
            -- Statement = { fg = paletter.green },
            -- PreProc = { fg = paletter.aqua },
            -- Type = { fg = paletter.purple },
            -- Special = { fg = paletter.red },
            -- String = { fg = paletter.orange },
            OrgHeadlineLevel1 = { fg = paletter.aqua },
            OrgHeadlineLevel2 = { fg = paletter.orange },
            OrgHeadlineLevel3 = { fg = paletter.yellow },
            OrgHeadlineLevel4 = { fg = paletter.green },
            OrgHeadlineLevel5 = { fg = paletter.aqua },
            OrgHeadlineLevel6 = { fg = paletter.purple },
            OrgHeadlineLevel7 = { fg = paletter.red },
            OrgHeadlineLevel8 = { fg = paletter.orange },

            TelescopeBorder = { fg = paletter.pink },
            FloatBorder = { fg = paletter.pink },
            LineNrAbove = { fg = paletter.orange },
            LineNrBelow = { fg = paletter.orange },

            MiniTablineCurrent = {
                bg = paletter.base7,
            },
            MiniTablineVisible = {
                bg = paletter.base6ed,
            },
            MiniTablineModifiedCurrent = {
                bg = paletter.base7,
                fg = paletter.pink,
            },
            MiniTablineModifiedVisible = {
                bg = paletter.base6ed,
                fg = paletter.pink,
            },
            MiniTablineModifiedHidden = {
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
            CursorLine = { bg = paletter.base2 },
            ColorColumn = { bg = paletter.base2 },
        } -- }}}

        require('monokai').setup({
            palette = paletter,
            custom_hlgroups = custom_hlgroupers,
        })
        -- Turn all items in list to have transparent backgrounds{{{
        -- local transparent = {
        --     'Normal',
        --     'NormalNC',
        --     'NormalFloat',
        --     'Comment',
        --     'Constant',
        --     'Special',
        --     'Identifier',
        --     'Statement',
        --     'PreProc',
        --     'Type',
        --     'Underlined',
        --     'Todo',
        --     'String',
        --     'Function',
        --     'Conditional',
        --     'Repeat',
        --     'Operator',
        --     'Structure',
        --     'LineNr',
        --     'NonText',
        --     'SignColumn',
        --     'EndOfBuffer',
        --     'TelescopeNormal',
        -- }

        -- from https://github.com/xiyaowong/transparent.nvim/blob/main/lua/transparent/init.lua
        -- local groups = type(transparent) == 'string' and { transparent }
        --     or transparent
        -- for _, v in ipairs(groups) do
        --     local ok, prev_attrs = pcall(vim.api.nvim_get_hl_by_name, v, true)
        --     if
        --         ok
        --         and (
        --             prev_attrs.background
        --             or prev_attrs.bg
        --             or prev_attrs.ctermbg
        --         )
        --     then
        --         local attrs = vim.tbl_extend(
        --             'force',
        --             prev_attrs,
        --             { bg = 'NONE', ctermbg = 'NONE' }
        --         )
        --         attrs[true] = nil
        --         vim.api.nvim_set_hl(0, v, attrs)
        --     end
        -- end
        --
        -- }}}
    end,
}
