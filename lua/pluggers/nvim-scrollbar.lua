return {
    'petertriho/nvim-scrollbar',
    event = 'VeryLazy',
    dependencies = {
        {
            'kevinhwang91/nvim-hlslens',
            config = function()
                require('scrollbar.handlers.search').setup({})
            end,
        },
        {
            'lewis6991/gitsigns.nvim',
            config = function()
                require('gitsigns').setup()
                require('scrollbar.handlers.gitsigns').setup()
            end,
        },
    },
    opts = {},
}
