# main.md

Plugins that provide functionality that is bigger than extras

Usually this means really large features that main IDEs have, like LSP,
Treesitter highlights, linting, completion, testing suites, formatting

## _completion menus_

Completion menu for your dirty Intellisene™️

Only one is allowed to be enabled at the same time cause these do the same thing

### [_blink.cmp_](https://github.com/Saghen/blink.cmp)

The batteries included completion menu

### [cmp](github.com/hrsh7th/nvim-cmp)

The I guess also good completion menu

### [coq](https://github.com/ms-jpq/coq_nvim)

The fast as FUCK completion menu

## [_conform_](https://github.com/stevearc/conform.nvim)

Formatting of code

- Remember to setup **ensure.lua** for your formatters

## [dap](https://github.com/mfussenegger/nvim-dap) (not working)

Interface for debuging of code

## [_lint_](https://github.com/mfussenegger/nvim-lint)

Automatic linting of code

- Remember to setup **ensure.lua** for your linters

## [_lsp_](https://github.com/neovim/nvim-lspconfig)

easier setup for stuff using language servers

- Remember to setup **ensure.lua** for your language servers
- Recommended to use with a _completion menu_

## [_mason_](https://github.com/mason-org/mason.nvim)

- Allows installing of LSPs, Linters, and Formatters automatically and locally
  in neovim
- Doesn't work well with NixOS `:(`

## [neotest (incomplete)](https://github.com/nvim-neotest/neotest)

- Interface for interacting with tests in neovim

## [_snacks_](https://github.com/folke/snacks.nvim)

- A bunch of small little utilities that do great things to the world
- But since it is a lot of things and it fundamentally even changes how neovim
  loads files, it's a main plugin.
  1. bigfile - does not things like lsps for files that are big
  2. bufdelete - good ol' bdel but good
  3. image - adds 3rd/image.nvim but actually works‽
  4. indent - adds cool indent lines i think
  5. picker - better than telescope 8)
  6. quickfile - tries to load the file as fast as possible before anything else
  7. rename - when you are in something like oil.nvim (it's enabled for that
     btw) and you rename a file that another file needs (like its referincing
     that) it renames it in the referencing code too
  8. statuscolumn - making vim fatter than expected

## [telescope](https://github.com/nvim-telescope/telescope.nvim)

A fuzzy finder written entirely in lua allowing you to find files and other
stuff

## [_treesitter_](https://github.com/nvim-treesitter/nvim-treesitter)

Syntax highlighting mainly but also more motions and stuff based on treesitter
