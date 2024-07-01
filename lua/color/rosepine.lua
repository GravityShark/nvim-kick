return {
    'rose-pine/neovim',
    name = 'rose-pine',
    -- Recommended way of loading themes in lazy
    lazy = false,
    priority = 1000,
    config = function()
        vim.cmd([[colorscheme rose-pine]])
        vim.api.nvim_set_hl(
            0,
            'MiniCursorword',
            { default = true, bg = '#403d52' }
        )
        -- require('color.transparent')
    end,
}
