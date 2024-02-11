local cmp = require('cmp')
local luasnip = require('luasnip')
require('luasnip.loaders.from_vscode').lazy_load()
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
        ['<C-y>'] = cmp.mapping.confirm({ select = true }), -- Turn on autocomplete on <C-y>
        ['<C-Space>'] = cmp.mapping.complete({}),
        -- ['<CR>'] = cmp.mapping({
        --     i = function(fallback)
        --         if cmp.visible() and cmp.get_active_entry() then
        --             cmp.confirm({
        --                 behavior = cmp.ConfirmBehavior.Replace,
        --                 select = false,
        --             })
        --         else
        --             fallback()
        --         end
        --     end,
        --     s = cmp.mapping.confirm({ select = true }),
        --     c = cmp.mapping.confirm({
        --         behavior = cmp.ConfirmBehavior.Replace,
        --         select = true,
        --     }),
        -- }),
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
-- }}}
