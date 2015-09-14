call plug#begin('~/.vim/plugged')
Plug 'itchyny/lightline.vim'
Plug 'chriskempson/base16-vim'
call plug#end()

set noshowmode
set laststatus=2

syntax on
set mouse=a
set number
set relativenumber

set noexpandtab
set softtabstop=0
set shiftwidth=4
set tabstop=4

set modeline

set background=dark
colorscheme base16-monokai

set cursorline
hi linenr ctermfg=green ctermbg=black
hi cursorline ctermfg=white ctermbg=red
hi cursorlinenr ctermfg=white ctermbg=red

