-- README {{{
--[[

=====================================================================
==================== READ THIS BEFORE CONTINUING ====================
=====================================================================

Kickstart.nvim is *not* a distribution.

Kickstart.nvim is a template for your own configuration.
  The goal is that you can read every line of code, top-to-bottom, understand
  what your configuration is doing, and modify it to suit your needs.

  Once you've done that, you should start exploring, configuring and tinkering to
  explore Neovim!

  If you don't know anything about Lua, I recommend taking some time to read through
  a guide. One possible example:
  - https://learnxinyminutes.com/docs/lua/


  And then you can explore or search through `:help lua-guide`
  - https://neovim.io/doc/user/lua-guide.html


Kickstart Guide:

I have left several `:help X` comments throughout the init.lua
You should run that command and read that help section for more information.

In addition, I have some `NOTE:` items throughout the file.
These are for you, the reader to help understand what is happening. Feel free to delete
them once you know what you're doing, but they should serve as a guide for when you
are first encountering a few different constructs in your nvim config.

I hope you enjoy your Neovim journey,
- TJ

P.S. You can delete this when you're done too. It's your config now :)
--]]
--}}}

-- Leader Key {{{
-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
-- }}}

-- Default Plugins {{{
-- All neovim default plugins
vim.g.editorconfig = false
local disabled_built_ins = {
	-- 'editorconfig', -- has a different way of disabling
	'gzip', -- Allows editing files that have been gzipped
	'man', -- :Man, allows using vim as a man page reader
	--    'matchit', -- Gives extra options for '%' command
	-- 'matchparen', -- Shows/highlights the matching parenthesis and others
	-- 'netrwPlugin', -- Enables Netrw
	'remote_plugins', -- i also idk
	'shada_plugin', -- IDK how to use shada
	'spellfile_plugin', -- something about spell checking idk
	'tarPlugin', --
	'2html_plugin', -- :TOhtml, turns your current file to a formatted html
	'tutor_mode_plugin', -- :Tutor
	'zipPlugin_ext', -- Allows you to edit Zip files from vim
}

for _, plugin in pairs(disabled_built_ins) do
	vim.g['loaded_' .. plugin] = 1
end
-- }}}

-- Initialize lazy.nvim {{{
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		'git',
		'clone',
		'--filter=blob:none',
		'https://github.com/folke/lazy.nvim.git',
		'--branch=stable', -- latest stable release
		lazypath,
	})
end

-- vim.opt.runtimepath:remove('~/.vim')

vim.opt.rtp:prepend(lazypath)

require('lazy').setup(require('plugins'), { defaults = { lazy = true } }) -- }}}

-- [[ Setting options ]]
require('settings')

-- [[ Basic Keymaps ]]
require('keymaps')

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=4 sts=4 sw=4 et
