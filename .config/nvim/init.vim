call plug#begin('~/.config/nvim/plugged')
Plug 'itchyny/lightline.vim'
Plug 'chriskempson/base16-vim'
Plug 'tpope/vim-fugitive'
Plug 'Shougo/unite.vim'
Plug 'Shougo/vimproc.vim', { 'do': 'make' }
Plug 'airodactyl/neovim-ranger'
Plug 'kana/vim-operator-user'
Plug 'haya14busa/vim-operator-flashy'
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

let g:unite_source_history_yank_enable = 1
let g:unite_source_grep_command = 'ag'
let g:unite_source_grep_default_opts =
\ '-i --line-numbers --nocolor --nogroup --hidden --ignore ' .
\  '''.hg'' --ignore ''.svn'' --ignore ''.git'' --ignore ''.bzr'''
let g:unite_source_grep_recursive_opt = ''

let mapleader = ","
nnoremap <Leader>f :Unite file/async<CR>
nnoremap <Leader>F :Unite file_rec/async<CR>
nnoremap <Leader>t :Unite tab<CR>
nnoremap <Leader>y :Unite history/yank<CR>
nnoremap <Leader>/ :Unite grep:.<CR>

set modeline

let $NVIM_TUI_ENABLE_TRUE_COLOR=1

set background=dark
colorscheme base16-monokai

set cursorline
hi linenr ctermfg=green ctermbg=black
hi cursorline ctermfg=white ctermbg=red
hi cursorlinenr ctermfg=white ctermbg=red

map y <Plug>(operator-flashy)
nmap Y <Plug>(operator-flashy)$
