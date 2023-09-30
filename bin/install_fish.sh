#!/bin/bash

# fish
brew install fish
rm -r ~/.config/fish
ln -sf ~/dotfiles/fish ~/.config
sudo sh -c 'echo $(which fish) >> /etc/shells'
chsh -s $(which fish)

# fonts
brew install fisher
fisher install oh-my-fish/theme-bobthefish
git clone https://github.com/powerline/fonts.git
cd fonts
./install.sh
rm -rf ./fonts

# fish-bd
fisher install 0rax/fish-bd

# z
brew install z
fisher install jethrokuan/z

# peco
brew install peco
fisher install oh-my-fish/plugin-peco

# fzf
brew install fzf
fisher install jethrokuan/fzf

# ghq
brew install ghq
git config --global ghq.root ~/git
fisher install decors/fish-ghq
