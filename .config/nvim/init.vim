call plug#begin('~/.config/nvim/plugged')
Plug 'itchyny/lightline.vim'
Plug 'chriskempson/base16-vim'
Plug 'tpope/vim-fugitive'
Plug 'Shougo/unite.vim'
Plug 'Shougo/neoyank.vim'
Plug 'Shougo/vimproc.vim', { 'do': 'make' }
Plug 'airodactyl/neovim-ranger'
Plug 'kana/vim-operator-user'
Plug 'haya14busa/vim-operator-flashy'
Plug 'w0ng/vim-hybrid'
Plug 'airodactyl/hybrid-krompus.vim'
Plug 'floobits/floobits-neovim'
Plug 'will133/vim-dirdiff'
Plug 'octol/vim-cpp-enhanced-highlight'
call plug#end()

set noshowmode
set laststatus=2

syntax on
set mouse=a
set number
set relativenumber

set expandtab
set softtabstop=4
set shiftwidth=0
set tabstop=4

set autoindent

set list
set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮,trail:·

let g:unite_source_history_yank_enable = 1
let g:unite_source_grep_command = 'ag'
let g:unite_source_grep_default_opts =
\ '-i --line-numbers --nocolor --nogroup --hidden --ignore ' .
\  '''.hg'' --ignore ''.svn'' --ignore ''.git'' --ignore ''.bzr'''
let g:unite_source_grep_recursive_opt = ''

let g:unite_source_rec_max_cache_files = 0
call unite#custom#source('file_rec,file_rec/async',
                \ 'max_candidates', 0)

let g:neoyank#save_registers = ['+', '"']

let mapleader = ","


" Unite bindings
nnoremap <Leader>f :Unite -start-insert file/async<CR>
nnoremap <Leader>F :Unite -start-insert file_rec/async<CR>
nnoremap <Leader>t :Unite -start-insert tab<CR>
nnoremap <Leader>y :Unite history/yank -default-action=yank<CR>
nnoremap <Leader>p :Unite history/yank<CR>
nnoremap <Leader>/ :Unite grep:.<CR>

nmap <Leader>Y "+yy

nnoremap <Leader>h :noh<CR>
nnoremap <Leader>E :tabedit $MYVIMRC<CR>
nnoremap <Leader>R :source $MYVIMRC<CR>

nnoremap <Leader>pi :PlugInstall<CR>
nnoremap <Leader>pu :PlugUpdate<CR>

set modeline

let $NVIM_TUI_ENABLE_TRUE_COLOR = 1

set background=dark
colorscheme hybrid-krompus

" set cursorline
hi linenr ctermfg=green ctermbg=black
hi cursorline ctermfg=white ctermbg=red
hi cursorlinenr ctermfg=white ctermbg=red

map y <Plug>(operator-flashy)
nmap Y <Plug>(operator-flashy)$

noremap <C-a> gT
noremap <C-f> gt
