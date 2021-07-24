# -----------------------------------------------------------------------------
# modeline.kak - formatting the status line
# -----------------------------------------------------------------------------

# set-option window modelinefmt '{StatusFileName}%val{bufname} {Default}%val{cursor_line}:%val{cursor_char_column} {{context_info}} {{mode_info}} - %val{client}@%val{session}'

# Add Toolbox name and Git branch to statusline
# -----------------------------------------------------------------------------

declare-option -docstring "name of the git branch holding the current buffer" \
    str modeline_git_branch
    
hook global WinCreate .* %{
    hook window NormalIdle .* %{
        evaluate-commands %sh{
            branch=$(cd "$(dirname "${kak_buffile}")" && git rev-parse --abbrev-ref HEAD 2>/dev/null)
            if [ -n "${branch}" ]; then
                printf 'set window modeline_git_branch %%{%s}' "${branch}"
            fi
        }
    }
}

hook global WinCreate .* %{
    evaluate-commands %sh{
        is_work_tree=$(cd "$(dirname "${kak_buffile}")" && git rev-parse --is-inside-work-tree 2>/dev/null)
        if [ "${kak_opt_in_toolbox}" = 'true' ]; then
            printf 'set-face global StatusLine rgb:b48ead,rgb:3b4252+b\n'
            printf 'set-face global Prompt rgb:b48ead,rgb:3b4252+b\n'
        fi
        if [ "${is_work_tree}" = 'true' ]; then
            printf 'set-option window modelinefmt %%{%s}' " %opt{modeline_git_branch} ${kak_opt_modelinefmt}"
        fi
    }
}
