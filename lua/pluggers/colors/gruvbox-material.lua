return { -- gruvvin
    'sainnhe/gruvbox-material',
    lazy = false,
    priority = 1000,
    config = function()
        vim.g.gruvbox_material_enable_italic = true
        vim.g.gruvbox_material_better_performance = true
        vim.g.gruvbox_material_diagnostic_text_highligh = true
        vim.opt.background = 'light'
        vim.cmd.colorscheme('gruvbox-material')
    end,
}
