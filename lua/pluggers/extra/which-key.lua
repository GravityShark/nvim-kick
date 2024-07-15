return { -- which-key.nvim Keymap hints for the slow
    'folke/which-key.nvim',
    event = 'VeryLazy',
    config = function()
        local wk = require('which-key')
        wk.add({
            { '<leader>f', group = 'find...' },
            { '<leader>l', group = 'lsp...' },
        })
        wk.setup({
            delay = 0,
            win = { no_overlap = false },
            icons = { separator = '', group = '', rules = false },
        })
    end,
}
