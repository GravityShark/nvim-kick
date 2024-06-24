return {
    {
        -- Highlight, edit, and navigate code
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        event = {  "BufReadPost", "BufNewFile", "BufWritePre" , 'VeryLazy' },
        dependencies = {
            {
                'nvim-treesitter/nvim-treesitter-context',
                opts = {
                    -- max_lines = 8,
                    multiline_threshold = 1,
                },
            },
        },
        opts = {
            ensure_installed = require('ensure').treesitter,
            highlight = {
                enable = true,
            },
            indent = { enable = true },
        },
        config = function(_, opts)
            require('nvim-treesitter.install').prefer_git = true
            ---@diagnostic disable-next-line: missing-fields
            require('nvim-treesitter.configs').setup(opts)
        end,
    },

    { -- I should use emmet instead of this tbh but might aswell have it
        'windwp/nvim-ts-autotag',
        ft = { 'html', 'javascript', 'markdown' },
        config = true,
    },
}
