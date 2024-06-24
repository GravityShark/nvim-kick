    -- neodev.nvim Helps in neovim development
return {
    { 'folke/neodev.nvim', enabled = true, opts = {} },
    -- mini.doc When developing docs in mini.nvim plugins
    -- { 'echasnovski/mini.doc', enabled = false, opts = {} },
    {
        'chomosuke/typst-preview.nvim',
        ft = 'typst',
        version = '0.3.*',
        build = function()
            require('typst-preview').update()
        end,
    },
    }
