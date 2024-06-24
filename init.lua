-- Setsup lazy.nvim{{{
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Initialize lazy.nvim
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system({
        'git',
        'clone',
        '--filter=blob:none',
        'https://github.com/folke/lazy.nvim.git',
        '--branch=stable', -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

-- Setup plugins
require('lazy').setup({
    spec = {
        { import = 'pluggers' },
    },
    defaults = { lazy = true, version = false },
    change_detection = { notify = false },

    performance = {
        rtp = {
            disabled_plugins = {
                'editorconfig',
                'gzip',
                'rplugin',
                'fzf',
                'spellfile',
                'tarPlugin',
                'tohtml',
                'tutor',
                'zipPlugin',
                'osc52',
                -- 'man',
                -- "matchit",
                -- "matchparen",
                -- 'netrwPlugin',
                -- "shada",
            },
        },
    },
}) -- }}}
-- Sets the settings and keymaps
require('settings')
require('keymaps')
require('autocmd')

-- vim:foldmethod=marker:
