# -----------------------------------------------------------------------------
# Plugin configuration.
# -----------------------------------------------------------------------------

# Load plug.kak before doing anything else
source "%val{config}/plugins/plug.kak/rc/plug.kak"

# fzf
# -----------------------------------------------------------------------------
plug "andreyorst/fzf.kak" %{
    map -docstring "fzf - Files" global user f ': fzf-mode<ret>f<ret>'
    # TODO
    map -docstring "fzf - tags" global user g ': fzf-mode<ret>t<ret>'
    # map -docstring "fzf - Git files" global user r ': fzf-mode<ret>g<ret>'
} defer fzf %{
    set-option global fzf_file_command 'rg'
    # set-option global fzf_tmux_height 20
    set-option global fzf_preview_tmux_height 40%
    set-option global fzf_highlight_command 'bat --theme=Nord --color=always {}'
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

  	lint-enable
	
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

# auto-pairs (insert closing parentheses & braces automatically)
# -----------------------------------------------------------------------------
plug "alexherbo2/auto-pairs.kak"

#
# Tagbar
# -----------------------------------------------------------------------------

# plug "andreyorst/tagbar.kak" defer "tagbar" %{
#     set-option global tagbar_sort false
#     set-option global tagbar_size 30
#     set-option global tagbar_display_anon false
# } config %{
#     # if you have wrap highlighter enamled in you configuration
#     # files it's better to turn it off for tagbar, using this hook:
#     hook global WinSetOption filetype=tagbar %{
#         remove-highlighter window/wrap
#         # you can also disable rendering whitespaces here, line numbers, and
#         # matching characters
#     }
# }

# golang.kak - additional Go-related functionality
# -----------------------------------------------------------------------------
plug "chriswalker/golang.kak" %{
	# Override some highlighters
	set-face global Uninstrumented 'rgb:616e88'
}
