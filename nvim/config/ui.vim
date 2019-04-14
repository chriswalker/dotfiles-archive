" -----------------------------------------------------------------------------
" General UI and theme config
" -----------------------------------------------------------------------------

"
" General UI settings
" -----------------------------------------------------------------------------
set number
set relativenumber
autocmd InsertEnter * :set number
autocmd InsertLeave * :set relativenumber
set laststatus=2
set ruler
set tabstop=2
set shiftwidth=2
set expandtab
set cursorline
set fillchars+=vert:\ 

" Highlight all chars past col 100 to encourage line breaks; "Float" defaults
" to red in theme
"call matchadd('Float', '\%101v.\+', 100)
set colorcolumn=100

" Folding
set foldmethod=indent
set foldnestmax=1

" Force truecolour
let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"

"
" Theme settings 
" -----------------------------------------------------------------------------
set background=dark
set termguicolors

" OneDark overrides

" let s:dark_grey = { "bg": { "gui": "#2C323C" } }
" let s:italic = { "gui": "italic" }

" augroup colorextend
"   autocmd!
"   " autocmd ColorScheme * call onedark#extend_highlight("StatusLine", { "bg": { "gui": "#4B5263" } })
"   autocmd ColorScheme * call onedark#extend_highlight("VertSplit", s:dark_grey)
"   " autocmd ColorScheme * call onedark#extend_highlight("LineNr", { "bg": { "gui": "#2C323C" } })
"   " autocmd ColorScheme * call onedark#extend_highlight("CursorLineNr", { "bg": { "gui": "#2C323C" } })
"   " autocmd ColorScheme * call onedark#extend_highlight("FoldColumn", { "bg": { "gui": "#2C323C" } })
"   " autocmd ColorScheme * call onedark#extend_highlight("SignColumn", { "bg": { "gui": "#2C323C" } })
"   " autocmd ColorScheme * call onedark#extend_highlight("SignifySignAdd", { "bg": { "gui": "#2C323C" } })
"   " autocmd ColorScheme * call onedark#extend_highlight("SignifySignChange", { "bg": { "gui": "#2C323C" } })
"   " autocmd ColorScheme * call onedark#extend_highlight("SignifySignDelete", { "bg": { "gui": "#2C323C" } })

"   autocmd ColorScheme * call onedark#extend_highlight("Statement", s:italic)
"   autocmd ColorScheme * call onedark#extend_highlight("Repeat", s:italic)
"   autocmd ColorScheme * call onedark#extend_highlight("Label", s:italic)
"   autocmd ColorScheme * call onedark#extend_highlight("Conditional", s:italic)
"   autocmd ColorScheme * call onedark#extend_highlight("Folded", s:italic)
"   autocmd ColorScheme * call onedark#extend_highlight("Define", s:italic)
" augroup END

" let g:onedark_terminal_italics=1
"let g:nord_uniform_status_lines=1
let g:nord_italic_comments=1
let g:nord_underline=1
let g:nord_italic = 1
let g:nord_cursor_line_number_background = 1
colorscheme nord

syntax on
highlight Comment cterm=italic
highlight TermCursor ctermfg=red
