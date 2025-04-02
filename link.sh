#!/bin/bash

# Get the current working directory
PWD=$(pwd)

# Define an array of target paths and their corresponding source paths
targets=(
    "$HOME/.config/nvim:$PWD/nvim"
    "$HOME/.config/kitty:$PWD/kitty"
    "$HOME/.tmux.conf:$PWD/.tmux.conf"
    "$HOME/.zsh_plugins.txt:$PWD/.zsh_plugins.txt"
    "$HOME/.zshrc:$PWD/.zshrc"
    "$HOME/.config/sesh:$PWD/sesh"
)

# Remove existing files and directories
for item in "${targets[@]}"; do
    IFS=":" read -r target source <<< "$item"
    rm -rf "$target"
done

# Create symbolic links
for item in "${targets[@]}"; do
    IFS=":" read -r target source <<< "$item"
    ln -s "$source" "$target"
done
