set nocompatible              " be iMproved, required
filetype off                  " required

" Line numbers
set nu

" Whitespace
set list
" set listchars=tab:\|\·
" set listchars=tab:\⇥\ ,
set listchars=tab:\⋮\ ,trail:·,extends:·,precedes:·


" size of a hard tabstop
set tabstop=4

" size of an indent
set shiftwidth=4

colo delek
" " set t_Co=256

filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab

func! WordProcessorMode()
	setlocal formatoptions=t1
	setlocal textwidth=80
	map j gj
	map k gk
	setlocal smartindent
	setlocal spell spelllang=en_us
	setlocal noexpandtab
endfu
com! WP call WordProcessorMode()
