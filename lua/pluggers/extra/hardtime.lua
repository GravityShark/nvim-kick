return {
    'm4xshen/hardtime.nvim',
    lazy = false,
    dependencies = { 'MunifTanjim/nui.nvim' },
    opts = {
        max_time = 5000,
        max_count = 2,
        timeout = false,
        resetting_keys = {},
        restricted_keys = {
            ['w'] = { 'n', 'x' },
            ['W'] = { 'n', 'x' },
            ['e'] = { 'n', 'x' },
            ['E'] = { 'n', 'x' },
            ['b'] = { 'n', 'x' },
            ['B'] = { 'n', 'x' },
            ['J'] = { 'n', 'x' },
            ['d'] = { 'n', 'x' },
            ['x'] = { 'n', 'x' },
            ['X'] = { 'n', 'x' },
            ['<'] = { 'n', 'x' },
            ['>'] = { 'n', 'x' },
            ['u'] = { 'n', 'x' },
        },
        hints = {
            ['[webWEB]'] = {
                message = function()
                    return 'Use f or t instead of spamming vro 💔'
                end,
                length = 2,
            },

            ['[<>]'] = {
                message = function()
                    return 'Enter visual mode and spam it easier lol'
                end,
                length = 2,
            },
            ['[xXd]'] = {
                message = function()
                    return 'Use literally any deletion motion instead of spamming ts 🥀'
                end,
                length = 2,
            },
            ['u'] = {
                message = function()
                    return 'Use <leader>u instead of spamming u like a loser'
                end,
                length = 2,
            },
        },
        disabled_keys = {
            ['<C-w>c'] = { 'n' },
            ['<ESC>'] = { 'n' },
        },
    },
}
