-- See `:help vim.o`

-- Opts {{{
-- Global statusline
vim.opt.laststatus = 3

-- Line numbers
vim.opt.nu = true
vim.opt.relativenumber = true

-- Undofile
vim.opt.undofile = true

-- For orgmode
vim.opt.conceallevel = 2

-- Disable that weird effect where it changes the color of your cursor
vim.opt.matchtime = 0

-- Leaves 8 lines of extra space
vim.opt.scrolloff = 8

-- Decrease update time
vim.o.updatetime = 250 -- 50
vim.o.timeoutlen = 300

-- Enable break indent
vim.o.breakindent = true

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'
vim.opt.colorcolumn = '80'

vim.opt.splitbelow = true -- Put new windows below current
vim.opt.splitright = true -- Put new vertical splits to right

vim.opt.expandtab = true -- Use spaces by default
vim.opt.shiftwidth = 8 -- Set amount of space characters, when we press "<" or ">"

vim.opt.softtabstop = 8
vim.opt.tabstop = 8 -- 1 tab equal 2 spaces
vim.opt.smartindent = true -- Turn on smart indentation. See in the docs for more info

vim.opt.foldmethod = 'marker' -- Good

vim.opt.ignorecase = true -- Ignore case if all characters in lower case
vim.opt.joinspaces = false -- Join multiple spaces in search
vim.opt.smartcase = true -- When there is a one capital letter search for exact match
vim.opt.showmatch = true -- Highlight search instances

-- Undotree Layout
vim.g.undotree_WindowLayout = 3

-- Disable showing --Insert-- or --Visual-- in the cmdline
vim.opt.showmode = false

-- [[ Wild Menu ]]
-- already is the defalut in neovim
-- vim.o.wildmenu = true

-- Set wildcharm to trigger the wildmenu
-- vim.o.wildcharm = string.byte('<Tab>')
-- }}}

-- [[ Highlight on yank ]]{{{
-- See `:help vim.highlight.on_yank()`
local highlight_group =
    vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
    callback = function()
        vim.highlight.on_yank()
    end,
    group = highlight_group,
    pattern = '*',
})
--}}}

-- LSP Diagnostics Signs {{{
local signs = { Error = ' ', Warn = ' ', Hint = '󰌶 ', Info = ' ' }
for type, icon in pairs(signs) do
    local hl = 'DiagnosticSign' .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
-- }}}

-- Automatic disabling/renabling bufferline at 1 > Buffers ; 1 < Buffers {{{
-- function ToggleTabline()
--     -- Get the count of active buffers
--     local buffers = vim.fn.len(vim.fn.getbufinfo({ buflisted = 1 }))
--
--     if buffers == 1 then
--         vim.o.showtabline = 0
--     elseif buffers > 1 then
--         require('mini.tabline').setup()
--         vim.o.showtabline = 2
--     end
-- end
--
-- TABLINE_AUTOCMD_ID = vim.api.nvim_create_autocmd({
--     'BufAdd',
--     'BufDelete',
--     'UIEnter',
-- }, { command = 'lua ToggleTabline()' })
--
-- function ToggleBar()
--     if vim.o.showtabline == 0 then
--         vim.o.showtabline = 2
--         TABLINE_AUTOCMD_ID = vim.api.nvim_create_autocmd({
--             'BufAdd',
--             'BufDelete',
--             'UIEnter',
--         }, { command = 'lua ToggleTabline()' })
--     else
--         if vim.o.showtabline == 2 then
--             vim.o.showtabline = 0
--             vim.api.nvim_del_autocmd(TABLINE_AUTOCMD_ID)
--         end
--     end
-- end

-- }}}

-- If using neovide {{{
-- if vim.g.neovide then
--     -- vim.o.guifont = ""
--     vim.g.neovide_transparency = 0
-- end -- }}}
