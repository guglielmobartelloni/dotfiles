PWD=$(pwd)
rm -rf ~/.config/nvim
rm -rf ~/.config/kitty
rm -rf ~/.tmux.conf
rm -rf ~/.zsh_plugins.txt
rm -rf ~/.zshrc
ln -s "$PWD/nvim" ~/.config/nvim
ln -s "$PWD/kitty" ~/.config/kitty
ln -s "$PWD/.tmux.conf" ~/.tmux.conf
ln -s "$PWD/.zsh_plugins.txt" ~/.zsh_plugins.txt
ln -s "$PWD/.zshrc" ~/.zshrc

