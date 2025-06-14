return { -- Default LSP Configurations
    'neovim/nvim-lspconfig',
    init = function()
        vim.diagnostic.config({
            update_in_insert = false,
            virtual_text = {
                spacing = 4,
                source = 'if_many',
                prefix = '●',
                -- this will set set the prefix to a function that returns the diagnostics icon based on the severity
                -- this only works on a recent 0.10.0 build. Will be set to "●" when not supported
                -- prefix = "icons",
            },
            severity_sort = true,
            signs = {
                text = {
                    [vim.diagnostic.severity.ERROR] = ' ',
                    [vim.diagnostic.severity.WARN] = ' ',
                    [vim.diagnostic.severity.HINT] = '󰌵 ',
                    [vim.diagnostic.severity.INFO] = '󰋼 ',
                },
            },
        })

        vim.api.nvim_create_autocmd('LspAttach', {
            group = vim.api.nvim_create_augroup('UserLspConfig', {}),
            callback = function(ev)
                -- Keybindings
                vim.keymap.set(
                    'n',
                    '<leader>cD',
                    vim.lsp.buf.declaration,
                    { buffer = ev.buf, desc = 'declaration' }
                )
                vim.keymap.set(
                    'n',
                    '<leader>cd',
                    vim.lsp.buf.definition,
                    { buffer = ev.buf, desc = 'definition' }
                )
                vim.keymap.set('n', '<leader>cl', vim.lsp.codelens.run, {
                    buffer = ev.buf,
                    desc = 'lens',
                })
                vim.keymap.set('n', '<leader>cI', function()
                    vim.lsp.inlay_hint.enable(
                        not vim.lsp.inlay_hint.is_enabled()
                    )
                end, {
                    desc = 'inlay hints',
                })
                vim.keymap.set('n', '<leader>ct', vim.lsp.buf.type_definition, {
                    buffer = ev.buf,
                    desc = 'type definition',
                })
                vim.keymap.set(
                    'n',
                    '<leader>cc',
                    vim.lsp.buf.code_action,
                    { buffer = ev.buf, desc = 'code actions' }
                )
                vim.keymap.set('n', '<leader>cm', vim.lsp.buf.references, {
                    buffer = ev.buf,
                    desc = 'mentions',
                })

                local ok = pcall(require, 'inc_rename')
                if ok then
                    vim.keymap.set('n', '<leader>cr', function()
                        return ':IncRename ' .. vim.fn.expand('<cword>')
                    end, { expr = true, desc = 'rename' })
                else
                    vim.keymap.set(
                        'n',
                        '<leader>cr',
                        vim.lsp.buf.rename,
                        { buffer = ev.buf, desc = 'rename' }
                    )
                end

                vim.keymap.set('n', '<leader>ci', vim.lsp.buf.implementation, {
                    buffer = ev.buf,
                    desc = 'implementation',
                })

                vim.keymap.set(
                    'n',
                    '<leader>cp',
                    vim.diagnostic.open_float,
                    { desc = 'popup diagnostic' }
                )
                vim.keymap.set('n', '<leader>cw', function()
                    vim.lsp.buf.workspace_symbol()
                end, {
                    desc = 'workspace symbol',
                    buffer = ev.buf,
                })
            end,
        })
    end,
    event = { 'BufReadPost', 'BufNewFile', 'BufWritePre', 'VeryLazy' },
    config = function()
        for key, val in pairs(servers) do
            if type(val) == 'table' then
                vim.lsp.enable(name)
                vim.lsp.config(name, val)
            else
                vim.lsp.enable(val)
            end
        end
    end,
}
