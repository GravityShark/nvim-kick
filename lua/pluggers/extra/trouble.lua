return { -- trouble.nvim Diagnostic Viewer
    'folke/trouble.nvim',
    cmd = 'Trouble',
    keys = {
        {
            '<leader>t',
            '<CMD>Trouble diagnostics toggle<CR>',
            desc = 'trouble diagnostics',
        },
        {
            '[t',
            '<CMD>Trouble diagnostics prev<CR>',
            desc = 'Previous trouble diagnostics',
        },
        {
            ']t',
            '<CMD>Trouble diagnostics next<CR>',
            desc = 'Next trouble diagnostics',
        },
    },
    opts = {},
}
