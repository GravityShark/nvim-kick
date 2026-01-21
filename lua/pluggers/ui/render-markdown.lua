return {
    'MeanderingProgrammer/render-markdown.nvim',
    ft = 'markdown',
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.icons' },
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {
        quote = { enabled = false },

        checkbox = { render_modes = true, bullet = true, left_pad = 3 },

        heading = {
            sign = false,
            icons = { '󰎤 ', '󰎧 ', '󰎪 ', '󰎭 ', '󰎱 ', '󰎳 ' },
            width = 'block',
            -- backgrounds = {
            --     'Headline1Bg',
            --     'Headline2Bg',
            --     'Headline3Bg',
            --     'Headline4Bg',
            --     'Headline5Bg',
            --     'Headline6Bg',
            -- },
            -- foregrounds = {
            --     'Headline1Fg',
            --     'Headline2Fg',
            --     'Headline3Fg',
            --     'Headline4Fg',
            --     'Headline5Fg',
            --     'Headline6Fg',
            -- },
        },
    },
}
