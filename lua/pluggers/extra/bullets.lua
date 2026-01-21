return {
    'bullets-vim/bullets.vim',
    ft = 'markdown',
    event = { 'InsertEnter', 'VeryLazy' },
    init = function()
        vim.g.bullets_outline_levels = { 'num' }
    end,
}
