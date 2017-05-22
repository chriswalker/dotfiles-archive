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
set shell=/bin/bash

" Accept ^? as backspace char (allows remapping of C-h for moving to a left
" split) - NOTE: Must set up terminal emulator to emit ^? when backspace is
" pressed
set t_kb=

" vim-plug - handle required plugins
call plug#begin('~/.config/nvim/plugged')
Plug 'neomake/neomake'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'majutsushi/tagbar'
Plug 'chriskempson/base16-vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-fugitive'
" Experimental, may switch to fzf
"Plug 'junegunn/fzf', { 'dir': '~/.config/.fzf', 'do': './install --all' }
"Plug 'junegunn/fzf.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'wincent/terminus'
Plug 'dag/vim-fish'
Plug 'ekalinin/Dockerfile.vim'
Plug 'fatih/vim-go'
Plug 'elzr/vim-json'
Plug 'christoomey/vim-tmux-navigator'
Plug 'airblade/vim-gitgutter'
" Reminder of other plugins I've used; just don't want to forget 'em
"   vim-ack
"   vim-commentary
"   vim-easymotion
"   vim-fugitive
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

" 'Print' column at 80 chars
set colorcolumn=80

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

" Statusline formatting experiments
"set statusline=
"set statusline+=%#PmenuSel#
"set statusline+=\ %{fugitive#head()}\  
"set statusline+=%#LineNr#
"set statusline+=\ %f
"set statusline+=%m\
"set statusline+=%=
"set statusline+=%#CursorColumn#
"set statusline+=\ %y
"set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
"set statusline+=\[%{&fileformat}\]
"set statusline+=\ %p%%
"set statusline+=\ %l:%c
"set statusline+=\
"
" Markdown
" -----------------------------------------------------------------------------
autocmd BufNewFile,BufReadPost *.md set filetype=markdown
let g:markdown_fenced_languages = ['html', 'javascript', 'go', 'bash=sh']

"
" JavaScript
" -----------------------------------------------------------------------------
autocmd bufwritepost *.js silent !standard --fix %
set autoread

"let g:vim_json_syntax_conceal = 0

"
" Theme settings 
" -----------------------------------------------------------------------------
set background=dark
colorscheme base16-default-dark

"
" CtrlP
" -----------------------------------------------------------------------------

" Bindings for main invocation & buffer mode
nmap <leader>p :CtrlP<CR>
nmap <leader>b :CtrlPBuffer<CR>
nmap <leader>m :CtrlPMRU<CR>

" Customise ctrlp to ignore various directories and files
let g:ctrlp_custom_ignore = {
	\ 'dir': '\.git$\|node_modules\|dist\|bin',
	\ 'file': '\.exe$\|\\.so$\|\.dat$'
	\ }

"
" Vim-go 
" -----------------------------------------------------------------------------
if has('macunix')
  let g:go_highlight_functions=1  
  let g:go_highlight_methods=1  
  let g:go_highlight_structs=1  
  let g:go_highlight_operators=1
  let g:go_highlight_interfaces=1
  let g:go_highlight_build_constraints=1
  let g:go_fmt_command="goimports"
  let g:go_auto_sameids=1
  let g:go_metalinter_autosave=1
  let g:go_auto_type_info=1
  let g:go_snippet_engine='neosnippet'
  let g:go_list_height=10
  "let g:go_list_type="quickfix"
  "let g:go_fmt_fail_silently=1

  " Map <leader>t to GoTest
  autocmd FileType go nmap <leader>t  <Plug>(go-test)
  " Map <leader>c to GoCoverageToggle
  autocmd FileType go nmap <leader>c  <Plug>(go-coverage-toggle)
  " Map <leader>a to GoAlternate
  autocmd FileType go nmap <leader>a  <Plug>(go-alternate)
endif

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

nmap <leader>b :TagbarToggle<CR>

" General UI config
let g:tagbar_left=1
let g:tagbar_width=40

if has('macunix')
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

  " JS picked up automatically by tagbar, using jsctags
endif

"autocmd VimEnter * nested :call tagbar#autoopen(1)
"autocmd FileType * nested :call tagbar#autoopen(0)

"
" Neocomplete
" -----------------------------------------------------------------------------
"if has('macunix')
"  let g:neocomplete#enable_at_startup=1
  " Close preview after selection
"  let g:neocomplete#enable_auto_close_preview=1
"endif 

"
" Deoplete
" -----------------------------------------------------------------------------
let g:deoplete#enable_at_startup = 1

"
" Neosnippets 
" -----------------------------------------------------------------------------

" Use Tab to jump between placehoders
imap <Tab> <Plug>(neosnippet_expand_or_jump)
smap <Tab> <Plug>(neosnippet_expand_or_jump)
xmap <Tab> <Plug>(neosnippet_expand_target)

"
" Syntastic
" -----------------------------------------------------------------------------
" Below not needed if using vim-airline, as it uses syntastic_stl_format by
" default
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

"let g:syntastic_always_populate_loc_list=1
"let g:syntastic_auto_loc_list=0
"let g:syntastic_check_on_open=1
"let g:syntastic_check_on_wq=1
"let g:syntastic_aggregate_errors=1
"let g:syntastic_enable_signs = 1

"let g:syntastic_go_checkers=['golint', 'govet', 'errcheck']
"let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }

" Add Standard JS checking
"let g:syntastic_javascript_checkers=['standard']

"
" Neomake
" -----------------------------------------------------------------------------
" Run neomake on buffer save - TODO: Tweak, don't need on *every* filetype
autocmd! BufWritePost * Neomake

"
" vim-easymotion
" -----------------------------------------------------------------------------
" Map bi-di highlighting to s
nmap s <Plug>(easymotion-s2)

"
" fzf-vim
" -----------------------------------------------------------------------------
" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

" Advanced customization using autoload functions
inoremap <expr> <c-x><c-k> fzf#vim#complete#word({'left': '15%'})
