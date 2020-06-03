#
# ui.fish - theming (Nord) and other UI-related tweaks
#
# @author Chris Walker
#

source $XDG_CONFIG_HOME/fish/nord.fish

set fish_color_error $aurora_red --underline
set fish_color_comment $polar_night_comment
set fish_color_quote $aurora_green
set fish_color_match $frost_lightest
set fish_color_command $frost_light
set fish_color_param $snow_storm_dark
set fish_color_autosuggestion $polar_night_comment
set fish_color_redirection $aurora_orange
set fish_color_end $aurora_yellow
set fish_color_operator $frost_light
set fish_color_escape $frost_light

set fish_pager_color_description $frost_light
set fish_pager_color_prefix $snow_storm_dark
set fish_pager_color_completion $frost_dark

set fish_pager_color_selected_description $snow_storm_dark --bold
set fish_pager_color_selected_prefix $snow_storm_dark --bold
set fish_pager_color_selected_completion $snow_storm_dark --bold
set fish_pager_color_selected_background --background=$polar_night_light

set fish_pager_color_progress $aurora_orange
