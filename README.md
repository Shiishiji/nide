# NIDE 

The `all you need` strongly opinionated IDE config for neovim.

## Installation

Download this repo content into `~/.config/nide`.
```sh
cd ~/.config && git clone https://github.com/Shiishiji/nide
```

Then run neovim and override it's name to `nide`.
```sh 
NVIM_APPNAME=nide nvim
```

Alias it if you want!

## LSP Installation

LSP must be installed manually. Only install the ones you want.

- Python: [pylsp](https://github.com/python-lsp/python-lsp-server#installation)
- PHP: [phpactor](https://github.com/phpactor/phpactor#installation)
- GO: [gopls](https://go.dev/gopls/#installation)
- Lua: [LuaLS](https://luals.github.io/#neovim-install)

