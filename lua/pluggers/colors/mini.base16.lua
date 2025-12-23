return {
    'nvim-mini/mini.base16',
    lazy = false,
    priority = 1000,
    init = function()
        vim.cmd.colorscheme('base16')
        vim.cmd.highlight({ 'SignColumn', 'guibg=NONE', 'ctermbg=NONE' })
        vim.cmd.highlight({ 'LineNr', 'guibg=NONE', 'ctermbg=NONE' })
        vim.cmd.highlight({ 'LineNrAbove', 'guibg=NONE', 'ctermbg=NONE' })
        vim.cmd.highlight({ 'LineNrBelow', 'guibg=NONE', 'ctermbg=NONE' })
    end,
}
