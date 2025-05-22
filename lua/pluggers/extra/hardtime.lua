return {
    'm4xshen/hardtime.nvim',
    lazy = false,
    dependencies = { 'MunifTanjim/nui.nvim' },
    opts = {
        -- max_time = 5000,
        -- timeout = false,
        -- allow_different_key = false,
        disabled_keys = {
            ['<C-w>c'] = { 'n' },
        },
    },
}
