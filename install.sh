#!/bin/bash

# fish automatically creates ~/.config/fish/ if missing,
# so delete it before linking
rm -rf $XDG_CONFIG_HOME/fish

DOTFILES_HOME=$HOME/dotfiles
DOTS="alacritty bat bspwm dconf dunst fd fish git gtk-3.0 kak picom polybar pulse ripgrep rofi sxhkd Thunar tmux xfce4"

for DOT in $DOTS ; do
    echo "Linking $DOT..."
    ln -fs $DOTFILES_HOME/$DOT $XDG_CONFIG_HOME/
done

ln -fs $DOTFILES_HOME/.xinitrc $HOME
ln -fs $DOTFILES_HOME/.xprofile $HOME
