# -----------------------------------------------------------------------------
# Keyboard mappings - general + golang-specific.
# -----------------------------------------------------------------------------

# General mappings
# -----------------------------------------------------------------------------

# Comment out lines
map -docstring "comment/uncomment selection (<c-/>)" global normal '' ': comment-line<ret>'

# Splits (opens up new tmux pane)
map -docstring "Split horizontal" global user h :tmux-terminal-vertical<space>kak<space>c<space>%val{session}<ret>
map -docstring "Split vertical" global user v :tmux-terminal-horizontal<space>kak<space>c<space>%val{session}<ret>

# jj to escape
hook global InsertChar j %{ 
    try %{
        exec -draft hH <a-k>jj<ret> d
        exec <esc>
    }
}

# Use tab/shift-tab to cycle through completion results
hook global InsertCompletionShow .* %{
    map window insert <tab> <c-n>; map window insert <s-tab> <c-p>
}
hook global InsertCompletionHide .* %{
    unmap window insert <tab> <c-n>; unmap window insert <s-tab> <c-p>
} 

# See:
# https://github.com/mawww/kakoune/wiki/Selections#how-to-make-x-select-lines-downward-and-x-select-lines-upward
define-command -params 1 extend-line-down %{
    exec "<a-:>%arg{1}X"
}
define-command -params 1 extend-line-up %{
    exec "<a-:><a-;>%arg{1}K<a-;>"
    try %{
        exec -draft ';<a-K>\n<ret>'
        exec X
    }
    exec '<a-;><a-X>'
}
# nx selected n lines down
map global normal x ':extend-line-down %val{count}<ret>'
# nX select n lines above
map global normal X ':extend-line-up %val{count}<ret>'

# kak-lsp mappings
# -----------------------------------------------------------------------------
 
# Show implementations
map -docstring "LSP - Show implementations" global user i :lsp-implementation<ret>
# Show references
map -docstring "LSP - Show references" global user r :lsp-references<ret>
# Switch to LSP user mode
map -docstring "LSP - Enter LSP user mode" global user l :enter-user-mode<space>lsp<ret>

# Go-specific mappings (Go functionality under construction)
# -----------------------------------------------------------------------------

# Switch to alterntive file (e.g. foo.go to foo_test.go)
map -docstring "Go - Switch to alternate file" global user a :go-alternate<ret>
# Run Go tests via <leader>-t
map -docstring "Go - Run tests in current package" global user t :go-test<ret>
# Show godoc for symbol under cursor
map -docstring "Go - Display godoc for symbol under cursor" global user d :go-doc-info<ret>
map -docstring "Go - Display coverage for current file" global user c :go-coverage<ret>
