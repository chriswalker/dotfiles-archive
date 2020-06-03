#
# fzf.fish - fzf configuration
#
# @author Chris Walker
#

# Use ripgrep in searches
set -x FZF_DEFAULT_COMMAND 'rg --hidden -l ""'

# Set Nord theming
set -x FZF_DEFAULT_OPTS '
    --color fg:#D8DEE9,bg:#2E3440,hl:#88C0D0,fg+:#D8DEE9,bg+:#2E3440,hl+:#BF616A
    --color pointer:#BF616A,info:#88C0D0,spinner:#88C0D0,header:#4C566A,prompt:#81A1C1,marker:#EBCB8B
    --color gutter:#2E3440
    --color border:#3B4252
'

# Set preview command
set -x FZF_PREVIEW_COMMAND "bat --style=changes --theme='Nord' --color=always"

# Show tree of selection in directory matching
set -x FZF_ALT_C_OPTS "--preview 'tree -C {} | head -200'"
