return { -- vim-rhubarb :Gbrowse for going to the git repository in a browser
    --'tpope/vim-rhubarb',
    --cmd = 'GBrowse',
    --dependencies = { -- vim-fugitive :Git for an integrated git experience with vim
    'tpope/vim-fugitive',
    keys = {
        {
            '<leader>g',
            ' ',
            desc = '+git',
        },
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
    --},
}
