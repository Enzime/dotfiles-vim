call plug#begin('~/.config/nvim/plugged')
fun! DoRemote(arg)
    UpdateRemotePlugins
endfun

" Color scheme
Plug 'airodactyl/hybrid-krompus.vim'

" Status bar
Plug 'itchyny/lightline.vim'

" denite.nvim
Plug 'Shougo/denite.nvim', { 'do': function('DoRemote') }

" git
Plug 'tpope/vim-fugitive'

" ranger as folder explorer
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

" async completion for neovim
Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }

" jedi source for deoplete.nvim
Plug 'zchee/deoplete-jedi'

" TernJS source for deoplete.nvim
Plug 'carlitux/deoplete-ternjs'

" C++ syntax highlighting
Plug 'octol/vim-cpp-enhanced-highlight'

" Remove easy motions :(
Plug 'takac/vim-hardtime'

" sneak.vim
Plug 'justinmk/vim-sneak'

" Add better search highlighting
Plug 'haya14busa/incsearch.vim'

" tag ALL the things
" Plug 'ludovicchabant/vim-gutentags'

" display colours :)
Plug 'ap/vim-css-color'

" Show marks on the sidebar
Plug 'kshenoy/vim-signature'

" Javascript highlighting
Plug 'pangloss/vim-javascript'

" JSX highlighting
Plug 'mxw/vim-jsx'

" Magically align all the things
Plug 'junegunn/vim-easy-align'

" Visualizes your vim undo tree
Plug 'sjl/gundo.vim'

" Automatic linter
Plug 'w0rp/ale'

" Bracket wrapping
Plug 'FooSoft/vim-argwrap'
call plug#end()

" Lightline :)
set noshowmode
set laststatus=2

" Everything just got HARDER
let g:hardtime_default_on = 1

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
set expandtab
set softtabstop=4
set shiftwidth=0
set tabstop=4
set autoindent

" Show special whitespacing chars
set list
set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮,trail:·

" Lines before page starts scrolling
set scrolloff=1
set sidescroll=1

" Disable wrapping of lines on display
set nowrap

" denite.nvim settings
call denite#custom#var('file_rec', 'command',
\ ['rg', '--files', '--glob', '!.git', ''])

call denite#custom#var('grep', 'command', ['rg'])
call denite#custom#var('grep', 'default_opts',
                \ ['--vimgrep', '--no-heading'])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', ['--regexp'])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])

" Leader key is better suited for , rather than \
let mapleader = ","

" unite.vim bindings
nnoremap <Leader>b :Denite -mode=normal -default-action=open buffer<CR>
nnoremap <Leader>f :Denite -mode=normal -default-action=open file_rec<CR>
nnoremap <Leader>F :Denite -mode=normal -default-action=tabopen file_rec<CR>
nnoremap <Leader>s :Denite -mode=normal -default-action=split file_rec<CR>
nnoremap <Leader>v :Denite -mode=normal -default-action=vsplit file_rec<CR>
nnoremap <Leader>t :Denite -mode=normal -default-action=open tab<CR>
nnoremap <Leader>/ :Denite -mode=normal -default-action=open -no-empty grep:.<CR>

" Remove find highlight
nnoremap <Leader>h :noh<CR>

" Edit/Reload nvimrc
nnoremap <Leader>e :edit $MYVIMRC<CR>
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

" Customize colour of vim-operator-flashy
hi Flashy ctermbg=5 guibg=#ff0084

" Operator remapping
map y <Plug>(operator-flashy)
map Y "+<Plug>(operator-flashy)
nmap cm <Plug>Commentary

" Add tab changing bindings
map <C-a> gT
map <C-f> gt

" Add window split bindings
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Add scroll page binding
noremap <C-s> <C-u>

" Make terminal mode magical
let g:terminal_scrollback_buffer_size = 100000

" Function for toggling line length indicator
fun! ToggleEighty()
    if !exists('g:eighty') || !g:eighty
        let g:eighty = 1
        " Show vertical ruler at 80 chars
        set colorcolumn=80
        " Highlight all characters after 80
        hi OverLength ctermfg=black ctermbg=darkred guifg=#0a0a0a guibg=#ff3f3d
        match OverLength /\%>80v.\+/
    else
        let g:eighty = 0
        " Remove vertical ruler
        set colorcolumn=0
        " Remove highlight after 80 chars
        hi clear OverLength
    endif
endfun

" Enable line length indicator
call ToggleEighty()

" Toggle line length indicator binding
map <Leader>l :call ToggleEighty()<CR>

" incsearch.vim bindings
map / <Plug>(incsearch-forward)
map ? <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

" fugitive.vim bindings
map <Leader>gs :Gstatus<CR>
map <Leader>gd :Gdiff<CR>
map <Leader>gb :Gblame<CR>
map <Leader>g<SPACE> :Git<SPACE>

" Enable deoplete
let g:deoplete#enable_at_startup = 1

" Beautify JSON
map <Leader>j :%!python -m json.tool<CR>

" Confirm quit rather than :q!
map ZQ :q<CR>

" Disable Ex mode
map Q <Nop>

" Taken from my zle/readline bindings :)
imap <C-h> <C-Left>
" imap <C-j> <Down>
" imap <C-k> <Up>
imap <C-l> <C-Right>

cmap <C-h> <C-Left>
cmap <C-j> <Down>
cmap <C-k> <Up>
cmap <C-l> <C-Right>

" Open the undo tree from gundo.vim
nnoremap <Leader>G :GundoToggle<CR>

" Toggle argument wrapping
nnoremap <silent> <Leader>a :ArgWrap<CR>
