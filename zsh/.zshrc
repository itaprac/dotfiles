export PATH="/usr/local/sbin:$PATH"
export EDITOR=nvim

# uncomment to run zprof
# zmodload zsh/prof

# history
HISTSIZE=50000
SAVEHIST=10000

# Created by Zap installer
[ -f "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" ] && source "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"
plug "zsh-users/zsh-autosuggestions"
plug "zap-zsh/supercharge"
plug "zap-zsh/zap-prompt"
plug "zsh-users/zsh-syntax-highlighting"
plug "zsh-users/zsh-completions"
plug "Homebrew/homebrew-command-not-found"
plug "djui/alias-tips"
plug "gretzky/auto-color-ls"
plug "ael-code/zsh-colored-man-pages"

# Load and initialise completion system
autoload -Uz compinit
compinit

# set starship prompt
eval "$(starship init zsh)"

# load the rest of the configs
source $HOME/dotfiles/zsh/.exports
source $HOME/dotfiles/zsh/.aliases

# fzf shortcut to cd into a directory fount by fzf
fcd() {
  local dir
  dir=$(find . -type d 2>/dev/null | fzf +m) && cd "$dir"
}

# start tmux on open
# [[ $- != *i* ]] && return
# [[ -z "$TMUX" ]] && exec tmux

