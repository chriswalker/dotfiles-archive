#
# aliases.fish - common aliases
#
# @author Chris Walker
#

alias ls "ls -GFh --color=auto"

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

# Docker
alias d "docker"
alias dps "docker ps"
