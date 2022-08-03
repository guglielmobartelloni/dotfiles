#!/bin/sh

cp -r ~/.config/nvim . && git add . && git commit -m "Sync" && git push 
