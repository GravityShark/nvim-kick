return {
    'catppuccin/nvim',
    lazy = false,
    name = 'catppuccin',
    priority = 1000,
    init = function()
        vim.cmd.colorscheme('catppuccin')
        -- vim.opt.pumblend = 10
        -- vim.opt.winblend = 10
        --
    end,
    config = {},
}
