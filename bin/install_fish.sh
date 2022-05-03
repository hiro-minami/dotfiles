#!/bin/bash

# fish
brew install fish
ln -sf ~/dotfiles/fish ~/.config/fish
sudo sh -c 'echo /opt/homebrew/bin/fish >> /etc/shells'
chsh -s /opt/homebrew/bin/fish

# fisher
curl https://git.io/fisher --create-dirs -sLo ~/dotfiles/.config/fish/functions/fisher.fish

# fonts
fisher install oh-my-fish/theme-bobthefish
git clone https://github.com/powerline/fonts.git
cd fonts
./install.sh
rm -rf ./fonts

# z
brew install z
fisher install jethrokuan/z

# fzf
brew install fzf
fisher install jethrokuan/fzf
