-- Plugins that involve development in a specific environment
return {
    -- lazydev.nvim Helps in neovim development
    {
        'folke/lazydev.nvim',
        ft = 'lua', -- only load on lua files
        opts = {
            integrations = {
                cmp = false,
                coq = true,
            },
        },
    },
}
