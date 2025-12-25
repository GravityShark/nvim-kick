return {
    'nvim-mini/mini.move',
    keys = {
        '<S-left>',
        '<S-right>',
        '<S-down>',
        '<S-up>',
    },
    opts = {
        mappings = {
            -- Move visual selection in Visual mode. Defaults are Alt (Meta) + hjkl.
            left = '<S-left>',
            right = '<S-right>',
            down = '<S-down>',
            up = '<S-up>',

            -- Move current line in Normal mode
            line_left = '<S-left>',
            line_right = '<S-right>',
            line_down = '<S-down>',
            line_up = '<S-up>',
        },
    },
}
