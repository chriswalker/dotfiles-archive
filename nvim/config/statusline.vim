" -----------------------------------------------------------------------------
" Statusline config, sourceed from main init.vim 
" -----------------------------------------------------------------------------

" Set some colours based off of the theme
 hi User1 guibg=s:gray3 guifg=s:gray5
 hi User2 guibg='#323c4d' guifg='#b5a262'
 hi User3 guibg='#323c4d' guifg='#608cc3'

" Mode map lists mode code against [text output] and [fg] [bg]
let s:mode_map = {
  \  'n': { 'text': 'NORMAL', 'fg': '', 'bg': '' }, 
  \  'i': { 'text': 'INSERT', 'fg': '', 'bg': '' }, 
  \  'R': { 'text': 'REPLACE', 'fg': '', 'bg': '' }, 
  \  'v': { 'text': 'VISUAL', 'fg': '', 'bg': '' }, 
  \  'V': { 'text': 'V-LINE', 'fg': '', 'bg': '' }, 
  \  "\<C-v>": { 'text': 'V-BLOCK', 'fg': '', 'bg': '' }, 
  \  'c': { 'text': 'COMMAND', 'fg': '', 'bg': '' }, 
  \  's': { 'text': 'SELECT', 'fg': '', 'bg': '' }, 
  \  'S': { 'text': 'S-LINE', 'fg': '', 'bg': '' }, 
  \  "\<C-s>": { 'text': 'S-BLOCK', 'fg': '', 'bg': '' }, 
  \  't': { 'text': 'TERMINAL', 'fg': '', 'bg': '' }, 
\ }

function! StatuslineMode() abort
  let m = get(s:mode_map, mode(), '')
  return m['text']
endfunction

set statusline+=
" TODO - Colour modes!
set statusline+=\ %{StatuslineMode()}\ 
set statusline+=%{fugitive#head()}\ 
" TODO - Expand into func which checks if a file is open; displays nothing if
" not
set statusline+=%{expand('%:p:h')}/%3*%t%*
set statusline+=\ 
set statusline+=%3*%m%*
set statusline+=%=
set statusline+=\ 
set statusline+=%{&fileencoding?&fileencoding:&encoding}
set statusline+=\ 
set statusline+=\[%{&fileformat}\]
set statusline+=\ 
set statusline+=%p%%
set statusline+=\ 
set statusline+=%l:%c
set statusline+=\ 
