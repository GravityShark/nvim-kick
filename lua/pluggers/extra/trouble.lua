-- trouble.nvim Diagnostic Viewer
return {
    'folke/trouble.nvim',
    cmd = 'Trouble',
    keys = {
        {
            '<leader>x',
            '<CMD>Trouble diagnostics toggle<CR>',
            desc = 'Trouble [x] Toggle',
        },
    },
    opts = {
        -- signs = {
        --     error = ' ',
        --     warn = ' ',
        --     hint = '󰌵 ',
        --     information = '󰋼 ',
        --     other = '',
        -- },
    },
}
