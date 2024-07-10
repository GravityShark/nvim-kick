# nvim-kick

> use neovim 0.10
> cause fuck yeah only latest baby

## my own neovim config from kickstart

### plugins to look into

- [ ] [Neogen](https://github.com/danymat/neogen) (kinda interesting)
- [ ] [Neotest](https://github.com/nvim-neotest/neotest) (very interesting)
- [ ] [submode.nvim](https://github.com/pogyomo/submode.nvim) (very very interesting)
- [ ] [Neoconf](https://github.com/folke/neoconf.nvim)
- Colorscheming
  - [ ] [mini.base16](https://github.com/echasnovski/mini.base16) -- coolors
  - [ ] [mini.colors](https://github.com/echasnovski/mini.colors) or[lush](https://github.com/rktjmp/lush.nvim)
  - [ ] [mini.hues](https://github.com/echasnovski/mini.hues)

### Shitty idea

> what if i make a neovim distro purely made to be mouse and input mode only
> sounds stupid but there is a lack of extremely lightweight (i. e. cli/tui) text editors out there that have good functionality
> and its made for people who wont even learn vim motions but be able to use its amazing ecosystem - im gonna name it devil.nvim or like good.nvim - or like neo as in taking the vim out of neovim
> kinda like a modern [evim](https://linux.die.net/man/1/evim)

### install
> you might wanna do the uninstall instruction first so no conflicts arise

- on Linux and Mac

```bash
git clone https://github.com/GravityShark0/nvim-kick.git ~/.config/nvim
# then run the relink command with your preferred plugins
cd ~/.config/nvim
./relink.out
```
> then you go ahead change the lua/ensure.lua to set what kind of 
> lsp, treesitter, formatters, and linters you wanna have

then run `nvim` or wheatever neovim client you use
> like [neovide](https://neovide.dev/)

#### uninstall

- Linux / Macos (unix)

```bash
# will completely remove anything in neovim
rm -rf ~/.config/nvim
rm -rf ~/.local/share/nvim
rm -rf ~/.local/state/nvim
rm -rf ~/.cache/nvim
```

- thanks [kickstart.nvim]
