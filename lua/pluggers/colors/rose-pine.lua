return { -- soho vibes
    'rose-pine/neovim',
    name = 'rose-pine',
    lazy = false,
    priority = 1000,
    init = function()
        vim.cmd('colorscheme rose-pine-dawn')
    end,
    opts = {
        highlight_groups = {
            Folded = { fg = 'muted' },
            MiniJump = { fg = 'pine', undercurl = false, underline = true },
        },
    },
}
