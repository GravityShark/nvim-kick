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
        local ok, gs = pcall(require, 'gitsigns')
        if ok then
            local next_hunk, prev_hunk =
                ts_repeat_move.make_repeatable_move_pair(
                    gs.next_hunk,
                    gs.prev_hunk
                )
            vim.keymap.set(
                { 'n', 'x', 'o' },
                ']h',
                ts_repeat_move.builtin_T_expr,
                { expr = true }
            )
            vim.keymap.set(
                { 'n', 'x', 'o' },
                ']g',
                next_hunk,
                { desc = 'Next hunk' }
            )
            vim.keymap.set(
                { 'n', 'x', 'o' },
                '[g',
                prev_hunk,
                { desc = 'Previous hunk' }
            )
        end
    end,
}
