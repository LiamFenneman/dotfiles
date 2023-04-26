#!/usr/bin/env bash

ln -s $(pwd)/i3 ~/.config/i3
ln -s $(pwd)/kitty ~/.config/kitty
ln -s $(pwd)/nvim ~/.config/nvim
ln -s $(pwd)/picom ~/.config/picom
ln -s $(pwd)/rofi ~/.config/rofi
ln -s $(pwd)/tmux.conf ~/.tmux.conf
ln -s $(pwd)/zshrc ~/.zshrc

# install Oh My Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/unixorn/fzf-zsh-plugin.git \
    ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/fzf-zsh-plugin
git clone https://github.com/zdharma-continuum/fast-syntax-highlighting \
    ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/fast-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions \
    ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# install Tmux plugin manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# install Packer for NVIM
git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
