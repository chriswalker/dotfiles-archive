#
# Nord theming
# -----------------------------------------------------------------------------

# General colour
set -g status-fg colour7
set -g status-bg "#3B4252"

# Message/Command line
set -g message-style fg="#2E3440",bg="#8FBCBB",bold

# Mode/Cut/Paste
set -g mode-style fg="#2E3440",bg="#8FBCBB",bold

# Active pane foreground
set -g pane-active-border-style fg="#4C566A"
set -g pane-border-style fg="#3B4252"

# Left 
set -g status-left-length 30
#set -g status-left "#[bg=colour8,fg=colour6] Session: #S " 
set -g status-left ""

# Window list
set -g status-justify left
set -g window-status-separator " "
setw -g window-status-style "none"

setw -g window-status-format "#[bg=#3B4252,fg=colour7] #I #[bg=#3B4252,fg=colour7]#W #F "
setw -g window-status-current-format "#[bg=#2E3440,fg=colour10,bold] #I #[bg=#2E3440,fg=colour10,bold]#W #F "

setw -g window-status-activity-style "fg=colour1,bg=colour240"

# Right side
set -g status-right-length 50
set -g status-right-style "none"
set -g status-right " #[fg=colour6] %a %H:%M %d/%m/%Y #[fg=colour6,bold][#S/#h] "
