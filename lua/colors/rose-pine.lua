return {
    'rose-pine/neovim',
    name = 'rose-pine',
    -- Recommended way of loading themes in lazy
    lazy = false,
    priority = 1000,
    config = function()
        require('rose-pine').setup({
            enable = {
                legacy_highlights = false,
                migrations = false,
            },
            highlight_groups = {
                Folded = { fg = 'muted' },
            },
        })
        vim.cmd('colorscheme rose-pine-dawn')
    end,
}
