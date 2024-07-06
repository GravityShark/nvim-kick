-- Plugins that involve development in a specific environment
return {
    -- neodev.nvim Helps in neovim development
    {
        'folke/lazydev.nvim',
        ft = 'lua',
        cmd = 'LazyDev',
        opts = {
            library = {
                { path = 'luvit-meta/library', words = { 'vim%.uv' } },
                { path = 'LazyVim', words = { 'LazyVim' } },
                { path = 'lazy.nvim', words = { 'LazyVim' } },
            },
        },
    },
    -- typst-preview.nvim Allows for a live preview of your typst document
    {
        'chomosuke/typst-preview.nvim',
        ft = 'typst',
        version = '0.3.*',
        build = function()
            require('typst-preview').update()
        end,
        opts = {
            debug = true,
            open_cmd = 'flatpak run com.brave.Browser --incognito --app="%s"',
        },
    },
}
