" -----------------------------------------------------------------------------
" Plugin config
" -----------------------------------------------------------------------------

"
" Markdown
" -----------------------------------------------------------------------------
autocmd BufNewFile,BufReadPost *.md set filetype=markdown
let g:markdown_fenced_languages = ['html', 'javascript', 'go', 'bash=sh']

"
" Vim-go 
" -----------------------------------------------------------------------------
let g:go_highlight_functions=1  
let g:go_highlight_format_strings = 1
let g:go_highlight_build_constraints=1
let g:go_highlight_variable_declarations = 1
let g:go_highlight_variable_assignments = 1
let g:go_fmt_command="goimports"
let g:go_auto_sameids=1
" let g:go_metalinter_autosave=1
let g:go_auto_type_info=1
let g:go_list_height=10
let g:go_def_mapping_enabled=0
"let g:go_list_type="quickfix"
"let g:go_fmt_fail_silently=1

" Map <leader>t to GoTest
autocmd FileType go nmap <leader>t  <Plug>(go-test)
" Map <leader>c to GoCoverageToggle
autocmd FileType go nmap <leader>c  <Plug>(go-coverage-toggle)
" Map <leader>a to GoAlternate
autocmd FileType go nmap <leader>a  <Plug>(go-alternate) 

"let g:go_metalinter_enabled = ['vet', 'golint', 'gosimple', 'errcheck']

let g:go_def_mapping_enabled=1
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'

"
" Tagbar
" -----------------------------------------------------------------------------
nmap <leader>b :TagbarToggle<CR>

" General UI config
let g:tagbar_left=1

if GetOS() =~ "Darwin"
  let s:tagbar_width = 35
elseif GetOS() =~ "Linux"
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
let g:ale_sign_error = '▶▶'
let g:ale_sign_warning = '▶▶'
let g:ale_sign_column_always = 1
let g:ale_lint_on_text_changed = 'always'

"
" fzf-vim
" -----------------------------------------------------------------------------
imap <c-x><c-o> <plug>(fzf-complete-line)
map <leader>b :Buffers<cr>
map <leader>f :Files<cr>
map <leader>g :GFiles<cr>
"map <leader>q :Tags<cr>
map <leader>rg :Rg<CR>
noremap <silent> <leader>grc :Commits<CR>
noremap <silent> <leader>gbc :BCommits<CR>


let g:fzf_layout = { 'down': '~20%' }

" Customize fzf colors to match theme
let g:fzf_colors = {
      \ 'bg':          ['bg', 'CursorLine'],
      \ 'bg+':         ['bg', 'CursorLine'],
      \ 'info':        ['fg', 'String'],
      \ 'prompt':      ['fg', 'Function', 'Bold'],
      \ 'marker':      ['fg', 'Float', 'Bold'],
      \ 'hl':          ['fg', 'Float', 'Bold'],
      \ 'hl+':         ['fg', 'Float', 'Bold'],
      \ 'header':      ['bg', 'CursorLine']
\ }

autocmd! FileType fzf
autocmd  FileType fzf set laststatus=0 noruler
  \| autocmd BufLeave <buffer> set laststatus=2 ruler

" Files command with preview window
command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

"
" gitgutter
" -----------------------------------------------------------------------------
let g:gitgutter_sign_added = '┃'
let g:gitgutter_sign_modified = '┃'
let g:gitgutter_sign_removed = '┃'

"
" Deoplete
" -----------------------------------------------------------------------------
"  let g:deoplete#enable_at_startup = 1
"  let g:deoplete#max_list = 10
"  let g:deoplete#max_menu_width = 20

