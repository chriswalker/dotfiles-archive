" -----------------------------------------------------------------------------
" Standard Vim settings
" -----------------------------------------------------------------------------

"
" General settings
" -----------------------------------------------------------------------------
set nocompatible
set ttyfast
set lazyredraw
" Write files on make/GoBuild etc
set autowrite

" Set shell as login/interactive shell is fish, which causes problems for Vim
let s:uname = system("uname")
if s:uname =~ "Linux"
  set shell=/usr/bin/fish
elseif s:uname =~ "Darwin"
  set shell=/usr/local/bin/fish
endif

" Accept ^? as backspace char (allows remapping of C-h for moving to a left
" split) - NOTE: Must set up terminal emulator to emit ^? when backspace is
" pressed
set t_kb=

" vim-plug - handle required plugins
call plug#begin('~/.config/nvim/plugged')
" Ui & theming
Plug 'chriswalker/neodark.vim'
Plug 'itchyny/lightline.vim'
" Development
Plug 'airblade/vim-gitgutter'
Plug 'fatih/vim-go'
Plug 'elzr/vim-json'
Plug 'tpope/vim-fugitive'
Plug 'ekalinin/Dockerfile.vim'
Plug 'majutsushi/tagbar'
Plug 'tpope/vim-dispatch'
Plug 'radenling/vim-dispatch-neovim'
Plug 'w0rp/ale'
" Filetypes
Plug 'elzr/vim-json'
Plug 'cespare/vim-toml'
Plug 'stephpy/vim-yaml'
Plug 'dag/vim-fish'
" Misc
Plug 'SirVer/ultisnips'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-go', { 'do': 'make' }
Plug 'ervandew/supertab'
Plug 'junegunn/fzf', { 'dir': '~/.config/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'christoomey/vim-tmux-navigator'
" Reminder of other plugins I've used; just don't want to forget 'em
" 'chriskempson/base16-vim'
" 'morhetz/gruvbox'
" 'altercation/vim-colors-solarized'
"   vim-ack
"   vim-commentary
"   vim-easymotion
"   vim-colors-solarized
call plug#end()

" Speed up update interval 
set updatetime=100

" Set new leader
let mapleader=","

" Allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Highlight searches & set incremental searching 
set hlsearch incsearch 

" Disable backups & swaps 
set nobackup
set noswapfile

" indent by multiples of tabstop
set shiftround

" Tree-style listing in netrw
let g:netrw_liststyle=3

"
" Key (re)mappings
" -----------------------------------------------------------------------------

" Move up/down per terminal line, not file line (for wrapped lines)
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')
" Disable cursor keys in normal & insert mode
noremap <up> <nop>
noremap <down> <nop>
noremap <left> <nop>
noremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" Change window movement keys slightly
map <C-H> <C-W><C-H>
map <C-J> <C-W><C-J>
map <C-K> <C-W><C-K>
map <C-L> <C-W><C-L>
tnoremap <C-h> <C-\><C-N><C-w>h
tnoremap <C-j> <C-\><C-N><C-w>j
tnoremap <C-k> <C-\><C-N><C-w>k
tnoremap <C-l> <C-\><C-N><C-w>l

" Highlight terminal cursor differently to editing cursor
highlight TermCursor ctermfg=red guifg=red
set splitbelow
set splitright

" jj to ESC back to Normal mode; quicker than reaching for ESC 
inoremap jj <ESC>

" Alt-[jk] for move current line up/down (also in visual block mode)
nnoremap <A-j> :m+<CR>==
nnoremap <A-k> :m-2<CR>==
vnoremap <A-j> :m'>+<CR>gv=gv
vnoremap <A-k> :m-2<CR>gv=gv

" Alt-[hl] for indenting in and back (also in visual block mode)
nnoremap <A-h> <<
nnoremap <A-l> >>
vnoremap <A-h> <gv
vnoremap <A-l> >gv

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
" to red in neodark theme
call matchadd('Float', '\%101v.\+', 100)

"
" Theme settings 
" -----------------------------------------------------------------------------
set background=dark
let g:neodark#use_custom_terminal_theme = 1
let g:neodark#solid_vertsplit = 1
let g:neodark#user_256color = 1
let g:neodark#background = '#202020'
colorscheme neodark
syntax on
highlight Comment cterm=italic
highlight TermCursor ctermfg=red

"
" Markdown
" -----------------------------------------------------------------------------
autocmd BufNewFile,BufReadPost *.md set filetype=markdown
let g:markdown_fenced_languages = ['html', 'javascript', 'go', 'bash=sh']

"
" Vim-go 
" -----------------------------------------------------------------------------
let g:go_highlight_functions=1  
let g:go_highlight_methods=0  
let g:go_highlight_structs=1  
let g:go_highlight_operators=0
let g:go_highlight_interfaces=1
let g:go_highlight_build_constraints=1
let g:go_fmt_command="goimports"
let g:go_auto_sameids=1
let g:go_metalinter_autosave=1
let g:go_auto_type_info=1
"let g:go_snippet_engine='neosnippet'
let g:go_list_height=10
"let g:go_list_type="quickfix"
"let g:go_fmt_fail_silently=1

" Map <leader>t to GoTest
autocmd FileType go nmap <leader>t  <Plug>(go-test)
" Map <leader>c to GoCoverageToggle
autocmd FileType go nmap <leader>c  <Plug>(go-coverage-toggle)
" Map <leader>a to GoAlternate
autocmd FileType go nmap <leader>a  <Plug>(go-alternate) 

let g:go_metalinter_enabled = ['vet', 'golint', 'gosimple', 'errcheck']

"
" lightline 
" -----------------------------------------------------------------------------
let g:lightline = {
  \ 'colorscheme': 'neodark',
  \ 'active': {
  \    'left': [ ['mode', 'paste'],
  \              ['gitbranch', 'readonly', 'filename', 'modified'] ]
  \  },
  \  'component_function': {
  \    'gitbranch': 'fugitive#head'
  \  },
  \ }

" Disable mode display, as it's part of the status bar in standard themes
set noshowmode

"
" Tagbar
" -----------------------------------------------------------------------------
"nmap <leader>b :TagbarToggle<CR>

" General UI config
let g:tagbar_left=1

if s:uname =~ "Darwin"
  let s:tagbar_width = 35
elseif s:uname =~ "Linux"
  " Probably on DO droplet
  let s:tagbar_width = 25
endif
let g:tagbar_width = s:tagbar_width

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

"
" Deoplete
" -----------------------------------------------------------------------------
let g:deoplete#enable_at_startup = 1
let g:deoplete#max_list = 10
let g:deoplete#max_menu_width = 20

" Switch tab ordering, so from top of completion list down; map to tab/shift-tab


"
" Deoplete-go
" -----------------------------------------------------------------------------
let g:deoplete#sources#go#gocode_binary=$GOPATH.'/bin/gocode'

"
" Neosnippets 
" -----------------------------------------------------------------------------
" Use Tab to jump between placehoders
"imap <Tab> <Plug>(neosnippet_expand_or_jump)
"smap <Tab> <Plug>(neosnippet_expand_or_jump)
"xmap <Tab> <Plug>(neosnippet_expand_target)

"
" ale
" -----------------------------------------------------------------------------
" Error and warning signs.
"let g:ale_sign_error = 'X'
"let g:ale_sign_warning = '!'

" Enable integration with airline.
let g:airline#extensions#ale#enabled = 1

"
" fzf-vim
" -----------------------------------------------------------------------------
imap <c-x><c-o> <plug>(fzf-complete-line)
map <leader>b :Buffers<cr>
map <leader>f :Files<cr>
map <leader>g :GFiles<cr>
"map <leader>t :Tags<cr>

let g:fzf_layout = { 'down': '~20%' }

" Customize fzf colors to match neodark theme
let g:fzf_colors = {
      \ 'bg':          ['bg', 'CursorLine'],
      \ 'bg+':         ['bg', 'CursorLine'],
      \ 'info':        ['fg', 'Keyword'],
      \ 'prompt':      ['fg', 'Function', 'Bold'],
      \ 'marker':      ['fg', 'Float', 'Bold'],
      \ 'hl':          ['fg', 'Float', 'Bold'],
      \ 'hl+':         ['fg', 'Float', 'Bold'],
      \ 'header':      ['bg', 'CursorLine']
\ }
