### ─── Powerlevel10k Instant Prompt ────────────────────────────────────────────
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

### ─── Path Exports ─────────────────────────────────────────────────────────────
export PATH="$HOME/.brew/bin:$PATH"
export PATH="/Applications:$PATH"
export PATH="$HOME/.tmuxifier/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/go/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$VOLTA_HOME/bin:$PATH"
export PATH="/Applications/Docker.app/Contents/Resources/bin/:$PATH"

### ─── FPATH and Completions ────────────────────────────────────────────────────
if [[ ":$FPATH:" != *":$HOME/.zsh/completions:"* ]]; then
  export FPATH="$HOME/.zsh/completions:$FPATH"
fi

### ─── Plugin Manager: Antidote ─────────────────────────────────────────────────
source ~/.antidote/antidote.zsh
zsh_plugins=${ZDOTDIR:-~}/.zsh_plugins
[[ -f ${zsh_plugins}.txt ]] || touch ${zsh_plugins}.txt
fpath=(/path/to/antidote/functions $fpath)
autoload -Uz antidote
if [[ ! ${zsh_plugins}.zsh -nt ${zsh_plugins}.txt ]]; then
  antidote bundle <${zsh_plugins}.txt >|${zsh_plugins}.zsh
fi
source ${zsh_plugins}.zsh

### ─── Prompt and Shell Enhancements ────────────────────────────────────────────
eval "$(starship init zsh)"
command -v direnv >/dev/null && eval "$(direnv hook zsh)"
[[ "$TERM" == "xterm-kitty" ]] && alias ssh="TERM=xterm-256color ssh"

### ─── SDKs and Tools ───────────────────────────────────────────────────────────
export EDITOR='nvim'
export VULNBOX="10.60.3.1"
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$SDKMAN_DIR/bin/sdkman-init.sh" ]] && source "$SDKMAN_DIR/bin/sdkman-init.sh"
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
export VOLTA_HOME="$HOME/.volta"
export HOMEBREW_CASK_OPTS="--appdir=$HOME/Applications"

### ─── Aliases ──────────────────────────────────────────────────────────────────
alias mp3="yt-dlp -f 'ba' -x --audio-format mp3 -o '/tmp/%(title)s.%(ext)s'"
alias aria="aria2c -j 30 --max-connection-per-server=16 --min-split-size=1M"
alias vim="nvim"
alias l="lazygit"

### ─── Functions ────────────────────────────────────────────────────────────────
function rep() {
  sesh connect "$(find ~/Documents/repos -maxdepth 1 -type d | fzf)"
}

function mc() {
  mvn clean compile -s ~/.m2/settings.xml
}

function t() {
  exec </dev/tty
  exec <&1
  local session
  session=$(sesh list | fzf --height 40% --reverse --border-label ' sesh ' --border --prompt '⚡  ')
  [[ -z "$session" ]] && return
  sesh connect "$session"
}

### ─── Tmux Idle Session Killer ────────────────────────────────────────────────
if command -v tmux &> /dev/null; then
  tmux list-sessions -F "#{session_name} #{session_idle}" 2>/dev/null | while read -r name idle; do
    if [[ "$idle" -gt 5400 ]]; then  # 30 minutes
      tmux kill-session -t "$name"
    fi
  done
fi

### ─── Powerlevel10k Prompt Config ─────────────────────────────────────────────
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh
