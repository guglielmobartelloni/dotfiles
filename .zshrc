# Add deno completions to search path
if [[ ":$FPATH:" != *":~/.zsh/completions:"* ]]; then export FPATH="~/.zsh/completions:$FPATH"; fi
export PATH="$HOME/.brew/bin:$PATH"
export PATH="/Applications:$PATH"
source $(brew --prefix)/opt/antidote/share/antidote/antidote.zsh
# Set the root name of the plugins files (.txt and .zsh) antidote will use.
zsh_plugins=${ZDOTDIR:-~}/.zsh_plugins

# Ensure the .zsh_plugins.txt file exists so you can add plugins.
[[ -f ${zsh_plugins}.txt ]] || touch ${zsh_plugins}.txt

# Lazy-load antidote from its functions directory.
fpath=(/path/to/antidote/functions $fpath)
autoload -Uz antidote

# Generate a new static file whenever .zsh_plugins.txt is updated.
if [[ ! ${zsh_plugins}.zsh -nt ${zsh_plugins}.txt ]]; then
  antidote bundle <${zsh_plugins}.txt >|${zsh_plugins}.zsh
fi

# Source your static plugins file.
source ${zsh_plugins}.zsh

eval "$(starship init zsh)"

function rep() {
    cd $(find ~/Documents/repos -maxdepth 1 -type d | fzf)
}

# Select and checkout PR
function ghpr() {
    GH_FORCE_TTY=100% gh pr list | fzf --ansi --preview 'GH_FORCE_TTY=100% gh pr view {1}' --preview-window down --header-lines 3 | awk '{print $1}' | xargs gh pr checkout
}

# Get the item channel id and copy automatically
function ytdlc() {
    yt-dlp --print channel_url --playlist-items 1 $1 | awk -F'/' '{print $5}' | pbcopy
}

function h() {
    cd ~/Documents/progetti/hacking
    mkdir -p "$1"
    # mkdir -p "$1/php_server"
    cd "$1"
    # touch "php_server/index.php"
    touch "solve_$1.py"
    tmux new-session -s "$1" "nvim solve_$1.py" \; split-window -v "ssh samoorai@143.42.21.90 -p 69" 
}

function gara() {
    cd ~/Documents/progetti/hacking/gara/
    mkdir -p "$1"
    cd "$1"

    cp "/Users/samurai/Documents/progetti/hacking/gara/exploit.py" "solve_$1.py"
    tmux new-session -s "$1" "nvim solve_$1.py" \; 
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

function s() {
    watch ~/jenkins-fetcher.sh
}

function mc(){
    mvn clean compile -s ~/.m2/settings.xml
}

alias mp3="yt-dlp -f 'ba' -x --audio-format mp3 -o '/tmp/%(title)s.%(ext)s'"
alias aria="aria2c -j 30 --max-connection-per-server=16 --min-split-size=1M"
alias vim="nvim"
alias l="lazygit"
alias disp="displayplacer 'id:AFBA4B0E-92E5-B3AC-0857-D6964E3302DB res:1920x1080 hz:60 color_depth:8 scaling:off origin:(0,0) degree:0" "id:37D8832A-2D66-02CA-B9F7-8F30A301B230 res:1680x1050 hz:60 color_depth:8 scaling:on origin:(213,1080) degree:0'"
alias pippone="/opt/homebrew/Caskroom/miniconda/base/envs/hacking/bin/pip"
alias c="chezmoi"

export PATH="$HOME/.tmuxifier/bin:$PATH"
export PATH="/Users/samurai/.local/bin:$PATH"
export PATH=$PATH:/Users/samurai/go/bin
export PATH=$PATH:/Users/samurai/.cargo/bin/
export EDITOR='nvim'
export VULNBOX="10.60.3.1"

# eval "$(direnv hook zsh)"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
alias emacs='emacs -nw'
alias e='emacs -nw'

# [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
# [[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"
export HOMEBREW_CASK_OPTS="--appdir=~/Applications"
