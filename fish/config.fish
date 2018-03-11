#
# config.fish
#
# @author Chris Walker
# @date   13/11/2016
#

#
# General settings
# -----------------------------------------------------------------------------

# Neovim as the default editor
set -U EDITOR nvim

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

# Data directory for docker volume mounts etc
set -g DATA_HOME ~/Dev/data

# Update path
set PATH $GOROOT/bin $GOPATH/bin ~/bin $PATH

switch (uname)
case Darwin
  set PATH ~/Dev/Work/google-cloud-sdk/bin $PATH
end


# UI tweaks
# -----------------------------------------------------------------------------

#
# Aliases
# -----------------------------------------------------------------------------

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
alias k "kubectl"
alias kgp "kubectl get pods|grep $1"

#
# Work specific config 
# TODO
# -----------------------------------------------------------------------------
set -gx K8S_MANIFESTS_DIR $HOME/Dev/Projects/Work/k8s-manifests
set -gx DATA_DIR $HOME/Dev/tmp

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.fish ]; and . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.fish
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.fish ]; and . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.fish