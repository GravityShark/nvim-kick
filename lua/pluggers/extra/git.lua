return { -- Git related stuff
    { -- gitsigns.nvim git related signs to the gutter, as well as utilities for managing changes
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
            },
        },
    },
    { -- vim-fugitive :Git for an integrated git experience with vim
        'tpope/vim-fugitive',
        keys = {
            {
                '<leader>gs',
                '<CMD>Git<CR>',
                desc = 'tatus',
            },
            {
                '<leader>gS',
                '<CMD>Git show<CR>',
                desc = 'how',
            },
            {
                '<leader>gd',
                '<CMD>Git diff<CR>',
                desc = 'iff',
            },
            {
                '<leader>gc',
                '<CMD>Git commit<CR>',
                desc = 'ommit',
            },
            {
                '<leader>gaa',
                '<CMD>Git add .<CR>',
                desc = 'Git Add [a]ll',
            },
            {
                '<leader>gac',
                '<CMD>Git add %<CR>',
                desc = 'Git Add [c]urrent buffer',
            },
            {
                '<leader>gb',
                '<CMD>Git blame<CR>',
                desc = 'lame',
            },
            {
                '<leader>gp',
                '<CMD>Git push<CR>',
                desc = 'ush',
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
        cmd = { 'Git' },
    },
    { -- vim-rhubarb :Gbrowse for going to the git repository in a browser
        'tpope/vim-rhubarb',
        cmd = 'GBrowse',
    },
}
