" -----------------------------------------------------------------------------
" Standard Vim settings
" -----------------------------------------------------------------------------

" Set runtime path on Windows installs; saves having to change .vimrc/.gvimrc
" filenames to Windows gVim defaults 
"if has('win32') || has('win64')
"	set runtimepath=$USERPROFILE/vimfiles,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$USERPROFILE/vimfiles/after
"endif

set rtp=$HOME/dotfiles/.vim/,$VIMRUNTIME,$VIM/vimfiles/after

"
" General settings
" -----------------------------------------------------------------------------
set nocompatible

" Vundle
filetype off " Required for Vundle init, switched back on later
set rtp+=~/dotfiles/.vim/bundle/Vundle.vim

call vundle#begin('~/dotfiles/.vim/bundle/')
Plugin 'scrooloose/syntastic'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'Shougo/neosnippet.vim'
Plugin 'Shougo/neosnippet-snippets'
Plugin 'majutsushi/tagbar'
Plugin 'chriskempson/base16-vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'jiangmiao/auto-pairs'

if has('macunix')
  Plugin 'fatih/vim-go'
  " Don't have Lua compiled into Vim on non-mac machines
  Plugin 'Shougo/neocomplete.vim'
endif

" Reminder of other plugins
"vim-ack
"vim-commentary
"vim-fugitive
"vim-colors-solarized
call vundle#end()

" Set new leader
let mapleader=","

" Allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Syntax highlighting
syntax enable

" Highlight searches & set incremental searching 
set hlsearch incsearch 

" Disable backups & swaps 
set nobackup
set noswapfile

" indent by multiples of tabstop
set shiftround

nnoremap j gj
nnoremap k gk
xnoremap j gj
xnoremap k gk

" Tree-style listing in netrw
let g:netrw_liststyle=3

"
" General UI settings
" -----------------------------------------------------------------------------
set number
set laststatus=2
set ruler
set tabstop=2
set shiftwidth=2
set expandtab
set cursorline

"
" Theme settings 
" -----------------------------------------------------------------------------
set background=dark
"colorscheme solarized
colorscheme base16-tomorrow

"
" CtrlP
" -----------------------------------------------------------------------------

" Bindings for main invocation & buffer mode
nmap <leader>p :CtrlP<CR>
nmap <leader>b :CtrlPBuffer<CR>
nmap <leader>m :CtrlPMRU<CR>CR

" Customise ctrlp to ignore various directories and files
let g:ctrlp_custom_ignore = {
	\ 'dir': '.git$\|node_modules',
	\ 'file': '\.exe$\|\\.so$\|\.dat$'
	\ }

"
" Vim-go 
" -----------------------------------------------------------------------------
filetype plugin indent on

let g:go_highlight_functions=1  
let g:go_highlight_methods=1  
let g:go_highlight_structs=1  
let g:go_highlight_operators=1
let g:go_highlight_interfaces=1
let g:go_highlight_build_constraints=1
let g:go_fmt_command="goimports"

"
" Vim-airline (Powerline equivalent, non-Python)
" -----------------------------------------------------------------------------

let g:airline_theme='base16'

" Remove default seperators
let g:airline_left_sep=''
let g:airline_right_sep=''

" Disable mode display, as it's part of the status bar in standard themes
set noshowmode

"
" Tagbar
" -----------------------------------------------------------------------------

" General UI config
let g:tagbar_left=1
let g:tagbar_width=30

" Configuration for Golang, using gotags
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }

autocmd VimEnter * nested :call tagbar#autoopen(1)
autocmd FileType * nested :call tagbar#autoopen(0)

" Show/hide tagbar with Ctrl-]
"noremap <leader>] :TagbarToggle<CR>

"
" Neocomplete
" -----------------------------------------------------------------------------
let g:neocomplete#enable_at_startup=1
" Close preview after selection
let g:neocomplete#enable_auto_close_preview=1

"
" Neosnippets 
" -----------------------------------------------------------------------------

" Use Tab to jump between placehoders
imap <Tab> <Plug>(neosnippet_expand_or_jump)
smap <Tab> <Plug>(neosnippet_expand_or_jump)
xmap <Tab> <Plug>(neosnippet_expand_target)
