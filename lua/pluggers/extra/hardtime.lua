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
            ['x'] = { 'n', 'x' },
            ['dd'] = { 'n', 'x' },
            ['w'] = { 'n', 'x' },
            ['W'] = { 'n', 'x' },
            ['e'] = { 'n', 'x' },
            ['E'] = { 'n', 'x' },
            ['b'] = { 'n', 'x' },
            ['B'] = { 'n', 'x' },
            ['J'] = { 'n', 'x' },
            ['>>'] = { 'n', 'x' },
            ['<<'] = { 'n', 'x' },
        },
        -- hints = {
        --     ['[><][%^_]'] = {
        --         message = function(key)
        --             return 'Use "v then ><" instead of spamming '
        --                 .. key
        --                 .. ' like a loser'
        --         end,
        --         length = 2,
        --     },
        --     ['[webWEB][%^_]'] = {
        --         message = function(key)
        --             return 'Use "f" instead of spamming '
        --                 .. key
        --                 .. ' like a loser'
        --         end,
        --         length = 2,
        --     },
        -- },
        disabled_keys = {
            ['<C-w>c'] = { 'n' },
        },
    },
}
