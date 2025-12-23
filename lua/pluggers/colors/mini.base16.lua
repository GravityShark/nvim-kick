return {
    'nvim-mini/mini.base16',
    lazy = false,
    priority = 1000,
    init = function()
        vim.opt.rtp:prepend(vim.fn.stdpath('config') .. '/custom')
    end,
    opts = {
        palette = require('base16'),
        use_cterm = true,
        plugins = { default = false },
    },
}
