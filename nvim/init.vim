" -----------------------------------------------------------------------------
" Standard Vim settings
" -----------------------------------------------------------------------------

" Catch system name for selecting config based on OS
function! GetOS()
  return system('uname')
endfunction

"
" vim-plug - handle required plugins
" ----------------------------------------------------------------------------
call plug#begin('~/.config/nvim/plugged')
" UI & theming
Plug 'arcticicestudio/nord-vim'
" Development
Plug 'airblade/vim-gitgutter'
Plug 'fatih/vim-go'
Plug 'sebdah/vim-delve'
Plug 'tpope/vim-fugitive'
" Plug 'majutsushi/tagbar'
Plug 'liuchengxu/vista.vim'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-commentary'
Plug 'radenling/vim-dispatch-neovim'
" Filetypes
" Plug 'elzr/vim-json'
Plug 'stephpy/vim-yaml'
Plug 'dag/vim-fish'
Plug 'ekalinin/Dockerfile.vim'
" Misc
Plug 'tpope/vim-surround'
Plug 'SirVer/ultisnips'
" Plug 'Shougo/deoplete.nvim'
Plug 'ervandew/supertab'
Plug 'junegunn/fzf', { 'dir': '~/.config/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'christoomey/vim-tmux-navigator'
call plug#end()

"
" General settings
" -----------------------------------------------------------------------------
" Set shell as login/interactive shell is fish, which causes problems for Vim
if GetOS() =~ "Linux"
  set shell=/usr/bin/fish
elseif GetOS() =~ "Darwin"
  set shell=/usr/local/bin/fish
endif

" Only redraw screen under certain conditions (see :help lazyredraw)
set lazyredraw

" Accept ^? as backspace char (allows remapping of C-h for moving to a left
" split) - NOTE: Must set up terminal emulator to emit ^? when backspace is
" pressed
set t_kb=

" Write files on make/GoBuild etc
set autowrite

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

" Display completion menu if only one option, don't automatically insert
set completeopt+=menuone,noinsert
" Invoke omni on pressing '.' in go files
au filetype go inoremap <buffer> . .<C-x><C-o>

"
" Load other config files
" -----------------------------------------------------------------------------
source $HOME/.config/nvim/config/keybindings.vim
source $HOME/.config/nvim/config/ui.vim
source $HOME/.config/nvim/config/statusline.vim
source $HOME/.config/nvim/config/plugins.vim
