#+title: Main

# Main plugins
Plugins that provide functionality that is bigger than extras

## *completion menus*
completion menu for your dirty intellisense
- the two are _mutually exclusive_
### blink
  the batteries included completion menu
### *cmp*
  the i guess also good completion menu
### coq
  the fast as FUCK completion menu

## *conform*
Formatting of code
- remember to setup ~ensure.lua~ for your formatters

## dap (incomplete)
Interface for debuging of code

## *lint*
Automatic linting of code
- remember to setup ~ensure.lua~ for your linters

## *lsp*
easier setup for stuff using language servers
- remember to setup ~ensure.lua~ for your language servers
- recommended to use with a *completion menu*

## *mason*
- Allows installing of LSPs, Linters, and Formatters automatically and locally in neovim
- Doesn't work well with NixOS `:(`

## neotest (incomplete)
- Interface for interacting with tests in neovim

## *telescope*
a fuzzy finder written entirely in lua allowing you to find files and other stuff

## *treesitter*
syntax highlighting mainly but also more motions and stuff
