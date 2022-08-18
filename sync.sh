#!/bin/sh

cp -r ~/.config/nvim .config
cp ~/.zshrc .
git add . && git commit -m "Sync" && git push
