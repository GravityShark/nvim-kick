local cmp = require('cmp')
local luasnip = require('luasnip')
require('luasnip.loaders.from_vscode').lazy_load()
luasnip.config.setup({})

cmp.setup({
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	mapping = cmp.mapping.preset.insert({
		['<C-d>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<C-y>'] = cmp.mapping.confirm({ select = true }), -- Turn on autocomplete on <C-y>
		['<C-Space>'] = cmp.mapping.complete({}),
		['<CR>'] = cmp.mapping({
			i = function(fallback)
				if cmp.visible() and cmp.get_active_entry() then
					cmp.confirm({
						behavior = cmp.ConfirmBehavior.Replace,
						select = false,
					})
				else
					fallback()
				end
			end,
			s = cmp.mapping.confirm({ select = true }),
			c = cmp.mapping.confirm({
				behavior = cmp.ConfirmBehavior.Replace,
				select = true,
			}),
		}),
	}),

	sources = {
		{ name = 'nvim_lsp' },
		{ name = 'luasnip' },
		{ name = 'path' },
		{ name = 'buffer' },
	},

	window = {
		completion = { -- rounded border; thin-style scrollbar
			border = 'rounded',
			scrollbar = '║',
		},
		documentation = { -- no border; native-style scrollbar
			border = 'rounded',
			scrollbar = '║',
			-- other options
		},
	},
}) -- }}}

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
