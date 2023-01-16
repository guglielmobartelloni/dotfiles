# Tools I use

- Session manager: tmux
- Text editor: neovim <3
- Shortcut manager: skhd
- Shell: zsh
- File browser: ranger
- Music player: ncmpcpp
- Terminal emulator: alacritty
- RSS Reader: newsboat
- Dotfile manager: stow
- OS: Mac OS


## Dependencies

- tmux tpm
- a brain to put together the config

## Sync the config

Make the sym links with gnu stow:

`stow --target=${HOME} *`

that's it.

## Neovim setup

I use the lua config and `packer` package manager. First time you open the editor you have to install all the dependencies, to do so, open the `packer.lua` file and use the command `:source %` after run `PackerInstall`.

The config has many features that I collected over the years.
The main reason I use neovim is for `Telescope` which lets you fuzzy find anything.
The other reason is `lsp` and `mason` that can install extensions very easly crossplatform like `vscode`.

Another huge selling point is the ability to create super powerful snippets with `Luasnip` which enabled me to take math notes in real time with latex (see [latex notes](https://github.com/guglielmobartelloni/appunti-analisi-2))
