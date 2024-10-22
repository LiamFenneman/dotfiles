source /etc/zshrc

bindkey '^ ' autosuggest-accept

export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

export CARGO_TARGET_DIR="$HOME/.cargo/target"

export FZF_ALT_C_OPTS="--height 60% \
    --border none \
    --layout reverse \
    --prompt '∷ ' \
    --pointer ▶ \
    --marker ⇒"

export WALLPAPER_DIR="$HOME/Pictures/Wallpapers"

eval "$(zoxide init zsh)"
