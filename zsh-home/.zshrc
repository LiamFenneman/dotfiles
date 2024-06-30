source /etc/zshrc

bindkey '^ ' autosuggest-accept

export PATH="$HOME/.cargo/bin:$PATH"

export FZF_ALT_C_OPTS="--height 60% \
    --border none \
    --layout reverse \
    --prompt '∷ ' \
    --pointer ▶ \
    --marker ⇒"

export WALLPAPER_DIR="$HOME/Pictures/Wallpapers"

eval "$(zoxide init zsh)"
