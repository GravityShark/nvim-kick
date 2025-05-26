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
        local search_hl =
            vim.api.nvim_get_hl(0, { name = 'Search', link = false })
        local minijump_hl =
            vim.api.nvim_get_hl(0, { name = 'MiniJump', link = false })

        -- Set MiniJumpSpot with same colors and extra styles
        vim.api.nvim_set_hl(0, 'MiniJumpSpot', {
            fg = minijump_hl.fg,
            bg = search_hl.bg,
            bold = true,
            underline = true,
        })
    end,
}
