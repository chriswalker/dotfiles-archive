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
set -x RIPGREP_CONFIG_PATH ~/.config/ripgrep
set -x BAT_CONFIG_PATH $HOME/dotfiles/misc/bat/bat.conf
set -x XDG_CONFIG_HOME $HOME/.config/

# Data directory for docker volume mounts etc
set -g DATA_HOME ~/Dev/data

# Source other config files
# -----------------------------------------------------------------------------
set files paths.fish fzf.fish ui.fish aliases.fish work.fish
for file in $files; source $XDG_CONFIG_HOME/fish/$file; end
