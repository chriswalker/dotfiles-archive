# -----------------------------------------------------------------------------
# Plugin configuration.
# -----------------------------------------------------------------------------

# Load plug.kak before doing anything else
source "%val{config}/plugins/plug.kak/rc/plug.kak"

# Escape args prior to passing to Kakoune; dependency of connect.kak
# -----------------------------------------------------------------------------
plug "alexherbo2/prelude.kak"

# auto-pairs (insert closing parentheses & braces automatically)
# -----------------------------------------------------------------------------
plug "alexherbo2/auto-pairs.kak"

# connect.kak
# -----------------------------------------------------------------------------
plug "alexherbo2/connect.kak" %{
    require-module connect-fzf

    # <leader>-f to open files with fzf
	map -docstring "fzf - Files" global user f ': fzf-files<ret>'
    # <leader>-f to switch buffers with fzf
	map -docstring "fzf - Buffers" global user b ': fzf-buffers<ret>'
}

# kak-lsp - Installed via Homebrew, so not configured via plug.kak
# -----------------------------------------------------------------------------
eval %sh{kak-lsp --kakoune -s $kak_session}

set global lsp_diagnostic_line_error_sign '▶'
set global lsp_diagnostic_line_warning_sign '▶'

# TODO - Switch off logging to debug buffer

hook global KakEnd .* lsp-exit

# Config for Go filetypes
hook global WinSetOption filetype=go %{
    # Use golangci-lint for linting
    set window lintcmd 'golangci-lint run'

  	# LSP-related config
  	lsp-enable-window
  	set window lsp_auto_highlight_references true
  	# lsp-auto-hover-enable
    # set window lsp_hover_anchor true

    # Run goimports for formatting
    hook buffer BufWritePre .* %{
        go-format -use=goimports
        lint
    }

	# Override References face
    set-face global Reference yellow+b
}

# Make the hover stuff suck less; supress the "no identifier found" info box
define-command -override -hidden lsp-show-error -params 1 -docstring "Render error (suppress useless gopls errors)" %{
    evaluate-commands %sh{
        if [ "$1" = "go language server error: 'no identifier found'" ]; then
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
