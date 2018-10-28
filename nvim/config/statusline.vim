" -----------------------------------------------------------------------------
" Statusline config
" -----------------------------------------------------------------------------

" Disable display of mode in command line; mode displayed in statusline
set noshowmode

" Colours taken from the colorscheme's colors/[theme].vim file
" NORMAL mode
 hi User1 guibg='#608cc3' guifg='#232936'
 " INSERT
 hi User2 guibg='#709d6c' guifg='#232936'
 " REPLACE
 hi User3 guibg='#b15e7c' guifg='#232936'
 " VISUAL/V-LINE/V-BLOCK
 hi User4 guibg='#b3785d' guifg='#232936'
 " COMMAND
 hi User5 guibg='#8f72bf' guifg='#232936'
 " Current filename
 hi User6 guibg='#323c4d' guifg='#b5a262'
 " Modified
 hi User7 guibg='#323c4d' guifg='#608cc3'

" Mode map lists mode code against [text output] a highlight group above for
" fg/bg colours
let s:mode_map = {
  \  'n':      { 'text': 'NORMAL',  'hi': '1' },
  \  'i':      { 'text': 'INSERT',  'hi': '2' },
  \  'R':      { 'text': 'REPLACE', 'hi': '3' },
  \  'v':      { 'text': 'VISUAL',  'hi': '4' },
  \  'V':      { 'text': 'V-LINE',  'hi': '4' },
  \  "\<C-v>": { 'text': 'V-BLOCK', 'hi': '4' },
  \  'c':      { 'text': 'COMMAND', 'hi': '5' },
\ }

function! StatuslineMode() abort
  let m = get(s:mode_map, mode(), '')
  return printf('%%%s* %s %%*', m['hi'], m['text'])
endfunction

function! Filepath() abort
  let path = expand('%:.:h')
  let filename = expand('%:t')
  return len(l:filename) > 0 ? printf('%s/%%6*%s%%*', path, filename) : '[No file]'
endfunction

function! GitBranch() abort
  let branch = fugitive#head()
  return len(branch) > 0 ? printf('[%s]', branch) : ''
endfunction

" Generates the statusline string, based on the mode
function! GenerateStatusLine(mode) abort
  let line = ''

  if a:mode ==# 'active'
    let line .= StatuslineMode()
    let line .= ' '
    let line .= GitBranch()
    let line .= ' '
    let line .= Filepath()
    let line .= ' %7*%m%*'

    let line .='%='

    let line .= '%p%%'
    let line .= ' '
    let line .= 'Ln %l/%L, Col %c '
  else
    let line .= ' %f'
  endif

  return line
endfunction

augroup MyStatusLine
  autocmd!
  autocmd WinEnter * setl statusline=%!GenerateStatusLine('active')
  autocmd WinLeave * setl statusline=%!GenerateStatusLine('inactive')
  if exists('#TextChangedI')
    autocmd BufWinEnter,BufWritePost,FileWritePost,TextChanged,TextChangedI,WinEnter,InsertEnter,InsertLeave,CmdWinEnter,CmdWinLeave,ColorScheme * setl statusline=%!GenerateStatusLine('active')
  else
    autocmd BufWinEnter,BufWritePost,FileWritePost,WinEnter,InsertEnter,InsertLeave,CmdWinEnter,CmdWinLeave,ColorScheme * setl statusline=%!GenerateStatusLine('active')
  endif
augroup END
