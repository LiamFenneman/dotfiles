# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"
ZSH_TMUX_AUTOCONNECT=false
ZSH_TMUX_AUTOSTART=false

# Plugins
plugins=(
    git
    fzf
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
alias exa="exa -1lag -s Name --group-directories-first --icons --color=always"
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

# Choose a wallpaper from $WALLPAPER_DIR
WALLPAPER_DIR=$HOME/Pictures/Wallpapers
alias wp="/usr/bin/ls $WALLPAPER_DIR | fzf --preview=\"feh --bg-scale $WALLPAPER_DIR/{}\" | xargs -I {} feh --bg-scale $WALLPAPER_DIR/{}"

# Add local bin to path
export PATH=$HOME/.local/bin:$PATH

# Set NVIM as default editor
export EDITOR=/usr/local/bin/nvim

# Turso
export PATH="/home/liam/.turso:$PATH"

[[ ! -r /home/liam/.opam/opam-init/init.zsh ]] || source /home/liam/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null
