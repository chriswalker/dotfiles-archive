# -----------------------------------------------------------------------------
# General configuration for Kakoune - UI tweaks, highlighters and so on.
# -----------------------------------------------------------------------------

# ncurses changes: get rid og clippy, don't chamge terminal title
set global ui_options ncurses_assistant=off ncurses_set_title=false

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
