set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are the plugin you added.
Plugin 'Valloric/YouCompleteMe'

Plugin 'morhetz/gruvbox'

Plugin 'scrooloose/nerdtree'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"
let g:ycm_server_python_interpreter='/usr/bin/python3'
let g:ycm_global_ycm_extra_conf='~/.vim/.ycm_extra_conf.py'

colorscheme gruvbox 

set bg=dark   "backgroudclor
set number        "show number of line
set autoindent 
set cindent
set smartindent
set tabstop=4
set expandtab
set softtabstop=4
set shiftwidth=4
set backspace=2
set showmatch
set showmode
set guifont=Monaco:h17
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}
set laststatus=2 
set ma
set cursorline
set wrap
set linebreak
set ruler
set hlsearch
set incsearch
set ignorecase
set spell spelllang=en_us
set visualbell
set noerrorbells
set history=1000
filetype indent on


""""" new file title
""""" auto insert file header for *.c, *.sh, *.cpp *.py
autocmd BufNewFile *.cpp,*.c,*.sh call SetTitle()
func SetTitle() 
	if &filetype == 'sh' 
		call setline(1,"\#########################################################################") 
		call append(line("."), "\# Author: Li Liao") 
		call append(line(".")+1, "\# Mail: liliaow567@gmail.com") 
		call append(line(".")+2, "\# Created Time: ".strftime("%Y-%m-%d %H:%M:%S")) 
		call append(line(".")+3, "\# Description: ")
		call append(line(".")+4, "\#########################################################################") 
		call append(line(".")+5, "\#!/bin/bash") 
		call append(line(".")+6, "") 
	endif
	if &filetype == 'cpp'
		call setline(1, "/*************************************************************************") 
		call append(line("."), "    > Author: Li Liao")
		call append(line(".")+1, "    > Mail: liliaow567@gmail.com ") 
		call append(line(".")+2, "    > Created Time: ".strftime("%Y-%m-%d %H:%M:%S")) 
		call append(line(".")+3, "    > Description: ")
		call append(line(".")+4, " ************************************************************************/") 
		call append(line(".")+5, "")
		call append(line(".")+6, "#include<iostream>")
		call append(line(".")+7, "using namespace std;")
		call append(line(".")+8, "")
	endif
	if &filetype == 'c'
		call setline(1, "/*************************************************************************") 
		call append(line("."), "    > Author: Li Liao") 
		call append(line(".")+1, "    > Mail: liliaow567@gmail.com ") 
		call append(line(".")+2, "    > Created Time: ".strftime("%Y-%m-%d %H:%M:%S")) 
		call append(line(".")+3, "    > Description: ")
		call append(line(".")+4, " ************************************************************************/") 
		call append(line(".")+5, "")
		call append(line(".")+6, "include<stdio.h>")
		call append(line(".")+7, "")
	endif

	normal G
	normal o
endfunc 

autocmd BufNewFile *.py call SetPYTitle()
func SetPYTitle() 
    call setline(1, "\#!/usr/bin/python3")
    call setline(2, "\# -*- coding=utf8 -*-")
	call setline(3, "\"\"\"")
	call setline(4, "\# @Author : Li Liao")
	call setline(5, "\# @Mail : liliaow567@gmail")
	call setline(6, "\# @Created Time : ".strftime("%Y-%m-%d %H:%M:%S"))
	call setline(7, "\# @Description : ")
	call setline(8, "\"\"\"")
	call setline(9, "")
    normal G
	normal o
endfunc

autocmd BufNewFile *.h call SetHTitle()
func SetHTitle() 
    call setline(1, "/*************************************************************************") 
	call append(line("."), "    > Author: Li Liao") 
	call append(line(".")+1, "    > Mail: liliaow567@gmail.com ") 
	call append(line(".")+2, "    > Created Time: ".strftime("%Y-%m-%d %H:%M:%S")) 
	call append(line(".")+3, "    > Description: ")
	call append(line(".")+4, " ************************************************************************/") 
	call append(line(".")+5, "")
    normal G
	normal o
endfunc

autocmd vimenter * NERDTree 
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
map <C-n> :NERDTreeToggle<CR>
" NERDTress File highlighting
" function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
"  exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='.
"  a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
"   exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'.
"   a:extension .'$#'
"   endfunction
"
"   call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
"   call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
"   call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
"   call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
"   call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow',
"   '#151515')
"   call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
"   call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
"   call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
"   call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
"   call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
"   call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
"   call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
"   call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')




