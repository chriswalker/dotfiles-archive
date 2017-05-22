#!/bin/bash

#ln -fs dotfiles/.zsh/.zshrc .
ln -fs ~/dotfiles/.tmux.conf ~
ln -fs ~/dotfiles/.ackrc ~
ln -fs ~/dotfiles/.vim/.vimrc ~
#ln -fs ~/dotfiles/.bashrc ~

rm -rf ~/.config/fish ~/.config/nvim

ln -fs ~/dotfiles/fish ~/.config/fish
ln -fs ~/dotfiles/nvim ~/.config/nvim

# Tweaked terminfo for tmux's $TERM, replacing ^H (backspace)
# with ASCII DEL. Allows Ctrl-h to work when remapped in (N)Vim/tmux
# for moving to the next-left window
if [[ `uname` == 'Darwin' ]]; then
  ln -fs ~/dotfiles/screen-256color.ti ~
fi
