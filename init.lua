vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Initialize lazy.nvim {{{
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

-- It's at lua/plugins.lua
require('lazy').setup({ import = 'plugins' }, {
    -- Defaults to lazy load and use latest version
    defaults = { lazy = true, version = false },
    -- install = { colorscheme = { 'tokyonight', 'habamax' } },
    ui = {
        border = 'rounded',
    },

    performance = {
        rtp = {
            -- There is a built in rtp disable in lazy
            disabled_plugins = {
                'editorconfig',
                'gzip',
                -- "matchit",
                -- "matchparen",
                -- "netrwPlugin",
                'rplugin',
                'fzf',
                'man',
                'spellfile',
                'tarPlugin',
                'tohtml',
                'tutor',
                'zipPlugin',
            },
        },
    },
})
-- }}}

-- Sets the settings and keymaps
require('settings')
require('keymaps')

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=4 sts=4 sw=4 et
