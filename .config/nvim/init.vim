call plug#begin('~/.config/nvim/plugged')
" Color scheme
Plug 'airodactyl/hybrid-krompus.vim'

" Status bar
Plug 'itchyny/lightline.vim'

" Selector
Plug 'Shougo/unite.vim'
Plug 'Shougo/neoyank.vim'
Plug 'Shougo/vimproc.vim', { 'do': 'make' }

" git
Plug 'tpope/vim-fugitive'

" ranger as folder explorre
Plug 'airodactyl/neovim-ranger'

" Show yank visually
Plug 'kana/vim-operator-user'
Plug 'haya14busa/vim-operator-flashy'

" Directory diff
Plug 'will133/vim-dirdiff'

" Change surrounding characters
Plug 'tpope/vim-surround'

" Automatic indent settings
Plug 'tpope/vim-sleuth'

" Commenting
Plug 'tpope/vim-commentary'

" dank repeatability
Plug 'tpope/vim-repeat'

" floobits
Plug 'floobits/floobits-neovim'

" Syntax highlighting
Plug 'octol/vim-cpp-enhanced-highlight'
call plug#end()

" Lightline :)
set noshowmode
set laststatus=2

" Show current git branch in lightline
let g:lightline = {
    \ 'active': {
    \   'left': [ [ 'mode', 'paste'],
    \             [ 'fugitive', 'readonly', 'filename', 'modified' ] ]
    \ },
    \ 'component': {
    \   'fugitive': '%{fugitive#head()}'
    \ },
    \ 'component_visible_condition': {
    \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
    \ }
\ }

" Show syntax highlighting
syntax on

" Enable mouse
set mouse=a

" Show both abs and rel numbers
set number
set relativenumber

" Replaced with sleuth.vim
" set expandtab
" set softtabstop=4
" set shiftwidth=0
" set tabstop=4
" set autoindent

" Show special whitespacing chars
set list
set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮,trail:·

" Lines before page starts scrolling
set scrolloff=1

" Unite settings
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

" Leader key is better suited for , rather than \
let mapleader = ","

" Unite bindings
nnoremap <Leader>f :Unite -start-insert file/async<CR>
nnoremap <Leader>F :Unite -start-insert file_rec/async<CR>
nnoremap <Leader>t :Unite -start-insert tab<CR>
nnoremap <Leader>y :Unite history/yank -default-action=yank<CR>
nnoremap <Leader>p :Unite history/yank<CR>
nnoremap <Leader>/ :Unite grep:.<CR>

" Remove find highlight
nnoremap <Leader>h :noh<CR>

" Edit/Reload nvimrc
nnoremap <Leader>E :tabedit $MYVIMRC<CR>
nnoremap <Leader>R :source $MYVIMRC<CR>

" vim.plug bindings
nnoremap <Leader>pi :PlugInstall<CR>
nnoremap <Leader>pu :PlugUpdate<CR>

" Use modelines
set modeline

" Replace with https://github.com/neovim/neovim/pull/4690
" when new neovim releases
let $NVIM_TUI_ENABLE_TRUE_COLOR = 1

" Use hybrid-krompus.vim :)
set background=dark
colorscheme hybrid-krompus

" Show 80 char ruler
set cc=80
" hi ColorColumn ctermbg=10 guibg=#c1ff05

" Highlight text going over 80 characters
highlight OverLength ctermfg=black ctermbg=darkred guifg=#0a0a0a guibg=#ff3f3d
match OverLength /\%>80v.\+/

" Highlight current line
" set cursorline
" hi linenr ctermfg=green ctermbg=black
" hi cursorline ctermfg=white ctermbg=red
" hi cursorlinenr ctermfg=white ctermbg=red

" Customize colour of vim-operator-flashy
hi Flashy ctermbg=5 guibg=#ff0084

" Operator remapping
map y <Plug>(operator-flashy)
map Y "+<Plug>(operator-flashy)
nmap cm <Plug>Commentary

" Add tab changing bindings
map <C-a> gT
noremap <C-f> gt

" Add scroll page binding
noremap <C-s> <C-u>

" Make terminal mode magical
let g:terminal_scrollback_buffer_size = 100000
