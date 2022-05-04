#!/bin/bash

# fish
brew install fish
rm -r ~/.config/fish
ln -sf ~/dotfiles/fish ~/.config
sudo sh -c 'echo $(which fish) >> /etc/shells'
chsh -s $(which fish)

# fonts
fisher install oh-my-fish/theme-bobthefish
git clone https://github.com/powerline/fonts.git
cd fonts
./install.sh
rm -rf ./fonts
