call plug#begin('~/.config/nvim/plugged')
Plug 'itchyny/lightline.vim'
Plug 'chriskempson/base16-vim'
Plug 'tpope/vim-fugitive'
Plug 'Shougo/unite.vim'
Plug 'Shougo/vimproc.vim', { 'do': 'make' }
Plug 'airodactyl/neovim-ranger'
Plug 'kana/vim-operator-user'
Plug 'haya14busa/vim-operator-flashy'
Plug 'w0ng/vim-hybrid'
Plug 'floobits/floobits-neovim'
Plug 'will133/vim-dirdiff'
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

let mapleader = ","
nnoremap <Leader>f :Unite file/async<CR>
nnoremap <Leader>F :Unite file_rec/async<CR>
nnoremap <Leader>R :source $MYVIMRC<CR>
nnoremap <Leader>t :Unite tab<CR>
nnoremap <Leader>y :Unite history/yank<CR>
nnoremap <Leader>/ :Unite grep:.<CR>

set modeline

" let $NVIM_TUI_ENABLE_TRUE_COLOR=1

set background=dark
let g:hybrid_custom_term_colors = 1
colorscheme hybrid

" set cursorline
hi linenr ctermfg=green ctermbg=black
hi cursorline ctermfg=white ctermbg=red
hi cursorlinenr ctermfg=white ctermbg=red

map y <Plug>(operator-flashy)
nmap Y <Plug>(operator-flashy)$

noremap <C-a> gT
noremap <C-f> gt

function! ToggleMovement(firstOp, thenOp)
  let pos = getpos('.')
  execute "normal! " . a:firstOp
  if pos == getpos('.')
    execute "normal! " . a:thenOp
  endif
endfunction

" The original carat 0 swap
nnoremap <silent> 0 :call ToggleMovement('^', '0')<CR>

" How about H and L
nnoremap <silent> H :call ToggleMovement('H', 'L')<CR>
nnoremap <silent> L :call ToggleMovement('L', 'H')<CR>

" How about G and gg
nnoremap <silent> G :call ToggleMovement('G', 'gg')<CR>
nnoremap <silent> gg :call ToggleMovement('gg', 'G')<CR>
