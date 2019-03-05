#
# Onedark theming
# -----------------------------------------------------------------------------

# General colour
set -g status-fg colour7
set -g status-bg "#2C323C"

# Message/Command line
set -g message-style fg=black,bg=colour6,bold

# Mode/Cut/Paste
set -g mode-style fg=black,bg=colour6,bold

# Active pane foreground
set -g pane-active-border-fg colour15
set -g pane-border-fg colour8

# Left 
set -g status-left-length 30
#set -g status-left "#[bg=colour8,fg=colour6] Session: #S " 
set -g status-left ""

# Window list
set -g status-justify left
set -g window-status-separator " "
setw -g window-status-style "none"

setw -g window-status-format "#[bg=#2C323C,fg=colour7] #I #[bg=#2C323C,fg=colour7]#W #F "
setw -g window-status-current-format "#[bg=#2C323C,fg=colour10,bold] #I #[bg=#2C323C,fg=colour10,bold]#W #F "

setw -g window-status-activity-style "fg=colour1,bg=colour240"

# Right side
set -g status-right-length 50
set -g status-right-style "none"
set -g status-right " #[fg=colour6] %a %H:%M %d/%m/%Y #[fg=colour6,bold][#S/#h] "
