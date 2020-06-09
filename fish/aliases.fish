#
# aliases.fish - common aliases
#
# @author Chris Walker
#

# Architecture-specific
switch (uname)
case Linux
  alias ls "ls -GFh --color=auto"
case Darwin
  alias ls "ls -GFh"
  alias ql "qlmanage -p"
  alias o "open"
  # Alias Neovim's less script to normal less
  alias less "/usr/local/Cellar/neovim/0.2.1/share/nvim/runtime/macros/less.sh $1"
end

# General
# TODO - tweak history aliases
alias h "history"
alias history "history -t \"[%d/%m/%y %T]\""
alias grep "grep --color=auto"

# Top display in CPU decending order
alias top "top -o cpu"

# Nicer tree output - default to ignoring vendor/ and .git/ folders
alias tree "tree -aC -I \"vendor|.git\""

# Bat instead of plain cat
alias cat "bat"

# k8s aliases; see also ./fish/functions
alias k "kubectl"
alias kl "kubectl logs -f"
alias kdp "kubectl describe pod $1"

# Docker
alias d "docker"
alias dps "docker ps"

# GCloud
alias gct "gcloud config configurations activate taw"
alias gck "gcloud config configurations activate default"
