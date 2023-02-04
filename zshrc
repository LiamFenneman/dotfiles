# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="half-life"
ZSH_THEME="mortalscumbag"
ZSH_TMUX_AUTOCONNECT=true
ZSH_TMUX_AUTOSTART=true

# Plugins
plugins=(
    git
    fzf-zsh-plugin
    fast-syntax-highlighting
    zsh-autosuggestions
    tmux
)
source $ZSH/oh-my-zsh.sh

# set CTRL+Space to accept auto suggestion
bindkey '^ ' autosuggest-accept

# Shortcuts to commom folders
alias p="cd ~/Documents/Projects/"
alias u="cd ~/Documents/University/"
alias d="cd ~/dotfiles/"

# User configuration
alias vim="nvim"
alias ls="/usr/bin/ls -Ahls --color=auto"
alias mv="mv -i"
alias mkdir="mkdir -p"
alias df="df -h"

# Git alias
alias gs="git status"
alias gp="git push "
alias ga="git add "
alias gc="git commit "
alias gd="git diff"
alias gdc="git diff --cached"
alias gl="git log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --branches"

export PATH=$HOME/.local/bin:$PATH
export EDITOR=/usr/bin/nvim
