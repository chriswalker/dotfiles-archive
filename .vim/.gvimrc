"
" General settings for graphical versions
"

" Set preferred font
if has('win32') || has('win64')
	set gfn=Ubuntu\ Mono:h12
else
	" On macs
	set gfn=Ubuntu\ Mono:h15
endif

" Show tabs and menu, but disable everything else
set guioptions=et
