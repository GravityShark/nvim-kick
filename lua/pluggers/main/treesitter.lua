return { -- nvim-treesitter Obligatory syntax highlighting
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    event = { 'BufReadPost', 'BufNewFile', 'BufWritePre', 'VeryLazy' },
    config = function()
        require('nvim-treesitter.install').prefer_git = true
        ---@diagnostic disable-next-line: missing-fields
        require('nvim-treesitter.configs').setup({
            ensure_installed = require('ensure').treesitter,
            auto_install = true,
            highlight = { enable = true },
            indent = { enable = true },
        })
    end,
}
