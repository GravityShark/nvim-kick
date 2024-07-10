return { -- Plugins that make the neovim editing experience better
    { -- mini.surround Surround text with any character
        'echasnovski/mini.surround',
        keys = {
            { 'sa', mode = 'v', desc = 'Add surrounding' },
            { 'sa', desc = 'Add surrounding' },
            { 'sd', desc = 'Delete surrounding' },
            { 'sr', desc = 'Surround replace' },
            { 'sf', desc = 'Find right surrounding' },
            { 'sF', desc = 'Find left surrounding' },
            { 'sh', desc = 'Highlight surrounding' },
            { 'sn', desc = 'Update `MiniSurround.config.n_lines`' },
        },
        opts = {},
    },
    { -- mini.pairs Auto pairs ()[]{}
        'echasnovski/mini.pairs',
        event = 'InsertEnter',
        opts = {},
    },
    { -- guess-indent.nvim Automatically guess the indent level
        'nmac427/guess-indent.nvim',
        opts = {},
        event = { 'BufReadPost', 'BufNewFile', 'BufWritePre' },
    },
}
