return {
    'nvim-mini/mini.move',
    keys = {
        '<S-Left>',
        '<S-Right>',
        '<S-Down>',
        '<S-Up>',
    },
    opts = {
        mappings = {
            -- Move visual selection in Visual mode. Defaults are Alt (Meta) + hjkl.
            left = '<S-Left>',
            right = '<S-Right>',
            down = '<S-Down>',
            up = '<S-Up>',

            -- Move current line in Normal mode
            line_left = '<S-Left>',
            line_right = '<S-Right>',
            line_down = '<S-Down>',
            line_up = '<S-Up>',
        },
    },
}
