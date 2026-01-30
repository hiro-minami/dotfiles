#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
DOTFILES_DIR="$(dirname "$SCRIPT_DIR")"

# fish
brew install fish

# Add fish to /etc/shells if not already present
if ! grep -q "$(which fish)" /etc/shells; then
    sudo sh -c 'echo $(which fish) >> /etc/shells'
fi

# Change default shell to fish
chsh -s "$(which fish)"

# Link fish config
rm -rf ~/.config/fish
ln -sf "$DOTFILES_DIR/fish" ~/.config/fish

# Install fisher (fish plugin manager)
brew install fisher

# Install brew packages first (before changing directories)
brew install z
brew install peco
brew install fzf
brew install ghq

# Set ghq root
git config --global ghq.root ~/git

# Install Powerline fonts (use subshell to preserve current directory)
(
    rm -rf /tmp/powerline-fonts
    git clone https://github.com/powerline/fonts.git /tmp/powerline-fonts
    cd /tmp/powerline-fonts && ./install.sh
    rm -rf /tmp/powerline-fonts
)

# Install fisher plugins (must be run inside fish shell)
fish -c '
    # Install fisher if not installed
    if not functions -q fisher
        curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source
        fisher install jorgebucaran/fisher
    end

    # Install plugins
    fisher install oh-my-fish/theme-bobthefish
    fisher install 0rax/fish-bd
    fisher install jethrokuan/z
    fisher install oh-my-fish/plugin-peco
    fisher install jethrokuan/fzf
    fisher install decors/fish-ghq
'

echo "✅ Fish shell setup complete!"
echo "Please restart your terminal or run 'exec fish' to start using fish shell."