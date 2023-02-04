#!/usr/bin/env bash

ln -s $(pwd)/zshrc ~/.zshrc
ln -s $(pwd)/tmux.conf ~/.tmux.conf
ln -s $(pwd)/nvim ~/.config/nvim
ln -s $(pwd)/kitty ~/.config/kitty

# install Oh My Zsh
sh -c '$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)'

# install Tmux plugin manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# install Packer for NVIM
git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
