# -----------------------------------------------------------------------------
# General configuration for Kakoune - UI tweaks, highlighters and so on.
# -----------------------------------------------------------------------------

# UI changes: get rid of clippy, don't chamge terminal title
set global ui_options terminal_assistant=off terminal_set_title=false

# Set tab widths to 4 spaces
set-option global tabstop 4

# Keep three rows/cols in view when scrolling
set-option global scrolloff 3,3

# Stop startup info box
set-option global startup_info_version 99999999

# Nord colour scheme
colorscheme nord

# Highlight TODO-type comments
add-highlighter global/ regex \b(TODO|FIXME|XXX|NOTE)\b 0:Todo

# Wrap lines
add-highlighter global/ wrap

# Marker for excessive line length
add-highlighter global/ column 100 StatusLine

# Hooks
# -----------------------------------------------------------------------------
hook global WinCreate .* %{
    # Relative line numbers, highlight current line number
    add-highlighter buffer/numbers number-lines -relative -hlcursor -separator '  '
    # Highlight matches
    add-highlighter buffer/matching show-matching
}

# Fuzzy-finder replacement for fzf
define-command fz -params 1 -shell-script-candidates %{
    fd --type file --hidden
} %{
    edit %arg{1}
}

# Set bats (Bash unit-test) files to `sh` filetype, and pick up
# default highlighting
hook global BufCreate .*\.bats %{
    set buffer filetype sh
}
