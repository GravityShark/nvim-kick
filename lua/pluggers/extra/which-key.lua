return { -- which-key.nvim Keymap hints for the slow
    'folke/which-key.nvim',
    event = 'VeryLazy',
    config = function()
        require('which-key').setup({
            delay = 0,
            win = { no_overlap = false },
            icons = { separator = '', group = '', rules = false },
        })
    end,
}
