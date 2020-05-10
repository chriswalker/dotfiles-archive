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

# kak-lsp mappings
# -----------------------------------------------------------------------------
 
# Show implementations
# map -docstring "LSP - Show implementations" global user i :lsp-implementation<ret>
# map -docstring "LSP - Enter lsp user mode" global user l :enter-user-mode lsp<ret>

# Go-specific mappings
# -----------------------------------------------------------------------------

# Switch to alterntive file (e.g. foo.go to foo_test.go)
map -docstring "Go - Switch to alternate file" global user a :go-alternate<ret>
# Run Go tests via <leader>-t
map -docstring "Go - Run tests in current package" global user t :go-test<ret>
# Show godoc for symbol under cursor
map -docstring "Go - Display godoc for symbol under cursor" global user d :go-doc-info<ret>
