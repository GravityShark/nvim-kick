return { -- vim-rhubarb :Gbrowse for going to the git repository in a browser
    'tpope/vim-rhubarb',
    cmd = 'GBrowse',
    dependencies = { -- vim-fugitive :Git for an integrated git experience with vim
        'tpope/vim-fugitive',
        keys = {
            {
                '<leader>gm',
                '<CMD>Git<CR>',
                desc = 'Menu',
            },
            {
                '<leader>gc',
                '<CMD>Git show<CR>',
                desc = 'Changes',
            },
            -- {
            --     '<leader>gd',
            --     '<CMD>Git diff<CR>',
            --     desc = 'iff',
            -- },
            -- {
            --     '<leader>gc',
            --     '<CMD>Git commit<CR>',
            --     desc = 'ommit',
            -- },
            -- {
            --     '<leader>gaa',
            --     '<CMD>Git add .<CR>',
            --     desc = 'Git Add [a]ll',
            -- },
            -- {
            --     '<leader>gac',
            --     '<CMD>Git add %<CR>',
            --     desc = 'Git Add [c]urrent buffer',
            -- },
            -- {
            --     '<leader>gb',
            --     '<CMD>Git blame<CR>',
            --     desc = 'lame',
            -- },
            {
                '<leader>gp',
                '<CMD>Git push<CR>',
                desc = 'ush',
            },
            {
                'gt',
                '<CMD>diffget //2<CR>',
                { desc = 'diffget //2', noremap = true },
            },
            {
                'gn',
                '<CMD>diffget //3<CR>',
                { desc = 'diffget //3', noremap = true },
            },
        },
        cmd = { 'Git' },
    },
}
