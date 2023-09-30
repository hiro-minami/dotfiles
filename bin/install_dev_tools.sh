#!/bin/bash

# homebrew
brew bundle --file=~/dotfiles/Brewfile

# node
nodebrew setup
nodebrew install-binary stable
nodebrew use $(echo nodebrew ls)
