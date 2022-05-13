#!/bin/bash

# Programming Language
# node
brew install nodebrew
nodebrew setup
nodebrew install-binary stable
nodebrew use ${echo nodebrew ls}

# typescript
# go
# rust

# middleware
# docker
brew install docker
brew install -- cask docker

# neovim
brew install neovim