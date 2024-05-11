-- default_groups = {
--   'Normal', 'NormalNC', 'Comment', 'Constant', 'Special', 'Identifier',
--   'Statement', 'PreProc', 'Type', 'Underlined', 'Todo', 'String', 'Function',
--   'Conditional', 'Repeat', 'Operator', 'Structure', 'LineNr', 'NonText',
--   'SignColumn', 'CursorLine', 'CursorLineNr', 'StatusLine', 'StatusLineNC',
--   'EndOfBuffer',
-- },

return {
    'xiyaowong/transparent.nvim',
    lazy = false,
    opts = {
        groups = {
            'Normal',
            'NormalFloat',
        },
        -- extra_groups = {
        --     'NormalFloat',
        --     -- 'Pmenu',
        --     'TelescopeNormal',
        --     'Folded',
        -- },
        -- exclude_groups = {
        --     'StatusLine',
        --     'StatusLineNC',
        --     'CursorLine',
        --     'CursorLineNr',
        -- },
    },
}
