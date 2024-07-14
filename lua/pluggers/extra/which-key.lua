return { -- which-key.nvim Keymap hints for the slow
    'folke/which-key.nvim',
    event = 'VeryLazy',
    config = function()
        local wk = require('which-key')
        wk.add({
            { '<leader>f', group = 'find...' }, -- group
            { '<leader>l', group = 'lsp...' },
            { '<leader>C', icon = '󰮘' },
            { '<leader>h', icon = '' },
            { '<leader>r', icon = '' },
            { '<leader>u', icon = '󰙅' },
            { '<leader>>', icon = '󰙅' },
            -- { '<leader>g', group = 'git' },
            -- { '<leader>s', group = 'session' },
        })
        wk.setup({ delay = 0 })
    end,
}
