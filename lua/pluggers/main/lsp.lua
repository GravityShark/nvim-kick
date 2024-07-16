-- I do not recommend to touch
return { -- LSP Configuration (compatible with cmp, coq, and even neither!)
    'neovim/nvim-lspconfig',
    event = { 'BufReadPost', 'BufNewFile', 'BufWritePre' },
    dependencies = {
        { -- mason-tool-installer.nvim Easy installation of LSPs
            'WhoIsSethDaniel/mason-tool-installer.nvim',
            event = 'VeryLazy',
            cmd = { 'MasonToolsUpdate', 'MasonToolsInstall' },
            opts = {
                ensure_installed = require('ensure').mason,
                auto_update = true,
            },
        },
        { 'williamboman/mason.nvim', cmd = 'Mason', opts = {} },
        {
            'smjonas/inc-rename.nvim',
            cmd = 'IncRename',
            opts = {},
        },
    },
    config = function()
        -- Keybindings to set when LSP has attached
        vim.api.nvim_create_autocmd('LspAttach', {
            group = vim.api.nvim_create_augroup('UserLspConfig', {}),
            callback = function(ev)
                -- Keybindings
                vim.keymap.set(
                    'n',
                    '<leader>lD',
                    vim.lsp.buf.declaration,
                    { buffer = ev.buf, desc = 'declaration' }
                )
                vim.keymap.set(
                    'n',
                    '<leader>ld',
                    vim.lsp.buf.definition,
                    { buffer = ev.buf, desc = 'definition' }
                )
                vim.keymap.set('n', '<leader>lt', vim.lsp.buf.type_definition, {
                    buffer = ev.buf,
                    desc = 'type definition',
                })
                vim.keymap.set(
                    'n',
                    '<leader>lc',
                    vim.lsp.buf.code_action,
                    { buffer = ev.buf, desc = 'code actions' }
                )
                vim.keymap.set('n', '<leader>lm', vim.lsp.buf.references, {
                    buffer = ev.buf,
                    desc = 'mentions',
                })
                vim.keymap.set('n', '<leader>lr', function()
                    return ':IncRename ' .. vim.fn.expand('<cword>')
                end, {
                    expr = true,
                    buffer = ev.buf,
                    desc = 'rename',
                })

                vim.keymap.set('n', '<leader>li', vim.lsp.buf.implementation, {
                    buffer = ev.buf,
                    desc = 'implementation',
                })

                vim.keymap.set(
                    'n',
                    '<leader>lp',
                    vim.diagnostic.open_float,
                    { desc = 'popup diagnostic' }
                )
                vim.keymap.set('n', '<leader>lw', function()
                    vim.lsp.buf.workspace_symbol()
                end, {
                    desc = 'workspace symbol',
                    buffer = ev.buf,
                })
            end,
        })

        local has_cmp, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
        local has_coq, coq = pcall(require, 'coq_nvim')
        local capabilities = vim.tbl_deep_extend(
            'force',
            vim.lsp.protocol.make_client_capabilities(),
            has_cmp and cmp_nvim_lsp.default_capabilities() or {}
        )

        -- Server setup
        for server_name, server in pairs(require('ensure').lsp) do
            server.capabilities = vim.tbl_deep_extend(
                'force',
                {},
                capabilities,
                server.capabilities or {}
            )

            if has_coq then
                server = coq.lsp_ensure_capabilities(server)
            end
            require('lspconfig')[server_name].setup(server)
        end
    end,
}
