-- trouble.nvim Diagnostic Viewer
return {
    'folke/trouble.nvim',
    cmd = 'Trouble',
    keys = {
        {
            '<leader>x',
            '<CMD>Trouble diagnostics toggle<CR>',
            desc = '[X] marks the trouble',
        },
    },
    config = true,
}
