return {
    'nvim-mini/mini.animate',
    event = 'VeryLazy',
    config = function()
        local animate = require('mini.animate')

        animate.setup({
            scroll = {
                enable = false,
            },
            cursor = {
                timing = animate.gen_timing.quartic({
                    easing = 'out',
                    duration = 50,
                    step = 'total',
                }),
            },
        })
    end,
}
