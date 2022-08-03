#!/bin/sh

cp -r ~/.config/nvim .config && git add . && git commit -m "Sync" && git push 
