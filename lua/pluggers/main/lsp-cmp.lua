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
    -- I do not recommend to touch
    {
        'neovim/nvim-lspconfig',
        event = { 'BufReadPost', 'BufNewFile', 'BufWritePre' },
        dependencies = { -- {{{
            { -- Easy installation of LSPs
                'WhoIsSethDaniel/mason-tool-installer.nvim',
                event = 'VeryLazy',
                cmd = { 'MasonToolsUpdate', 'MasonToolsInstall' },
                opts = {
                    ensure_installed = require('ensure').mason,
                    auto_update = true,
                },
            }, -- }}}
            { 'williamboman/mason.nvim', cmd = 'Mason', opts = {} },
            { 'j-hui/fidget.nvim', opts = {} },
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
                        '<leader>lc',
                        vim.lsp.buf.code_action,
                        { buffer = ev.buf, desc = 'ode actions' }
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
                server.capabilities =
                    vim.lsp.protocol.make_client_capabilities()
                require('lspconfig')[server_name].setup(server)
            end
        end, -- }}}
    }, -- }}}
    -- nvim-cmp Better completion menu {{{
    {
        'hrsh7th/nvim-cmp',
        event = 'InsertEnter',
        dependencies = {
            -- Paths to sources
            'https://codeberg.org/FelipeLema/cmp-async-path',
            -- LSP completion capabilities
            'hrsh7th/cmp-nvim-lsp',
            -- Built-in vim auto-complete
            'hrsh7th/cmp-buffer',
            -- Add Snippets as possible completion
            {
                'garymjr/nvim-snippets',
                opts = {
                    friendly_snippets = true,
                },
                dependencies = { 'rafamadriz/friendly-snippets' },
            },
        },
        keys = {
            {
                '<C-j>',
                function()
                    return vim.snippet.active({ direction = 1 })
                        and '<cmd>lua vim.snippet.jump(1)<cr>'
                end,
                expr = true,
                silent = true,
                mode = { 'i', 's' },
            },
            {
                '<C-k>',
                function()
                    return vim.snippet.active({ direction = -1 })
                        and '<cmd>lua vim.snippet.jump(-1)<cr>'
                end,
                expr = true,
                silent = true,
                mode = { 'i', 's' },
            },
        },
        config = function() -- {{{
            local cmp = require('cmp')

            local kind_icons = {
                Text = '󰉿',
                Method = '󰆧',
                Function = '󰊕',
                Constructor = '',
                Field = '󰜢',
                Variable = '󰀫',
                Class = '󰠱',
                Interface = '',
                Module = '',
                Property = '󰜢',
                Unit = '󰑭',
                Value = '󰎠',
                Enum = '',
                Keyword = '󰌋',
                Snippet = '',
                Color = '󰏘',
                File = '󰈙',
                Reference = '󰈇',
                Folder = '󰉋',
                EnumMember = '',
                Constant = '󰏿',
                Struct = '󰙅',
                Event = '',
                Operator = '󰆕',
                TypeParameter = '',
            }

            ---@diagnostic disable-next-line: missing-fields
            cmp.setup({

                preselect = true and cmp.PreselectMode.Item
                    or cmp.PreselectMode.None,

                window = {
                    completion = {
                        completeopt = 'menu,menuone,noinsert',
                        -- border = 'rounded',
                        scrollbar = true,
                        winhighlight = 'FloatBorder:SpecialChar',
                    },
                    documentation = {
                        winhighlight = 'FloatBorder:SpecialChar',
                        -- border = 'rounded',
                        scrollbar = true,
                    },
                },

                mapping = cmp.mapping.preset.insert({
                    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-f>'] = cmp.mapping.scroll_docs(4),
                    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
                    ['<C-Space>'] = cmp.mapping.complete({}),
                }),
                behavior = cmp.SelectBehavior.Select,

                completion = {
                    completeopt = 'menu,menuone,noinsert',
                },

                sources = {
                    { name = 'nvim_lsp' },
                    { name = 'snippets' },
                    { name = 'async_path' },
                    { name = 'buffer' },
                    -- Org mode
                    { name = 'orgmode' },
                },

                ---@diagnostic disable-next-line: missing-fields
                formatting = {
                    fields = { 'abbr', 'kind', 'menu' },
                    format = function(entry, vim_item)
                        vim_item.menu = ({
                            buffer = 'Buf',
                            nvim_lsp = 'LSP',
                            snippets = 'Snp',
                            async_path = 'Pth',
                            orgmode = 'Org',
                        })[entry.source.name]
                        vim_item.kind = string.format(
                            '%s %s',
                            kind_icons[vim_item.kind],
                            vim_item.kind
                        )
                        return vim_item
                    end,
                },

                experimental = {
                    ghost_text = {
                        hl_group = 'CmpGhostText',
                    },
                },
            })
        end, -- }}}
    }, -- }}}
}
-- vim:foldmethod=marker:
