return {
    'nvim-mini/mini.base16',
    lazy = false,
    priority = 1000,
    opts = {
        palette = require('base16.lua'),
        use_cterm = true,
        plugins = { default = false },
    },
}
