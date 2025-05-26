return {
    'm4xshen/hardtime.nvim',
    lazy = false,
    dependencies = { 'MunifTanjim/nui.nvim' },
    opts = {
        max_time = 5000,
        max_count = 2,
        timeout = false,
        restricted_keys = {
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
        disabled_keys = {
            ['<C-w>c'] = { 'n' },
        },
    },
}
