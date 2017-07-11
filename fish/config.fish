#
# config.fish
#
# @author Chris Walker
# @date   13/11/2016
#

#
# General settings
# -----------------------------------------------------------------------------

# Vim as the default editor
set -U EDITOR vim

# Vi(m) bindings on the prompt
set fish_key_bindings fish_vi_key_bindings

#
# Set up various path entries
# -----------------------------------------------------------------------------

# Golang
switch (uname)
case Linux
  set -g GOROOT /usr/local/go
case Darwin
  set -g GOROOT /usr/local/Cellar/go/1.8/libexec
end

set -x GOPATH ~/Dev/Projects/Go

# Java
set -g JAVA_HOME /Library/Java/JavaVirtualMachines/jdk1.8.0_60.jdk/Contents/Home 
set -g JDK_HOME $JAVA_HOME

# Data directory for docker volume mounts etc
set -g DATA_HOME ~/Dev/data

# Update path
set PATH $GOROOT/bin $GOPATH/bin ~/bin $PATH

#
# UI tweaks
# -----------------------------------------------------------------------------
switch (uname)
case Linux
  ~/dotfiles/nvim/plugged/gruvbox/gruvbox_256palette.sh
case Darwin
  ~dotfiles/nvim/plugged/gruvbox/gruvbox_256palette_osx.sh
end

#
# Aliases
# -----------------------------------------------------------------------------

alias ls "ls -GFh"
alias h "history"
alias history "history -t \"[%d/%m/%y %T]\""
alias grep "grep --color=auto"
# Alias Vim's less script to normal less
alias less "/usr/local/Cellar/vim/7.4.1468/share/vim/vim74/macros/less.sh $1"
# Top display in CPU decending order
alias top "top -o cpu"

# Mac-specific
# TODO: Make mac-only check
alias ql "qlmanage -p"
alias o "open"

#
# Client-speciic config; not stored in repo
# TODO
# -----------------------------------------------------------------------------
# source $HOME/dotfiles/.zsh/work.zsh

