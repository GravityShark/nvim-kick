# nvim-kick

## my own neovim config from kickstart

> its pratically done ngl
> its ACTUALLY practically done now

### plugins to look into

- [ ] nvim-dap
  - [x] C, C++
  - [ ] go
  - [ ] python
  - [ ] bash?
  - [ ] javascript
- [ ] nvim-treesitter-textobjects
- [ ] when i ever need it nvim-ts-context-commentstring
- [ ] [neotest](https://github.com/nvim-neotest/neotest) (very interesting)

#### mini.nvim

- [ ] mini.base16 -- coolors
- [ ] mini.colors or lush.nvim
- [ ] mini.hues
- [ ] mini.bracketed -- better bracket movement
- [x] mini.cursorword -- lighter vim-illuminate
- [ ] mini.files -- like a netrw
- [ ] mini.jump2d -- adds labels, kinda like how qutebrowser does it
- [ ] mini.move -- like that one ThePrimeagen keybinding with autoindenting selection
- [ ] mini.sessions -- persistence.nvim
- [ ] mini.starter or alpha-nvim -starting tihg
- [ ] mini.splitjoin -- cool way of like splitting lines like
  > but basically anything from [lazyvim](https://www.lazyvim.org/plugins/) or [lunarvim](https://www.lunarvim.org/docs/configuration/plugins/example-configurations)

### TODO

- [ ] instead of harpoon have a function tha like lists the buffers in order and allows me to like do <a-1> to <a-9> and select that buffer in my tabline
- [ ] try to use mini.[colors/base16/hues]
- [ ] and have it use telescope as a selector of themes like nvchad
- [ ] setup treesitter keybindings and such
  - [ ] nvim-treesitter/nvim-treesitter-context

### also remember [neovide](https://neovide.dev/)

### Shitty idea

> what if i make a neovim distro purely made to be mouse and input mode only
> sounds stupid but there is a lack of extremely lightweight (i. e. cli/tui) text editors out there that have good functionality
> and its made for people who wont even learn vim motions but be able to use its amazing ecosystem - im gonna name it devil.nvim or like good.nvim - or like neo as in taking the vim out of neovim

#### install

- on Linux and Mac

```bash
git clone https://github.com/GravityShark0/nvim-kick.git "${XDG_CONFIG_HOME:-$HOME/.config}"/nvim
```

- on Windows

```bash
git clone https://github.com/GravityShark0/nvim-kick.git %userprofile%\AppData\Local\nvim\
```

then run nvim

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

```

```
