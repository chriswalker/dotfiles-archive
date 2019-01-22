#
# Deepspace theming
# -----------------------------------------------------------------------------

# General colour
set -g status-fg colour7
set -g status-bg '#232936' 

# Message/Command line
set -g message-style fg=black,bg=colour9,bold

# Mode/Cut/Paste
set -g mode-style fg=black,bg=colour9,bold

# Active pane foreground
set -g pane-active-border-fg colour8
set -g pane-border-fg black

# Left 
set -g status-left-length 30
set -g status-left " " 

# Window list
set -g status-justify left
set -g window-status-separator " "
setw -g window-status-style "none"

setw -g window-status-format "#[bg=#232936,fg=colour8] #I #[bg=#232936,fg=colour8]#W #F "
setw -g window-status-current-format "#[bg=black,fg=colour9,bold] #I #[bg=black,fg=colour9,bold]#W #F "

setw -g window-status-activity-style "fg=colour1,bg=colour240"

# Right side
set -g status-right-length 50
set -g status-right-style "none"
set -g status-right " #[fg=colour2] %a %H:%M %d/%m/%Y #[bg=black,fg=colour6] #(whoami)@#h #[bg=colour8,fg=colour15,bold] #S "
