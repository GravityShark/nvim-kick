return {
    'm4xshen/hardtime.nvim',
    lazy = false,
    dependencies = { 'MunifTanjim/nui.nvim' },
    opts = {
        max_time = 5000,
        max_count = 2,
        timeout = false,
        -- allow_different_key = false,
        restricted_keys = {
            ['x'] = { 'n' },
            ['d'] = { 'n' },
            ['w'] = { 'n' },
            ['e'] = { 'n' },
            ['b'] = { 'n' },
            ['J'] = { 'n' },
            ['>'] = { 'n' },
            ['<'] = { 'n' },
        },
        hints = {
            ['[><][%^_]'] = {
                message = function(key)
                    return 'Use "v then ><" instead of spamming '
                        .. key
                        .. ' like a loser'
                end,
                length = 2,
            },
            ['[web][%^_]'] = {
                message = function(key)
                    return 'Use "f" instead of spamming '
                        .. key
                        .. ' like a loser'
                end,
                length = 2,
            },
        },
        disabled_keys = {
            ['<C-w>c'] = { 'n' },
        },
    },
}
