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

set -g GOROOT /usr/local/Cellar/go/1.7.1/libexec
set -g GOPATH ~/Dev/Projects/Go
# Update path
set PATH $GOROOT/bin $GOPATH/bin $PATH

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

