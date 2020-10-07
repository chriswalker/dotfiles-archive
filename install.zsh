#!/bin/bash

rm -rf ~/.config/fish ~/.config/nvim ~/.config/kitty ~/.config/kak

# ln -fs ~/dotfiles/tmux/.tmux.conf ~
ln -fs ~/dotfiles/tmux ~/.config/tmux
ln -fs ~/dotfiles/misc/.ripgreprc ~/.config/ripgrep
ln -fs ~/dotfiles/misc/fd ~/.config/fd

ln -fs ~/dotfiles/fish ~/.config/fish
ln -fs ~/dotfiles/nvim ~/.config/nvim
ln -fs ~/dotfiles/kitty ~/.config/kitty
ln -fs ~/dotfiles/kak ~/.config/kak
ln -fs ~/dotfiles/alacritty ~/.config/alacritty
