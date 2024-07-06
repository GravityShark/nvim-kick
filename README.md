# nvim-kick

> use neovim 0.10
> cause fuck yeah only latest baby

## my own neovim config from kickstart

> its pratically done ngl
> its ACTUALLY practically done now
> its pratical and weird but its FAST BABY
> I know using symlinks may be a weird way of adding and not adding plugins
> but i promise its fire

### plugins to look into

- [ ] nvim-dap
  - [x] C, C++
  - [ ] go
  - [ ] python
  - [ ] bash?
  - [ ] javascript
- [x] [nvim-treesitter-textobjects](https://github.com/nvim-treesitter/nvim-treesitter-textobjects)
- [ ] [nvim-ts-context-commentstring](https://github.com/JoosepAlviste/nvim-ts-context-commentstring)
- [ ] [Neotest](https://github.com/nvim-neotest/neotest) (very interesting)
- [ ] [Neogen](https://github.com/danymat/neogen) (kinda interesting)
- [ ] [Neoconf](https://github.com/folke/neoconf.nvim)
- [x] [Codeium](https://github.com/Exafunction/codeium.nvim)
  - I don't like to fuck around with AI
- [x] [Trouble V3](https://github.com/folke/trouble.nvim)
- [x] [Todo Comments](https://github.com/folke/todo-comments.nvim)
  > but basically anything from [lazyvim](https://www.lazyvim.org/plugins/) or [lunarvim](https://www.lunarvim.org/docs/configuration/plugins/example-configurations)

#### mini.nvim

- [ ] mini.base16 -- coolors
- [ ] mini.bracketed -- better bracket movement
- [ ] mini.colors or[lush](https://github.com/rktjmp/lush.nvim)
- [x] mini.cursorword -- lighter vim-illuminate
- [ ] [mini.diff](https://github.com/echasnovski/mini.diff) Replace git signs
- [ ] mini.hues
- [ ] mini.jump2d -- adds labels, kinda like how qutebrowser does it
- [ ] mini.move -- like that one ThePrimeagen keybinding with autoindenting selection
- [ ] mini.splitjoin -- cool way of like splitting lines like

### TODO

- [ ] Setup run commands to be integreated with :term
- [x] instead of harpoon have a function tha like lists the buffers in order and allows me to like do <a-1> to <a-9> and select that buffer in my tabline
- [ ] try to use mini.[colors/base16/hues] or (lush)[https://github.com/rktjmp/lush.nvim]
  - [ ] and have it use telescope as a selector of themes like nvchad
- [ ] setup treesitter keybindings and such
  - [ ] nvim-treesitter/nvim-treesitter-context
- [ ] Maybe new status bar and bufferline, but i kinda like mine right now, maybe later

### also remember [neovide](https://neovide.dev/)

### Shitty idea

> what if i make a neovim distro purely made to be mouse and input mode only
> sounds stupid but there is a lack of extremely lightweight (i. e. cli/tui) text editors out there that have good functionality
> and its made for people who wont even learn vim motions but be able to use its amazing ecosystem - im gonna name it devil.nvim or like good.nvim - or like neo as in taking the vim out of neovim

#### install

- on Linux and Mac

```bash
git clone https://github.com/GravityShark0/nvim-kick.git ~/.config/nvim
```

- on Windows or i think it would work cause i havent tried

```bash
git clone https://github.com/GravityShark0/nvim-kick.git %userprofile%\AppData\Local\nvim\
```

then run `nvim`

#### uninstall

- Linux / Macos (unix)

```bash
rm -rf ~/.config/nvim
rm -rf ~/.local/share/nvim
```

- Windows

```bash
rd -r ~\AppData\Local\nvim
rd -r ~\AppData\Local\nvim-data
```

- thanks [kickstart.nvim]
