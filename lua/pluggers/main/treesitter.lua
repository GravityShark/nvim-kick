return {
    { -- nvim-treesitter Obligatory syntax highlighting
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        event = { 'BufReadPost', 'BufNewFile', 'BufWritePre', 'VeryLazy' },
        dependencies = {
            { -- nvim-treesitter-context Gives you a little context on what indent you are in
                'nvim-treesitter/nvim-treesitter-context',
                opts = {
                    max_lines = 4,
                    multiline_threshold = 1,
                },
            },
        },
        config = function(_, opts)
            require('nvim-treesitter.install').prefer_git = true
            ---@diagnostic disable-next-line: missing-fields
            require('nvim-treesitter.configs').setup({
                ensure_installed = require('ensure').treesitter,
                highlight = {
                    enable = true,
                },
                indent = { enable = true },
            })
        end,
    },
    { -- ts-comments Just better comments
        'folke/ts-comments.nvim',
        event = 'VeryLazy',
        opts = {},
    },
}
