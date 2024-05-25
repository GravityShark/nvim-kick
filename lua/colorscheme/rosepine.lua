return {
    'rose-pine/neovim',
    name = 'rose-pine',
    -- Recommended way of loading themes in lazy
    lazy = false,
    priority = 1000,
    config = function()
        vim.cmd([[colorscheme rose-pine]])
    end,
}
