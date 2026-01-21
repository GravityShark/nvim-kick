return {
    'MeanderingProgrammer/render-markdown.nvim',
    ft = 'markdown',
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.icons' },
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {
        quote = { enabled = false },
        bullet = { enabled = false },
        checkbox = { enabled = false },
        sign = { enabled = false },
        heading = {
            sign = false,
            icons = { '󰎤 ', '󰎧 ', '󰎪 ', '󰎭 ', '󰎱 ', '󰎳 ' },
            -- width = 'block',
            backgrounds = {
                '',
                '',
                '',
                '',
                '',
                '',
            },
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
