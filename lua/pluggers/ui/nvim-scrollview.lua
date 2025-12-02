return {
    'nvim-scrollview',
    opts = function()
        require('scrollview').setup({})
        require('scrollview.contrib.gitsigns').setup({})
        return {}
    end,
}
