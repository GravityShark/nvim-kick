-- rose-pine

require('mini.base16').setup({
    palette = {
        base00 = '#191724',
        base01 = '#1f1d2e',
        base02 = '#26233a',
        base03 = '#6e6a86',
        base04 = '#908caa',
        base05 = '#e0def4',
        base06 = '#e0def4',
        base07 = '#524f67',
        base08 = '#eb6f92',
        base09 = '#f6c177',
        base0A = '#ebbcba',
        base0B = '#31748f',
        base0C = '#9ccfd8',
        base0D = '#c4a7e7',
        base0E = '#f6c177',
        base0F = '#524f67',
    },
    use_cterm = true,
    plugins = {
        default = false,
        ['nvim-mini/mini.nvim'] = true,
        ['folke/lazy.nvim'] = true,
        ['folke/noice.nvim'] = true,
        ['folke/todo-comments.nvim'] = true,
        ['folke/trouble.nvim'] = true,
        ['folke/which-key.nvim'] = true,
        ['lewis6991/gitsigns.nvim'] = true,
    },
})
vim.g.colors_name = 'base16'
