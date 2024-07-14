return { -- trouble.nvim Diagnostic Viewer
    'folke/trouble.nvim',
    cmd = 'Trouble',
    keys = {
        {
            '<leader>t',
            '<CMD>Trouble diagnostics toggle<CR>',
            desc = 'trouble diagnostcs',
        },
    },
    opts = {},
}
