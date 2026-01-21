return {
    'bullets-vim/bullets.vim',
    events = { 'InsertEnter', 'VeryLazy' },
    init = function()
        vim.g.bullets_outline_levels = { 'num', 'abc' }
    end,
}
