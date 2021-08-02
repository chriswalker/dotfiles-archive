#
# config.fish
#
# @author Chris Walker
# @date   13/11/2016
#

# General settings
# -----------------------------------------------------------------------------

# Kakoune as the default editor
set -U EDITOR kak

# Vi(m) bindings on the prompt
set fish_key_bindings fish_vi_key_bindings

# Config paths for tools 
set -x XDG_CONFIG_HOME $HOME/.config
set -x RIPGREP_CONFIG_PATH $XDG_CONFIG_HOME/ripgrep/.ripgreprc
set -x BAT_CONFIG_PATH $XDG_CONFIG_HOME/bat/bat.conf

# Data directory for docker volume mounts etc
set -g DATA_HOME ~/Dev/data

# Set exa colours
# ----------------------------------------------------------------------------
set -x EXA_COLORS "uu=37:un=37:gu=33:gn=37:da=37:sn=36:sb=36:ur=37:gr=35:tr=35:uw=37:gw=35:ow=35:ue=37:gx=35:tx=35:lp=32"

# Source other config files
# -----------------------------------------------------------------------------
set files paths.fish fzf.fish ui.fish aliases.fish
for file in $files; source $XDG_CONFIG_HOME/fish/$file; end
