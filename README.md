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

