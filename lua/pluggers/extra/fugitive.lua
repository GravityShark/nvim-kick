-- vim-fugitive Adds commands for doing git stuff {{{
return {
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
}
