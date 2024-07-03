-- gitsigns.nvim Adds git related signs to the gutter, as well as utilities for managing changes
return {
    {
        'lewis6991/gitsigns.nvim',
        event = 'VeryLazy',
        opts = {
            signs = {
                add = { text = '▎' },
                change = { text = '▎' },
                delete = { text = '󰐊' },
                topdelete = { text = '󰐊' },
                changedelete = { text = '▎' },
                untracked = { text = '┆' },
                -- add = {
                --     hl = 'gitsignsadd',
                --     text = '▎',
                --     numhl = 'gitsignsaddnr',
                --     linehl = 'gitsignsaddln',
                -- },
                -- change = {
                --     hl = 'gitsignschange',
                --     text = '▎',
                --     numhl = 'gitsignschangenr',
                --     linehl = 'gitsignschangeln',
                -- },
                -- delete = {
                --     hl = 'gitsignsdelete',
                --     text = '󰐊',
                --     numhl = 'gitsignsdeletenr',
                --     linehl = 'gitsignsdeleteln',
                -- },
                -- topdelete = {
                --     hl = 'gitsignsdelete',
                --     text = '󰐊',
                --     numhl = 'gitsignsdeletenr',
                --     linehl = 'gitsignsdeleteln',
                -- },
                -- changedelete = {
                --     hl = 'gitsignschange',
                --     text = '▎',
                --     numhl = 'gitsignschangenr',
                --     linehl = 'gitsignschangeln',
                -- },
            },
            --[[on_attach = function(bufnr)
        vim.keymap.set(
            'n',
            '<leader>gh',
            require('gitsigns').preview_hunk,
            { buffer = bufnr, desc = 'Preview git [h]unk' }
        )
        vim.keymap.set(
            'n',
            '<leader>gl',
            require('gitsigns').toggle_current_line_blame,
            { buffer = bufnr, desc = 'Git [l]ine blame' }
        )

        -- don't override the built-in and fugitive keymaps
        -- local gs = package.loaded.gitsigns
        -- vim.keymap.set({ 'n', 'v' }, ']c', function()
        -- 	if vim.wo.diff then
        -- 		return ']c'
        -- 	end
        -- 	vim.schedule(function()
        -- 		gs.next_hunk()
        -- 	end)
        -- 	return '<Ignore>'
        -- end, { expr = true, buffer = bufnr, desc = 'Jump to next hunk' })
        -- vim.keymap.set({ 'n', 'v' }, '[c', function()
        -- 	if vim.wo.diff then
        -- 		return '[c'
        -- 	end
        -- 	vim.schedule(function()
        -- 		gs.prev_hunk()
        -- 	end)
        -- 	return '<Ignore>'
        -- end, {
        -- 	expr = true,
        -- 	buffer = bufnr,
        -- 	desc = 'Jump to previous hunk',
        -- })
    end, ]]
            --
        },
    },

    {
        'tpope/vim-fugitive',
        keys = {
            {
                '<leader>gs',
                '<CMD>Git<CR>',
                desc = 'Git [s]tatus',
            },
            {
                '<leader>gd',
                '<CMD>Git diff<CR>',
                desc = 'Git [d]iff',
            },
            {
                '<leader>gc',
                '<CMD>Git commit<CR>',
                { desc = 'Git [c]ommit' },
            },
            {
                '<leader>gaa',
                '<CMD>Git add .<CR>',
                { desc = 'Git Add [a]ll' },
            },
            {
                '<leader>gac',
                '<CMD>Git add %<CR>',
                { desc = 'Git Add [c]urrent buffer' },
            },
            {
                '<leader>gb',
                '<CMD>Git blame<CR>',
                { desc = 'Git [b]lame' },
            },
            -- {
            --     '<leader>gs',
            --     '<CMD>Git show<CR>',
            --     { desc = 'Git [s]how' },
            -- },
            {
                '<leader>gp',
                '<CMD>Git push<CR>',
                { desc = 'Git [p]ush' },
            },
            {
                'gl',
                '<CMD>diffget //2<CR>',
                { desc = 'diffget //2', noremap = true },
            },
            {
                'gh',
                '<CMD>diffget //3<CR>',
                { desc = 'diffget //3', noremap = true },
            },
        },
        cmd = { 'Git', 'GBrowse' },
        dependencies = 'tpope/vim-rhubarb',
    },
}
