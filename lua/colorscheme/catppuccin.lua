return {
    'catppuccin/nvim',
    enabled = false,
    lazy = false,
    name = 'catppuccin',
    priority = 1000,
    config = function()
        vim.opt.termguicolors = true
        require('pluggers.catppuccin')
        vim.cmd.colorscheme('catppuccin')
    end,
}
