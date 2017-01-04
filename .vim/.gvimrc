"
" General settings for graphical versions
"

" Set preferred font
if has('win32') || has('win64')
	set gfn=Hack:h12
else
	" On macs
	set gfn=Hack:h13
endif

" Show tabs and menu, but disable everything else
set guioptions=et
