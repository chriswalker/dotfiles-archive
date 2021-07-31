#
# aliases.fish - common aliases
#
# @author Chris Walker
#

# Architecture-specific
alias ls "ls -GFh"
alias ql "qlmanage -p"
alias o "open"
# Alias most to normal less
alias less "/usr/local/bin/most $1"

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
# alias k "kubectl"
# alias kl "kubectl logs -f"
# alias kdp "kubectl describe pod $1"

# Docker
alias d "docker"
alias dps "docker ps"

