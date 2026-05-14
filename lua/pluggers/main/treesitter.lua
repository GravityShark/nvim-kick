return { -- nvim-treesitter Supercharge syntax editing
    'nvim-treesitter/nvim-treesitter',
    branch = 'main',
    build = ':TSUpdate',
    event = { 'BufReadPost', 'BufNewFile', 'BufWritePre', 'VeryLazy' },
    -- dependencies = 'nvim-treesitter/nvim-treesitter-textobjects',
    -- init = function()
    --     local ensureInstalled = require('config.ensure').treesitter
    --     local alreadyInstalled =
    --         require('nvim-treesitter.config').get_installed()
    --     local parsersToInstall = vim.iter(ensureInstalled)
    --         :filter(function(parser)
    --             return not vim.tbl_contains(alreadyInstalled, parser)
    --         end)
    --         :totable()
    --     require('nvim-treesitter').install(parsersToInstall)
    -- end,
    -- config = function()
    --     require('nvim-treesitter.install').prefer_git = true
    ---@diagnostic disable-next-line: missing-fields
    -- require('nvim-treesitter').setup({
    --     auto_install = true,
    --     incremental_selection = {
    --         enable = true,
    --         keymaps = {
    --             init_selection = '<enter>',
    --             node_incremental = false,
    --             scope_incremental = '<enter>',
    --             node_decremental = '<bs>',
    --         },
    --     },
    --     -- textobjects = {
    --     --     move = {
    --     --         enable = true,
    --     --         goto_next_start = {
    --     --             [']f'] = '@function.outer',
    --     --             [']c'] = '@class.outer',
    --     --             [']a'] = '@parameter.inner',
    --     --         },
    --     --         goto_previous_start = {
    --     --             ['[f'] = '@function.outer',
    --     --             ['[c'] = '@class.outer',
    --     --             ['[a'] = '@parameter.inner',
    --     --         },
    --     --     },
    --     -- },
    -- })
    -- end,
}
