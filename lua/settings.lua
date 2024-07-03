-- Opts {{{
-- Global statusline
vim.opt.laststatus = 3

-- Line numbers
vim.opt.nu = true
vim.opt.relativenumber = true

-- Undofile
vim.opt.undofile = true
vim.opt.swapfile = false

-- For orgmode
vim.opt.conceallevel = 2
vim.opt.concealcursor = 'nc'

-- Disable that weird effect where it changes the color of your cursor
-- vim.opt.matchtime = 0

-- Leaves 12 lines of extra space
vim.opt.scrolloff = 12

-- Enable break indent
vim.opt.breakindent = true

-- Set completeopt to have a better completion experience
vim.opt.completeopt = 'menuone,noinsert,noselect'
vim.opt.colorcolumn = '80'

vim.opt.splitbelow = true -- Put new windows below current
vim.opt.splitright = true -- Put new vertical splits to right
vim.opt.expandtab = true -- Use spaces by default
vim.opt.shiftwidth = 8 -- Set amount of space characters, when we press "<" or ">"
vim.opt.softtabstop = 8
vim.opt.tabstop = 8 -- 1 tab equal 8 spaces
vim.opt.smartindent = true -- Turn on smart indentation. See in the docs for more info

vim.opt.foldtext = ''
-- vim.opt.foldlevel = 99
-- vim.opt.foldlevelstart = 1
-- vim.opt.foldnestmax = 4
vim.opt.foldmethod = 'expr' -- Bad 👎
vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'

vim.opt.ignorecase = true -- Ignore case if all characters in lower case
vim.opt.smartcase = true -- When there is a one capital letter search for exact match
vim.opt.showmatch = true -- Highlight search instances

-- Disable showing --Insert-- or --Visual-- in the cmdline
vim.opt.showmode = false

-- Enable nerd font
vim.g.have_nerd_font = true

-- Undotree Layout
vim.g.undotree_WindowLayout = 3

-- Netrw
vim.g.netrw_bufsettings = 'noma nomod nowrap ro nobl rnu'
vim.g.netrw_banner = 0
vim.g.netrw_fastbrowse = 0
vim.g.netrw_keepdir = 0
-- vim.g.netrw_liststyle = 3
vim.g.netrw_localcopydircmd = 'cp -r'
vim.g.netrw_winsize = 25
vim.g.netrw_browse_split = 0
vim.g.netrw_hide = 1
-- mini.basics
-- vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.mouse = 'a'
vim.opt.cursorline = true
vim.opt.linebreak = true
vim.opt.ruler = false
vim.opt.wrap = false

vim.opt.signcolumn = 'yes'
vim.opt.fillchars = 'eob: '
-- Editing
-- vim.opt.incsearch = true -- already default
vim.opt.infercase = true
vim.opt.virtualedit = 'block'
vim.opt.formatoptions = 'qjl1'

vim.opt.termguicolors = true

vim.opt.pumheight = 15
vim.opt.pumblend = 10

-- }}}
-- LSP Diagnostics Signs {{{
for type, icon in pairs({
    Error = ' ',
    Warn = ' ',
    Hint = '󰌵 ',
    Info = '󰋼 ',
}) do
    local hl = 'DiagnosticSign' .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
-- }}}
-- vim:foldmethod=marker:
