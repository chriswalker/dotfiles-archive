#!/bin/bash

# fish automatically creates ~/.config/fish/ if missing,
# so delete it before linking
rm -rf $XDG_CONFIG_HOME/fish

DOTFILES_HOME=$HOME/dotfiles
DOTS="alacritty bat fd fish kak kitty nvim ripgrep tmux"

for DOT in $DOTS ; do
    echo "Linking $DOT..."
    ln -fs $DOTFILES_HOME/$DOT $XDG_CONFIG_HOME/
done
