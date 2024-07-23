return { -- nvim-treesitter Supercharge syntax editing
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    event = { 'BufReadPost', 'BufNewFile', 'BufWritePre', 'VeryLazy' },
    dependencies = 'nvim-treesitter/nvim-treesitter-textobjects',
    config = function()
        require('nvim-treesitter.install').prefer_git = true
        ---@diagnostic disable-next-line: missing-fields
        require('nvim-treesitter.configs').setup({
            ensure_installed = require('ensure').treesitter,
            auto_install = true,
            highlight = { enable = true },
            indent = { enable = true },
            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = '<enter>',
                    node_incremental = '<enter>',
                    scope_incremental = false,
                    node_decremental = '<bs>',
                },
            },
            textobjects = {
                move = {
                    enable = true,
                    goto_next_start = {
                        [']f'] = '@function.outer',
                        [']c'] = '@class.outer',
                        [']a'] = '@parameter.inner',
                        [']s'] = {
                            query = '@scope',
                            query_group = 'locals',
                            desc = 'Next scope',
                        },
                        [']z'] = {
                            query = '@fold',
                            query_group = 'folds',
                            desc = 'Next fold',
                        },
                    },
                    goto_next_end = {
                        [']F'] = '@function.outer',
                        [']C'] = '@class.outer',
                        [']A'] = '@parameter.inner',
                    },
                    goto_previous_start = {
                        ['[f'] = '@function.outer',
                        ['[c'] = '@class.outer',
                        ['[a'] = '@parameter.inner',
                        ['[s'] = {
                            query = '@scope',
                            query_group = 'locals',
                            desc = 'Next scope',
                        },
                        ['[z'] = {
                            query = '@fold',
                            query_group = 'folds',
                            desc = 'Next fold',
                        },
                    },
                    goto_previous_end = {
                        ['[F'] = '@function.outer',
                        ['[C'] = '@class.outer',
                        ['[A'] = '@parameter.inner',
                    },
                },
            },
        })
        local ts_repeat_move =
            require('nvim-treesitter.textobjects.repeatable_move')
        vim.keymap.set({ 'n', 'x', 'o' }, ';', ts_repeat_move.repeat_last_move)
        vim.keymap.set(
            { 'n', 'x', 'o' },
            ',',
            ts_repeat_move.repeat_last_move_opposite
        )

        vim.keymap.set(
            { 'n', 'x', 'o' },
            'f',
            ts_repeat_move.builtin_f_expr,
            { expr = true }
        )
        vim.keymap.set(
            { 'n', 'x', 'o' },
            'F',
            ts_repeat_move.builtin_F_expr,
            { expr = true }
        )
        vim.keymap.set(
            { 'n', 'x', 'o' },
            't',
            ts_repeat_move.builtin_t_expr,
            { expr = true }
        )
        vim.keymap.set(
            { 'n', 'x', 'o' },
            'T',
            ts_repeat_move.builtin_T_expr,
            { expr = true }
        )
    end,
}
