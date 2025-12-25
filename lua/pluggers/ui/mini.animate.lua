return {
    'nvim-mini/mini.animate',
    event = 'VeryLazy',
    opts = {
        scroll = {
            enable = false,
        },
        cursor = {
            timing = function(n)
                return 250 * (1 - ((1 - n) * (1 - n)))
            end,
        },
    },
}
