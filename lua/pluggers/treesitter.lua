return {
    -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    event = { 'BufReadPost', 'BufWritePre', 'BufNewFile', 'VeryLazy' },
    dependencies = {
        { -- I should use emmet instead of this tbh but might aswell have it
            'windwp/nvim-ts-autotag',
            ft = { 'html', 'javascript', 'markdown' },
            config = true,
        },
        { 'nvim-treesitter/nvim-treesitter-context', config = true },
    },
    opts = {
        ensure_installed = require('ensure').treesitter,
        highlight = {
            enable = true,
        },
        indent = { enable = true },

        -- incremental_selection = {
        --     enable = true,
        --     keymaps = {
        --         init_selection = 'gnn',
        --         node_incremental = 'grn',
        --         scope_incremental = 'grc',
        --         node_decremental = 'grm',
        --     },
        -- },
    },
    config = function(_, opts)
        require('nvim-treesitter.install').prefer_git = true
        ---@diagnostic disable-next-line: missing-fields
        require('nvim-treesitter.configs').setup(opts)
    end,
}
