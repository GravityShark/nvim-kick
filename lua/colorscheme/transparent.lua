return {
    'xiyaowong/transparent.nvim',
    lazy = false,
    opts = {
        extra_groups = {
            'NormalFloat',
            -- 'Pmenu',
            'TelescopeNormal',
        },
        exclude_groups = {
            'StatusLine',
            'StatusLineNC',
            'CursorLine',
            'CursorLineNr',
        }
    },
}
