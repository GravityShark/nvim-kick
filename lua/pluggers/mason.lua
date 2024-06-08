return {
    -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',
    event = { 'BufReadPost', 'BufWritePre', 'BufNewFile' },
    init = function()
        -- LSP {{{
        vim.api.nvim_create_autocmd('LspAttach', {
            group = vim.api.nvim_create_augroup('UserLspConfig', {}),
            callback = function(ev)
                vim.keymap.set(
                    'n',
                    '<leader>lD',
                    vim.lsp.buf.declaration,
                    { buffer = ev.buf, desc = 'LSP [D]eclaration' }
                )
                vim.keymap.set(
                    'n',
                    '<leader>ld',
                    vim.lsp.buf.definition,
                    { buffer = ev.buf, desc = 'LSP [d]efinition' }
                )
                vim.keymap.set('n', '<leader>lt', vim.lsp.buf.type_definition, {
                    buffer = ev.buf,
                    desc = 'LSP [t]ype definition',
                })
                --[[ Neovim 10.0 has these as default
                vim.keymap.set(
                    'n',
                    '[d',
                    vim.diagnostic.goto_prev,
                    { desc = 'Previous diagnostic' }
                )
                vim.keymap.set(
                    'n',
                    ']d',
                    vim.diagnostic.goto_next,
                    { desc = 'Next diagnostic' }
                )
                vim.keymap.set('n', 'K', vim.lsp.buf.hover, { buffer = ev.buf }) ]]
                --
                vim.keymap.set(
                    'i',
                    '<C-h>',
                    vim.lsp.buf.signature_help,
                    { buffer = ev.buf }
                )
                vim.keymap.set(
                    'n',
                    '<leader>ll',
                    vim.lsp.codelens.run,
                    { buffer = ev.buf, desc = 'LSP code[l]ens' }
                )
                vim.keymap.set(
                    'n',
                    '<leader>lc',
                    vim.lsp.buf.code_action,
                    { buffer = ev.buf, desc = 'LSP [c]ode actions' }
                )
                vim.keymap.set('n', '<leader>lm', vim.lsp.buf.references, {
                    buffer = ev.buf,
                    desc = 'LSP [m]entioned (Where a symbol is used, reverse of [i]mplementation)',
                })
                vim.keymap.set(
                    'n',
                    '<leader>lr',
                    vim.lsp.buf.rename,
                    { buffer = ev.buf, desc = 'LSP [r]ename' }
                )
                vim.keymap.set('n', '<leader>li', vim.lsp.buf.implementation, {
                    buffer = ev.buf,
                    desc = 'LSP [i]mplementation (Where a symbol came from, reverse of [m]entions)',
                })
            end,
        })

        -- }}}
    end,
    config = function()
        require('pluggers.lspconfig')
    end,
    dependencies = {
        -- Easy installation of LSPs and more
        {
            'WhoIsSethDaniel/mason-tool-installer.nvim',
            dependencies = {
                { 'williamboman/mason.nvim', cmd = 'Mason', opts = {} },
            },
        },
    },
}
