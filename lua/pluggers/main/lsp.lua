return {
    -- ltex ls extra shit
    'barreiroleo/ltex_extra.nvim',
    -- trouble.nvim Diagnostic Viewer{{{
    {
        'folke/trouble.nvim',
        cmd = 'Trouble',
        keys = {
            {
                '<leader>t',
                '<CMD>Trouble diagnostics toggle<CR>',
                desc = '[t]rouble diagnostcs',
            },
        },
        config = true,
    }, -- }}}
    -- LSP Configuration & Plugins{{{
    {
        'neovim/nvim-lspconfig',
        event = { 'BufReadPost', 'BufNewFile', 'BufWritePre' },
        dependencies = { -- {{{
            -- Easy installation of LSPs and more
            {
                'WhoIsSethDaniel/mason-tool-installer.nvim',
                event = 'VeryLazy',
                cmd = { 'MasonToolsUpdate', 'MasonToolsInstall' },
                opts = {
                    ensure_installed = require('ensure').mason,
                    auto_update = true,
                },
            },
            { 'williamboman/mason.nvim', cmd = 'Mason', config = true },
            { 'j-hui/fidget.nvim', config = true },
        }, -- }}}
        config = function() -- {{{
            -- LspAttach{{
            vim.api.nvim_create_autocmd('LspAttach', {
                group = vim.api.nvim_create_augroup('UserLspConfig', {}),
                callback = function(ev)
                    -- Keybindings{{{
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
                    vim.keymap.set(
                        'n',
                        '<leader>lt',
                        vim.lsp.buf.type_definition,
                        {
                            buffer = ev.buf,
                            desc = 'LSP [t]ype definition',
                        }
                    )
                    --[[ Neovim 10.0 has these as default{{{
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
                    --}}}
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
                    vim.keymap.set(
                        'n',
                        '<C-e>',
                        vim.lsp.buf.code_action,
                        { buffer = ev.buf }
                    )
                    vim.keymap.set('n', '<leader>lm', vim.lsp.buf.references, {
                        buffer = ev.buf,
                        desc = 'LSP [m]entioned',
                    })
                    vim.keymap.set(
                        'n',
                        '<leader>lr',
                        vim.lsp.buf.rename,
                        { buffer = ev.buf, desc = 'LSP [r]ename' }
                    )
                    vim.keymap.set(
                        'n',
                        '<leader>li',
                        vim.lsp.buf.implementation,
                        {
                            buffer = ev.buf,
                            desc = 'LSP [i]mplementation',
                        }
                    ) --}}}

                    vim.keymap.set(
                        'n',
                        '<leader>le',
                        vim.diagnostic.open_float,
                        { desc = 'LSP view [e]rror' }
                    )
                    -- The following autocommand is used to enable inlay hints
                    -- in your code, if the language server you are using
                    -- supports them. This may be unwanted, since they
                    -- displace some of your code.
                    local client = vim.lsp.get_client_by_id(ev.data.client_id) -- {{{
                    if
                        client
                        and client.server_capabilities.inlayHintProvider
                        and vim.lsp.inlay_hint
                    then
                        vim.keymap.set('n', '<leader>lh', function()
                            vim.lsp.inlay_hint.enable(
                                not vim.lsp.inlay_hint.is_enabled
                            )
                        end, {
                            buffer = ev.buf,
                            desc = 'LSP Toggle Inlay [H]ints',
                        })
                    end -- }}}
                end,
            }) -- }}}
            local capabilities = vim.lsp.protocol.make_client_capabilities()
            capabilities = vim.tbl_deep_extend(
                'force',
                capabilities,
                require('cmp_nvim_lsp').default_capabilities()
            )
            for server_name, server in pairs(require('ensure').lsp) do
                server.capabilities = vim.tbl_deep_extend(
                    'force',
                    {},
                    capabilities,
                    server.capabilities or {}
                )

                require('lspconfig')[server_name].setup(server)
            end -- }}}
        end, -- }}}
    }, -- }}}
}

-- vim:foldmethod=marker:
