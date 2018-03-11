#
# Deepspace theming
# -----------------------------------------------------------------------------

# General colour
set -g status-fg colour7
set -g status-bg '#232936' 

# Active pane foreground
set -g pane-active-border-fg colour8
set -g pane-border-fg black

# Left 
set -g status-left-length 30
set -g status-left "  " 

# Window list
set -g status-justify left
set -g window-status-separator " "
setw -g window-status-style "none"

setw -g window-status-format "#[bg=#232936,fg=colour8] #I #[bg=#232936,fg=colour8]#W #F "
setw -g window-status-current-format "#[bg=#232936,fg=colour9,bold] #I #[bg=#232936,fg=colour9,bold]#W #F "

setw -g window-status-activity-style "fg=colour1,bg=colour240"

# Right side
set -g status-right-length 50
set -g status-right-style "none"
set -g status-right "#[bg=black,fg=colour2] %a %H:%M %d/%m/%Y #[fg=colour6]#S@#h "
