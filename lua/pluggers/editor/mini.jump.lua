return {
    'echasnovski/mini.jump',
    event = 'VeryLazy',
    opts = {
        delay = {
            highlight = 0,
        },
    },
    config = function(_, opts)
        require('mini.jump').setup(opts)
        vim.api.nvim_set_hl(0, 'MiniJumpSpot', { link = 'Search' })
    end,
}
