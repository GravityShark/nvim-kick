-- Enable transparency
require('colorscheme.transparent')
-- If no transparency is enabled enable winblend instead
-- vim.opt.pumblend = 10
-- vim.opt.winblend = 10

-- Opts {{{
-- What data is saved when saving a session
-- vim.opt.sessionoptions = 'buffers,curdir,folds,tabpages,winsize,winpos' -- Not used

-- Allow switching buffers without saving them
vim.opt.hidden = true

-- Global statusline
vim.opt.laststatus = 3

-- Line numbers
vim.opt.nu = true
vim.opt.relativenumber = true

-- Undofile
vim.opt.undofile = true

-- For orgmode
vim.opt.conceallevel = 2
vim.opt.concealcursor = 'nc'

-- Disable that weird effect where it changes the color of your cursor
vim.opt.matchtime = 0

-- Leaves 8 lines of extra space
vim.opt.scrolloff = 8

-- Decrease update time
vim.opt.updatetime = 250 -- 50
vim.opt.timeoutlen = 0
vim.opt.timeout = true -- whichkey

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
vim.opt.tabstop = 8 -- 1 tab equal 2 spaces
vim.opt.smartindent = true -- Turn on smart indentation. See in the docs for more info

vim.opt.foldmethod = 'marker' -- Good
-- vim.opt.foldmethod = 'syntax' -- Bad >:1
-- vim.opt.foldenable = true

vim.opt.ignorecase = true -- Ignore case if all characters in lower case
vim.opt.joinspaces = false -- Join multiple spaces in search
vim.opt.smartcase = true -- When there is a one capital letter search for exact match
vim.opt.showmatch = true -- Highlight search instances

-- Disable showing --Insert-- or --Visual-- in the cmdline
vim.opt.showmode = false

-- Wild menu
-- vim.opt.wildmenu = true -- already default
-- Set wildcharm to trigger the wildmenu
-- vim.opt.wildcharm = string.byte('<Tab>')

-- Enable nerd font
vim.g.have_nerd_font = true

-- Undotree Layout
vim.g.undotree_WindowLayout = 3

-- Netrw
vim.g.netrw_bufsettings = 'noma nomod nowrap ro nobl rnu'
vim.g.netrw_banner = 0
vim.g.netrw_fastbrowse = 0
vim.g.netrw_keepdir = 0
vim.g.netrw_liststyle = 3
vim.g.netrw_localcopydircmd = 'cp -r'
vim.g.netrw_winsize = 20
-- vim.g.netrw_browse_split = 4

-- mini.basics
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.mouse = 'a'
vim.opt.cursorline = true
vim.opt.linebreak = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.ruler = false
vim.opt.wrap = false

vim.opt.signcolumn = 'yes'
vim.opt.fillchars = 'eob: '

-- Editing
-- vim.opt.incsearch = true -- already default
-- vim.opt.infercase = true -- already default
vim.opt.virtualedit = 'block'
vim.opt.formatoptions = 'qjl1'

vim.opt.termguicolors = true

vim.opt.pumheight = 10

-- }}}
-- Terminal Helpers{{{
-- Disable line numbers when opening a Terminal
vim.api.nvim_create_autocmd('TermOpen', {
    callback = function()
        vim.opt_local.relativenumber = false
        vim.opt_local.number = false
    end,
})
-- Automatically opening as insert mode when the buffer is a terminal
vim.api.nvim_create_autocmd('BufEnter', {
    callback = function()
        if vim.api.nvim_get_option_value('buftype', {}) == 'terminal' then
            vim.cmd.startinsert()
        end
    end,
}) -- }}}
-- When in allow for these applications when opening a respective file type{{{
vim.api.nvim_create_autocmd('BufEnter', {
    pattern = '*.pdf',
    command = ':silent !librewolf % &',
})

vim.api.nvim_create_autocmd('BufEnter', {
    pattern = { '*.docx', '*.pptx' },
    command = ':silent !flatpak run org.libreoffice.LibreOffice % &',
})

vim.api.nvim_create_autocmd('BufEnter', {
    pattern = { '*.png', '*.jpg', '*.webp', '*.svg' },
    command = ':silent !feh % &',
})
vim.api.nvim_create_autocmd('BufEnter', {
    pattern = {
        '*.pdf',
        '*.docx',
        '*.pptx',
        '*.png',
        '*.jpg',
        '*.webp',
        '*.svg',
    },
    callback = function()
        require('mini.bufremove').delete()
        CheckTabline()
    end,
}) -- }}}
-- Automatic disabling/renabling bufferline at 1 > Buffers ; 1 < Buffers {{{
function CheckTabline()
    -- Get the count of active buffers
    local buffers = vim.fn.len(vim.fn.getbufinfo({ buflisted = 1 }))

    if buffers == 1 then
        vim.opt.showtabline = 0
    elseif buffers > 1 then
        vim.opt.showtabline = 2
    end
end

vim.api.nvim_create_autocmd({
    'BufAdd',
    'BufDelete',
    'UIEnter',
}, { callback = CheckTabline })

-- function ToggleBar()
--     if vim.opt.showtabline == 0 then
--         vim.opt.showtabline = 2
--         TABLINE_AUTOCMD_ID = vim.api.nvim_create_autocmd({
--             'BufAdd',
--             'BufDelete',
--             'UIEnter',
--         }, { callback = CheckTabline })
--     else
--         if vim.opt.showtabline == 2 then
--             vim.opt.showtabline = 0
--             vim.api.nvim_del_autocmd(TABLINE_AUTOCMD_ID)
--         end
--     end
-- end
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
-- Automatically deleting unnamed buffers
-- https://vi.stackexchange.com/questions/44617/bufferline-in-nvim-auto-close-or-hide-no-name-buffer-when-other-buffers-are-o
-- Function to close empty and unnamed buffers
function Close_empty_unnamed_buffers()
    -- Get a list of all buffers
    local buffers = vim.api.nvim_list_bufs()

    -- Iterate over each buffer
    for _, bufnr in ipairs(buffers) do
        -- Check if the buffer is empty and doesn't have a name
        if
            vim.api.nvim_buf_is_loaded(bufnr)
            and vim.api.nvim_buf_get_name(bufnr) == ''
            and vim.api.nvim_get_option_value('buftype', {}) == ''
        then
            -- Get all lines in the buffer
            local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)

            -- Initialize a variable to store the total number of characters
            local total_characters = 0

            -- Iterate over each line and calculate the number of characters
            for _, line in ipairs(lines) do
                total_characters = total_characters + #line
            end

            -- Close the buffer if it's empty:
            if total_characters == 0 then
                vim.api.nvim_buf_delete(bufnr, {
                    force = true,
                })
            end
        end
    end
end

-- Clear the mandatory, empty, unnamed buffer when a real file is opened:
vim.api.nvim_command('autocmd BufReadPost * lua Close_empty_unnamed_buffers()')
-- vim:foldmethod=marker:
