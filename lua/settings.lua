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

-- Enable break indent
vim.o.breakindent = true

-- Keep signcolumn on by default
vim.wo.signcolumn = 'yes'

-- Decrease update time
vim.o.updatetime = 250
vim.o.timeoutlen = 300

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- LSP Diagnostics {{{
local signs = { Error = ' ', Warn = ' ', Hint = '󰌶 ', Info = ' ' }
for type, icon in pairs(signs) do
	local hl = 'DiagnosticSign' .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
-- }}}

-- Self {{{
vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.undofile = true

vim.opt.wrap = false

vim.opt.conceallevel = 2
vim.opt.matchtime = 0

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.updatetime = 50
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

-- Wild Menu {{{
vim.opt.wildmenu = true
vim.opt.wildmode = 'longest:full,full'
-- }}}

-- Default Plugins {{{
local disabled_built_ins = {
	-- "netrw",
	-- "netrwPlugin",
	-- "netrwSettings",
	'netrwFileHandlers',
	'gzip',
	'zip',
	'zipPlugin',
	'tar',
	'tarPlugin',
	'getscript',
	'getscriptPlugin',
	'vimball',
	'vimballPlugin',
	'2html_plugin',
	'logipat',
	'rrhelper',
	'spellfile_plugin',
	'matchit',
}

for _, plugin in pairs(disabled_built_ins) do
	vim.g['loaded_' .. plugin] = 1
end
