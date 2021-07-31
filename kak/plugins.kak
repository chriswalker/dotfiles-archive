# -----------------------------------------------------------------------------
# Plugin configuration.
# -----------------------------------------------------------------------------

# Load plug.kak before doing anything else
source "%val{config}/plugins/plug.kak/rc/plug.kak"

# auto-pairs (insert closing parentheses & braces automatically)
# -----------------------------------------------------------------------------
plug "alexherbo2/auto-pairs.kak"

# kak-lsp - Installed via Homebrew, so not configured via plug.kak
# -----------------------------------------------------------------------------
eval %sh{kak-lsp --kakoune -s $kak_session -v}

set global lsp_diagnostic_line_error_sign '▶'
set global lsp_diagnostic_line_warning_sign '▶'

hook global KakEnd .* lsp-exit

# Config for Go filetypes
hook global WinSetOption filetype=go %{
    lsp-enable-window

    # Use golangci-lint for linting
    set window lintcmd 'golangci-lint run'
    set window formatcmd 'goimports'

    # Highlight references and change highlight face
    set window lsp_auto_highlight_references true
    set-face global Reference yellow+b

    # Anchor hover boxes on cursor
    # set window lsp_hover_anchor true

    # Format and lint on save
    hook buffer BufWritePre .* %{
        format
        lint
    }
}

# Make the hover stuff suck less; supress the "no identifier found" info box
define-command -override -hidden lsp-show-error -params 1 -docstring "Render error (suppress useless gopls errors)" %{
    evaluate-commands %sh{
        if [ "$1" = "go language server error: 'no object found'" ]; then
            exit 0
        fi
        echo 'info %arg{1}'
    }
}

# golang.kak - additional Go-related functionality
# -----------------------------------------------------------------------------
plug "chriswalker/golang.kak" %{
	# Override some highlighters
	set-face global Uninstrumented 'rgb:616e88'
}
