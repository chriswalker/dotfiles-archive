# -----------------------------------------------------------------------------
# Plugin configuration.
# -----------------------------------------------------------------------------

# Load plug.kak before doing anything else
source "%val{config}/plugins/plug.kak/rc/plug.kak"

# auto-pairs (insert closing parentheses & braces automatically)
# -----------------------------------------------------------------------------
# Disabled for the moment, as auto-pairs been subsumed into kakoune.cr :angry face:
# plug "alexherbo2/auto-pairs.kak"

# If we're running inside a toolbox container, initialise dev-related
# plugins
hook global GlobalSetOption in_toolbox=true %{

    # kak-lsp (Language Server Protocol client)
    # -----------------------------------------------------------------------------
    plug "kak-lsp/kak-lsp" %{
        # TODO debug - uncomment if diagnosing LSP issues
        # eval %sh{echo ${kak_opt_lsp_cmd} >> /tmp/kak-lsp.log}
        # set global lsp_cmd "kak-lsp -s %val{session} -vvv --log /tmp/kak-lsp.log"
        # TODO debug

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

            # Run goimports for formatting
            hook buffer BufWritePre .* %{
                go-format -use=goimports
                lint
            }

            # Override References face
            set-face global Reference yellow+b
        }

        # Make the hover stuff suck less; supress the "no object found" info box
        define-command -override -hidden lsp-show-error -params 1 -docstring "Render error (suppress useless gopls errors)" %{
            evaluate-commands %sh{
                if [ "$1" = "go language server error: 'no object found'" ]; then
                    exit 0
                fi
                echo 'info %arg{1}'
            }

        }
    }

    # golang.kak - additional Go-related functionality
    # -----------------------------------------------------------------------------
    plug "chriswalker/golang.kak" %{
        # Override some highlighters
        set-face global Uninstrumented 'rgb:616e88'
    }
}

