source $(brew --prefix)/opt/antidote/share/antidote/antidote.zsh

antidote load


eval "$(starship init zsh)"
eval "$(direnv hook zsh)"

# Select and checkout PR
function ghpr() {
    GH_FORCE_TTY=100% gh pr list | fzf --ansi --preview 'GH_FORCE_TTY=100% gh pr view {1}' --preview-window down --header-lines 3 | awk '{print $1}' | xargs gh pr checkout
}

# Get the item channel id and copy automatically
function ytdlc() {
    yt-dlp --print channel_url --playlist-items 1 $1 | awk -F'/' '{print $5}' | pbcopy
}

function cfv() {
    chezmoi edit -a ~/.config/nvim
}

function tm(){
    tmux new -s $(pwd | sed 's/.*\///g')
}

function open_with_fzf() {
    fd -t f -H -I | fzf -m --preview="bat {}" | xargs open 2>&-
}

alias mp3="yt-dlp -f 'ba' -x --audio-format mp3 -o '/tmp/%(title)s.%(ext)s'"
alias aria="aria2c -j 30 --max-connection-per-server=16 --min-split-size=1M"
alias vim="nvim"
alias l="lazygit"
alias c="chezmoi"
alias emacs='emacs -nw'
alias e='emacs -nw'

export PATH="$HOME/.tmuxifier/bin:$PATH"
export PATH="/Users/samurai/.local/bin:$PATH"
export PATH=$PATH:/Users/samurai/go/bin
export PATH=$PATH:/Users/samurai/.cargo/bin/
export EDITOR='nvim'

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

export PATH=$PATH:/Users/samurai/.spicetify
source ~/.secrets
