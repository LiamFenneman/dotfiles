# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd
unsetopt beep
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/liam/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

source ~/.zshenv

source /usr/share/zplug/init.zsh
# zplug "plugins/git", from:oh-my-zsh
zplug "plugins/sudo", from:oh-my-zsh
zplug "plugins/command-not-found", from:oh-my-zsh
zplug "plugins/fzf", from:oh-my-zsh
zplug "zsh-users/zsh-syntax-highlighting"
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-completions"
zplug "themes/robbyrussell", from:oh-my-zsh, as:theme

if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi
zplug load

bindkey '^ ' autosuggest-accept
bindkey '^[[1;5C' forward-word
bindkey '^[[1;5D' backward-word

export LANG="en_NZ.utf8"
export EDITOR=nvim

alias ls='ls -al --color=auto'
alias g='git '
alias gc='git commit'
alias gs='git status'
alias gp='git push '
alias ga='git add '
alias gd='git diff'
alias gdc='git diff --cached'
alias gl="git log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --branches"

export FZF_ALT_C_OPTS="--height 60% \
                       --border none \
                       --layout reverse \
                       --prompt '∷ ' \
                       --pointer ▶ \
                       --marker ⇒"

path_add() {
    export PATH="$PATH:$1"
}

path_add "/home/liam/.dotnet/tools"
path_add "/home/liam/.local/bin"
path_add "/home/liam/.local/share/JetBrains/Toolbox/scripts"

eval "$(zoxide init zsh)"

eval $(keychain --eval --agents ssh --quick --quiet id_ed25519 google_compute_engine)

# add Pulumi to the PATH
export PATH=$PATH:/home/liam/.pulumi/bin
alias p=pulumi
alias k=$HOME/.local/bin/kubectl-wrapper.sh

alias gcloud=/home/liam/.local/bin/gcloud-wrapper.sh

export AWS_PROFILE=dev
export PULUMI_CONFIG_PASSPHRASE_FILE="/home/liam/tmp/pulumi.txt"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
