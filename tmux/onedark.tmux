#
# Onedark theming
# -----------------------------------------------------------------------------

# General colour
set -g status-fg colour7
set -g status-bg "#2C323C"

# Active pane foreground
set -g pane-active-border-fg colour15
set -g pane-border-fg colour8

# Left 
set -g status-left-length 30
set -g status-left "#[bg=colour8,fg=colour6,bold] Session: #S " 

# Window list
set -g status-justify left
set -g window-status-separator " "
setw -g window-status-style "none"

setw -g window-status-format "#[bg=#2C323C,fg=colour7] #I #[bg=#2C323C,fg=colour7]#W #F "
setw -g window-status-current-format "#[bg=black,fg=colour11,bold] #I #[bg=black,fg=colour11,bold]#W #F "

setw -g window-status-activity-style "fg=colour1,bg=colour240"

# Right side
set -g status-right-length 50
set -g status-right-style "none"
set -g status-right " #[fg=colour2] %a %H:%M %d/%m/%Y #[fg=colour6]#(whoami)@#h "
