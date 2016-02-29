set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')

Plugin 'VundleVim/Vundle.vim'
Plugin 'morhetz/gruvbox'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to 
" auto-approve removal

" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

set wildmenu
filetype off
syntax on
set mouse=a
set showcmd
set t_Co=256 

set background=dark
set laststatus=2
colo desert

" set listchars=tab:\|\·
" set listchars=tab:\⇥\ ,
 set listchars=tab:\⋮\ ,trail:·,extends:·,precedes:·


set nu " Line numbers
set list " Whitespace
set tabstop=4 " size of a hard tabstop
set shiftwidth=4 " size of an indent
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

