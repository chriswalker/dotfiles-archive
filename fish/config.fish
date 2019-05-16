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

set -x RIPGREP_CONFIG_PATH ~/.config/ripgrep

set -x FZF_DEFAULT_COMMAND 'rg --hidden -l ""'

set -x BAT_CONFIG_PATH $HOME/dotfiles/misc/bat.conf

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

set -x GOPATH ~/Dev/Go
set -x GOBIN $GOPATH/bin

# Data directory for docker volume mounts etc
set -g DATA_HOME ~/Dev/data

# Update path
set PATH $GOROOT/bin $GOBIN ~/bin $PATH

# GCP - TODO: Change for Linux as well
switch (uname)
case Darwin
  set PATH ~/Dev/Work/google-cloud-sdk/bin $PATH
end

set PATH ~/Dev/Projects/karhoo/k-tools/bin $PATH

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

# Nicer tree output - default to ignoring vendor/ and .git/ folders
alias tree "tree -aC -I \"vendor|.git\""

# Bat instead of plain cat
alias cat "bat"

# Kubectl
alias k "kubectl"
alias kgp "kubectl get pods -o wide|grep $1"

# GCloud
alias gct "gcloud config configurations activate taw"
alias gck "gcloud config configurations activate default"

# todo.sh
alias t "todo.sh -d $HOME/dotfiles/misc/todo.conf"

#
# Work specific config 
# TODO
# -----------------------------------------------------------------------------
set -gx K8S_MANIFESTS_DIR $HOME/Dev/Projects/karhoo/k8s-manifests
set -gx K8S_VPN_USERNAME chris.walker
set -gx DATA_DIR $HOME/Dev/tmp

switch (uname)
case Linux
  # The next line updates PATH for the Google Cloud SDK.
  if [ -f '/home/chris/Downloads/google-cloud-sdk/path.fish.inc' ]; 
    . '/home/chris/Downloads/google-cloud-sdk/path.fish.inc'; 
  end
end

switch (hostname)
case zanshin.local
  # tabtab source for serverless package
  # uninstall by removing these lines or running `tabtab uninstall serverless`
  [ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.fish ]; and . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.fish
  # tabtab source for sls package
  # uninstall by removing these lines or running `tabtab uninstall sls`
  [ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.fish ]; and . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.fish
  # tabtab source for slss package
  # uninstall by removing these lines or running `tabtab uninstall slss`
  [ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/slss.fish ]; and . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/slss.fish
end
