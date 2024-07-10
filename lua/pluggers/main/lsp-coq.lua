return {
    -- trouble.nvim Diagnostic Viewer{{{
    {
        'folke/trouble.nvim',
        cmd = 'Trouble',
        keys = {
            {
                '<leader>t',
                '<CMD>Trouble diagnostics toggle<CR>',
                desc = 'rouble diagnostcs',
            },
        },
        opts = {},
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
            { 'williamboman/mason.nvim', cmd = 'Mason', opts = {} },
            { 'j-hui/fidget.nvim', opts = {} },
            {
                'ms-jpq/coq_nvim',
                event = { 'BufReadPost', 'BufNewFile', 'BufWritePre' },
                branch = 'coq',
                build = ':COQdeps',
                dependencies = {
                    { 'ms-jpq/coq.artifacts', branch = 'artifacts' },
                    { 'ms-jpq/coq.thirdparty', branch = '3p' },
                },
                init = function()
                    vim.g.coq_settings = {

-- vim.api.nvim_set_keymap('i', '<Esc>', [[pumvisible() ? "\<C-e><Esc>" : "\<Esc>"]], { expr = true, silent = true })
-- vim.api.nvim_set_keymap('i', '<C-c>', [[pumvisible() ? "\<C-e><C-c>" : "\<C-c>"]], { expr = true, silent = true })
-- vim.api.nvim_set_keymap('i', '<BS>', [[pumvisible() ? "\<C-e><BS>" : "\<BS>"]], { expr = true, silent = true })
-- vim.api.nvim_set_keymap(
--   "i",
--   "<CR>",
--   [[pumvisible() ? (complete_info().selected == -1 ? "\<C-e><CR>" : "\<C-y>") : "\<CR>"]],
--   { expr = true, silent = true }
-- )
-- vim.api.nvim_set_keymap('i', '<Tab>', [[pumvisible() ? "\<C-n>" : "\<Tab>"]], { expr = true, silent = true })
-- vim.api.nvim_set_keymap('i', '<S-Tab>', [[pumvisible() ? "\<C-p>" : "\<BS>"]], { expr = true, silent = true })
                        ['keymap.recommended'] = false,
                        auto_start = 'shut-up',
                        -- ['keymap.pre_select'] = false,
                        display = {
                            ['ghost_text.enabled'] = false,
                            ['preview.border'] = {
                                { '', 'NormalFloat' },
                                { '', 'NormalFloat' },
                                { '', 'NormalFloat' },
                                { ' ', 'NormalFloat' },
                                { '', 'NormalFloat' },
                                { '', 'NormalFloat' },
                                { '', 'NormalFloat' },
                                { ' ', 'NormalFloat' },
                            },
                        },
                    }
                end,
                config = function()
                    -- extra config here
                end,
            },
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
                        { buffer = ev.buf, desc = 'eclaration' }
                    )
                    vim.keymap.set(
                        'n',
                        '<leader>ld',
                        vim.lsp.buf.definition,
                        { buffer = ev.buf, desc = 'efinition' }
                    )
                    vim.keymap.set(
                        'n',
                        '<leader>lt',
                        vim.lsp.buf.type_definition,
                        {
                            buffer = ev.buf,
                            desc = 'ype definition',
                        }
                    )
                    vim.keymap.set(
                        'n',
                        '<leader>ll',
                        vim.lsp.codelens.run,
                        { buffer = ev.buf, desc = 'code[l]ens' }
                    )
                    vim.keymap.set(
                        'n',
                        '<leader>lc',
                        vim.lsp.buf.code_action,
                        { buffer = ev.buf, desc = 'ode actions' }
                    )
                    vim.keymap.set(
                        'n',
                        '<C-e>',
                        vim.lsp.buf.code_action,
                        { buffer = ev.buf }
                    )
                    vim.keymap.set('n', '<leader>lm', vim.lsp.buf.references, {
                        buffer = ev.buf,
                        desc = 'entioned',
                    })
                    vim.keymap.set(
                        'n',
                        '<leader>lr',
                        vim.lsp.buf.rename,
                        { buffer = ev.buf, desc = 'ename' }
                    )
                    vim.keymap.set(
                        'n',
                        '<leader>li',
                        vim.lsp.buf.implementation,
                        {
                            buffer = ev.buf,
                            desc = 'mplementation',
                        }
                    )

                    vim.keymap.set(
                        'n',
                        '<leader>le',
                        vim.diagnostic.open_float,
                        { desc = 'rror popup' }
                    ) --}}}
                end,
            })
            for server_name, server in pairs(require('ensure').lsp) do
                server.capabilities = vim.lsp.protocol.make_client_capabilities()
                require('lspconfig')[server_name].setup(
                    require('coq').lsp_ensure_capabilities(server)
                )
            end
        end, -- }}}
    }, -- }}}
}

-- vim:foldmethod=marker:
