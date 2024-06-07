return {
    -- Autocompletion
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
        -- Adds paths to sources
        'hrsh7th/cmp-path',

        -- Adds LSP completion capabilities
        'hrsh7th/cmp-nvim-lsp',

        -- Adds the built-in vim auto-complete
        'hrsh7th/cmp-buffer',

        -- Snippet Engine & its associated nvim-cmp source{{{
        {
            'L3MON4D3/LuaSnip',
            init = function()
                vim.keymap.set({ 'i' }, '<C-K>', function()
                    require('luasnip').expand()
                end, { silent = true })
                vim.keymap.set({ 'i', 's' }, '<C-L>', function()
                    require('luasnip').jump(1)
                end, { silent = true })
                vim.keymap.set({ 'i', 's' }, '<C-J>', function()
                    require('luasnip').jump(-1)
                end, { silent = true })

                vim.keymap.set({ 'i', 's' }, '<C-E>', function()
                    if require('luasnip').choice_active() then
                        require('luasnip').change_choice(1)
                    end
                end, { silent = true })
            end,
            version = 'v2.*', -- Replace <CurrentMajor> by the latest released major (first number of latest release)
            build = 'make install_jsregexp',
            dependencies = {
                {
                    'rafamadriz/friendly-snippets',
                    config = function()
                        require('luasnip.loaders.from_vscode').lazy_load()
                    end,
                },
            },
        },
        'saadparwaiz1/cmp_luasnip', -- }}}
    },
    config = function() -- {{{
        local cmp = require('cmp')
        local luasnip = require('luasnip')
        luasnip.config.setup({})

        local kind_icons = {
            Text = '',
            Method = '󰆧',
            Function = '󰊕',
            Constructor = '',
            Field = '󰇽',
            Variable = '󰂡',
            Class = '󰠱',
            Interface = '',
            Module = '',
            Property = '󰜢',
            Unit = '',
            Value = '󰎠',
            Enum = '',
            Keyword = '󰌋',
            Snippet = '',
            Color = '󰏘',
            File = '󰈙',
            Reference = '',
            Folder = '󰉋',
            EnumMember = '',
            Constant = '󰏿',
            Struct = '',
            Event = '',
            Operator = '󰆕',
            TypeParameter = '󰅲',
        }

        ---@diagnostic disable-next-line: missing-fields
        cmp.setup({
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
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
                { name = 'path' },
                { name = 'buffer' },
                -- Org mode
                { name = 'orgmode' },
            },

            ---@diagnostic disable-next-line: missing-fields
            formatting = {
                fields = { 'kind', 'abbr', 'menu' },
                format = function(entry, vim_item)
                    -- Kind icons
                    local sources = ({
                        buffer = '[Buffer]',
                        nvim_lsp = '[LSP]',
                        luasnip = '[LuaSnip]',
                        nvim_lua = '[Lua]',
                        path = '[Path]',
                        orgmode = '[Org]',
                    })[entry.source.name]
                    vim_item.menu = '(' .. vim_item.kind .. ') ' .. sources
                    vim_item.kind = kind_icons[vim_item.kind] .. ' '
                    -- 	string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind)

                    -- This concatonates the icons with the name of the item kind

                    -- vim_item.kind = (kind_icons[vim_item.kind] or '') .. vim_item.kind
                    -- Source
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
