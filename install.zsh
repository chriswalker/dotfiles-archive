#!/bin/bash

#ln -fs dotfiles/.zsh/.zshrc .
ln -fs ~/dotfiles/.tmux.conf ~
ln -fs ~/dotfiles/.ackrc ~
ln -fs ~/dotfiles/.vim/.vimrc ~
#ln -fs ~/dotfiles/.bashrc ~

rm -rf ~/.config/fish
ln -fs ~/dotfiles/fish ~/.config/fish
