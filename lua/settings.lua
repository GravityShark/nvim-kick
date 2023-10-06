-- See `:help vim.o`
-- NOTE: You can change these options as you wish!
-- [[ Highlight on yank ]]{{{
-- See `:help vim.highlight.on_yank()`
-- local highlight_group =
-- 	vim.api.nvim_create_augroup('YankHighlight', { clear = true })
-- vim.api.nvim_create_autocmd('TextYankPost', {
-- 	callback = function()
-- 		vim.highlight.on_yank()
-- 	end,
-- 	group = highlight_group,
-- 	pattern = '*',
-- })}}}

-- LSP Diagnostics {{{
local signs = { Error = ' ', Warn = ' ', Hint = '󰌶 ', Info = ' ' }
for type, icon in pairs(signs) do
	local hl = 'DiagnosticSign' .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
-- }}}

-- Other {{{
vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.undofile = true

-- vim.opt.wrap = true

vim.opt.conceallevel = 2
vim.opt.matchtime = 0

vim.opt.scrolloff = 8

-- Decrease update time
vim.o.updatetime = 250 -- 50
vim.o.timeoutlen = 300

-- Enable break indent
vim.o.breakindent = true

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'
vim.opt.colorcolumn = '80'
-- }}}

-- Tabs {{{
vim.opt.expandtab = true -- Use spaces by default
vim.opt.shiftwidth = 4 -- Set amount of space characters, when we press "<" or ">"
vim.opt.softtabstop = 4
vim.opt.tabstop = 4 -- 1 tab equal 2 spaces
vim.opt.smartindent = true -- Turn on smart indentation. See in the docs for more info
-- }}}

-- Folding {{{
vim.opt.foldmethod = 'marker'
-- }}}

-- Search {{{
vim.opt.ignorecase = true -- Ignore case if all characters in lower case
vim.opt.joinspaces = false -- Join multiple spaces in search
vim.opt.smartcase = true -- When there is a one capital letter search for exact match
vim.opt.showmatch = true -- Highlight search instances
-- }}}

-- Window {{{
vim.opt.splitbelow = true -- Put new windows below current
vim.opt.splitright = true -- Put new vertical splits to right
-- }}}

-- [[ Wild Menu ]] {{{
-- already is the defalut in neovim
-- vim.o.wildmenu = true

-- Set wildcharm to trigger the wildmenu
-- vim.o.wildcharm = string.byte('<Tab>')
-- }}}

-- Undotree Layout {{{
vim.g.undotree_WindowLayout = 3
-- }}}

-- function ToggleTabline() -- {{{
-- 	-- Get the count of active buffers
-- 	local buffers = vim.fn.getbufinfo({ listed = true })
--
-- 	if #buffers == 1 then
-- 		vim.o.showtabline = 0
-- 	else
-- 		vim.o.showtabline = 2
-- 	end
-- 	print(#buffers)
-- end
--
-- vim.cmd([[
-- augroup TablineToggle
--     autocmd!
--     autocmd BufAdd, BufDelete * lua ToggleTabline()
-- augroup END
-- ]])
vim.o.showtabline = 2
-- }}}

-- Transparency Highlight Groups {{{
vim.g.transparent_groups = vim.list_extend(vim.g.transparent_groups or {}, {
	-- "NormalFloat",
	'Pmenu',
	'TelescopeNormal',
	-- 'Title',
})
-- }}}

-- Set relative line numbers to Netrw {{{
vim.cmd([[
  autocmd FileType netrw set relativenumber
]])
-- }}}
