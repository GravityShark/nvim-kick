return {
    'bullets-vim/bullets.vim',
    ft = 'markdown',
    -- event = { 'InsertEnter', 'VeryLazy' },
    init = function()
        vim.g.bullets_outline_levels = { 'num', 'std-' }
        vim.g.bullets_custom_mappings = {
            { 'imap', '<cr>', '<Plug>(bullets-newline)' },
            { 'inoremap', '<C-cr>', '<cr>' },

            { 'nmap', 'o', '<Plug>(bullets-newline)' },

            { 'vmap', 'gN', '<Plug>(bullets-renumber)' },
            { 'nmap', 'gN', '<Plug>(bullets-renumber)' },

            { 'nmap', '<leader>ox', '<Plug>(bullets-toggle-checkbox)' },

            { 'imap', '<C-t>', '<Plug>(bullets-demote)' },
            { 'nmap', '>>', '<Plug>(bullets-demote)' },
            { 'vmap', '>', '<Plug>(bullets-demote)' },
            { 'imap', '<C-d>', '<Plug>(bullets-promote)' },
            { 'nmap', '<<', '<Plug>(bullets-promote)' },
            { 'vmap', '<', '<Plug>(bullets-promote)' },
        }
    end,
}
