return {
    'folke/tokyonight.nvim',
    lazy = false,
    config = function()
        vim.cmd.colorscheme('tokyonight')
        return { style = 'moon' }
    end,
}
