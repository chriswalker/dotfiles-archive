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
" to red in deepspace theme
call matchadd('Float', '\%101v.\+', 100)

" Folding
set foldmethod=indent
set foldnestmax=1

"
" Theme settings 
" -----------------------------------------------------------------------------
set background=dark
" Force truecolour
let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
set termguicolors
let g:orbital_italics=1
colorscheme orbital
syntax on
highlight Comment cterm=italic
highlight TermCursor ctermfg=red
