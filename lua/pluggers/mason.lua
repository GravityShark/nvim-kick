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
                -- vim.keymap.set(
                --     'n',
                --     '[d',
                --     vim.diagnostic.goto_prev,
                --     { desc = 'Previous diagnostic' }
                -- )
                -- vim.keymap.set(
                --     'n',
                --     ']d',
                --     vim.diagnostic.goto_next,
                --     { desc = 'Next diagnostic' }
                -- )
                -- vim.keymap.set('n', 'K', vim.lsp.buf.hover, { buffer = ev.buf })
                vim.keymap.set(
                    'i',
                    '<C-h>',
                    vim.lsp.buf.signature_help,
                    { buffer = ev.buf }
                )
                vim.keymap.set(
                    'n',
                    '<leader>lw',
                    vim.lsp.buf.workspace_symbol,
                    { buffer = ev.buf, desc = 'LSP [w]orkspace Symbol' }
                )
                -- vim.keymap.set(
                --     'n',
                --     '<leader>lh',
                --     vim.lsp.buf.inlay_hint.is_enabled(),
                --     { buffer = ev.buf, desc = 'LSP [i]nlay hint' }
                -- )
                vim.keymap.set(
                    'n',
                    '<leader>ld',
                    vim.diagnostic.open_float,
                    { buffer = ev.buf, desc = 'LSP [d]iagnostics' }
                )
                vim.keymap.set(
                    'n',
                    '<leader>lc',
                    vim.lsp.buf.code_action,
                    { buffer = ev.buf, desc = 'LSP [c]ode actions' }
                )
                vim.keymap.set(
                    'n',
                    '<leader>lr',
                    vim.lsp.buf.references,
                    { buffer = ev.buf, desc = 'LSP re[f]erences' }
                )
                vim.keymap.set(
                    'n',
                    '<leader>lr',
                    vim.lsp.buf.rename,
                    { buffer = ev.buf, desc = 'LSP [r]ename' }
                )
                vim.keymap.set(
                    'n',
                    'gi',
                    vim.lsp.buf.implementation,
                    { buffer = ev.buf }
                )
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
