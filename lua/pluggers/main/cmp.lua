return {
    -- Autocompletion
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
        -- Adds paths to sources
        'https://codeberg.org/FelipeLema/cmp-async-path',

        -- Adds LSP completion capabilities
        'hrsh7th/cmp-nvim-lsp',

        -- Adds the built-in vim auto-complete
        'hrsh7th/cmp-buffer',

        -- Adds snippets via luasnips

        'saadparwaiz1/cmp_luasnip',
        {
            'L3MON4D3/LuaSnip',
            build = 'make install_jsregexp',
            dependencies = 'rafamadriz/friendly-snippets',
            config = function()
                local luasnip = require('luasnip')
                require('luasnip.loaders.from_vscode').lazy_load()

                luasnip.config.setup({
                    keep_roots = true,
                    link_roots = true,
                    link_children = true,
                    exit_roots = false,
                    update_events = { 'TextChanged', 'TextChangedI' },
                })
                vim.keymap.set({ 'i', 's' }, '<C-j>', function()
                    if luasnip.expand_or_jumpable() then
                        luasnip.expand_or_jump()
                    end
                end, { silent = true })
                vim.keymap.set({ 'i', 's' }, '<C-k>', function()
                    if luasnip.jumpable(-1) then
                        luasnip.jump(-1)
                    end
                end, { silent = true })
                vim.keymap.set({ 'i', 's' }, '<C-l>', function()
                    if luasnip.choice_active() then
                        luasnip.change_choice(1)
                    end
                end, { silent = true })
            end,
        },
        -- }}}
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
            snippet = {
                expand = function(args)
                    require('luasnip').lsp_expand(args.body)
                end,
            },

            behavior = cmp.SelectBehavior.Select,
            mapping = cmp.mapping.preset.insert({
                ['<C-d>'] = cmp.mapping.scroll_docs(-4),
                ['<C-f>'] = cmp.mapping.scroll_docs(4),
                ['<C-y>'] = cmp.mapping.confirm({ select = true }),
                ['<C-Space>'] = cmp.mapping.complete({}),
            }),

            sources = {
                { name = 'nvim_lsp' },
                { name = 'luasnip' },
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
                        luasnip = 'Snp',
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

            completion = {
                completeopt = 'menu,menuone,noinsert',
            },
            window = {
                completion = {
                    completeopt = 'menu,menuone,noinsert',
                    border = 'rounded',
                    scrollbar = true,
                    winhighlight = 'FloatBorder:SpecialChar',
                },
                documentation = {
                    winhighlight = 'FloatBorder:SpecialChar',
                    border = 'rounded',
                    scrollbar = true,
                },
            },
        })
    end, -- }}}
}
