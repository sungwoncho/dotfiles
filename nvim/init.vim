
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
colorscheme torte

let mapleader = ','
syntax on " Enable syntax highlighting

set expandtab " Use spaces instead of tabs
set smarttab

" 1 tab == 2 spaces
set shiftwidth=2
set tabstop=2

set ai  " Auto indent
set si  " Smart indent
set wrap  " Wrap lines

set number relativenumber  " Relative line numbers

function! NumberToggle()
  if(&relativenumber == 1)
    set norelativenumber
    set number
  else
    set nonumber
    set number relativenumber
  endif
endfunc

nnoremap <C-\> :call NumberToggle()<cr>

" highlight search hits
set hlsearch

" Shortcut for clearing search highlight
nnoremap <CR> :noh<CR>

colorscheme torte

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" managed by vim-plug
call plug#begin('~/.local/share/nvim/plugged')

Plug 'leafgarland/typescript-vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'pangloss/vim-javascript'
Plug 'bling/vim-airline'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-fugitive'
Plug 'mileszs/ack.vim'
Plug 'vim-airline/vim-airline-themes'
Plug 'mxw/vim-jsx'
Plug 'jiangmiao/auto-pairs'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-surround'
Plug 'w0rp/ale'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'mhartington/nvim-typescript', {'build': './install.sh'}
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-go', { 'do': 'make' }
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'scrooloose/nerdtree'
Plug 'Quramy/tsuquyomi'

call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin specific mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <silent> <C-a> :ALENext<cr>
nmap <silent> <C-s> :ALEPrevious<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin specific settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ctrlp.vim
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|vendor|compiled'
let g:ctrlp_show_hidden = 1

" vim-airline
let g:airline_theme = 'powerlineish'
let g:airline#extensions#branch#enabled = 1

" ale
let g:ale_fixers = {}
let g:ale_fixers['javascript'] = ['prettier']
"let g:ale_fixers['json'] = ['prettier']
let g:ale_fixers['scss'] = ['prettier']
let g:ale_fix_on_save = 1
let g:ale_javascript_prettier_use_local_config = 1

let g:ale_linters = {
\   'javascript': ['eslint'],
\}

" Use Syntastic to check syntax
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 1
"let g:syntastic_enable_signs=1
"let g:syntastic_loc_list_height=3
"let g:syntastic_javascript_checkers = ['eslint']
"let g:syntastic_javascript_eslint_exe='$(yarn bin)/eslint'

" vim-go
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)

" Show a list of interfaces which is implemented by the type under your cursor
au FileType go nmap <Leader>f <Plug>(go-implements)

" Show type info for the word under your cursor
au FileType go nmap <Leader>i <Plug>(go-info)

" Open the relevant Godoc for the word under the cursor
au FileType go nmap <Leader>gd <Plug>(go-def-tab)
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
au FileType go nmap <Leader>gs <Plug>(go-doc-split)

" Open the Godoc in browser
au FileType go nmap <Leader>gb <Plug>(go-doc-browser)

let g:go_fmt_command = "gofmt"
"let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
let g:go_metalinter_command='golangci-lint'
let g:go_metalinter_autosave = 1
let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck']
let g:go_metalinter_deadline = "10s"

let g:go_auto_type_info = 1
set updatetime=150

" ack.vim
if executable('ag')
  let g:ackprg = 'ag --vimgrep --ignore compiled --ignore-dir dist'
endif

" deoplete
" Enable at startup. Causes nvim main page to disappear
let g:deoplete#enable_at_startup = 1
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" neosnippet
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)

smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

let g:neosnippet#snippets_directory='~/.config/nvim/snippets'

" nerdtree
" close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" find and focus the current file in the tree
nmap ,n :NERDTreeFind<CR>

" show hidden files
let NERDTreeShowHidden=1

""" emmet
""autocmd FileType javascript,jsx EmmetInstall
""
""let g:user_emmet_settings={
""\  'javascript.jsx' : {
""\    'extends': 'jsx',
""\    'default_attributes': {
""\      'label': [{'htmlFor': ''}],
""\      'class': {'className': ''},
""\    }
""\  },
""\}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vim mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>s <esc>:w<cr>
map <leader>q <esc>:q<cr>
imap <leader>s <esc>:w<cr>i
nmap <leader>e :NERDTreeToggle<cr>
imap jk <Esc>

" Open a file in a new tab
map gF <C-W>gf

" Toggle paste mode
set pastetoggle=<F2>

tnoremap <Esc> <C-\><C-n>
tnoremap jk <C-\><C-n>

" Navigate between panes
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

set foldlevelstart=99
set foldmethod=indent
nmap z0 :set foldlevel=0<CR>zz
nmap z1 :set foldlevel=1<CR>
nmap z2 :set foldlevel=2<CR>
nmap z3 :set foldlevel=3<CR>
nmap z4 :set foldlevel=4<CR>
nmap z5 :set foldlevel=5<CR>
nmap zx zRkzt

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vim settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
set laststatus=2 " Always display the status bar

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Miscellaneous
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Rename current file
function! RenameFile()
  let old_name = expand('%')
  let new_name = input('New file name: ', expand('%'), 'file')
  if new_name != '' && new_name != old_name
    exec ':saveas ' . new_name
    exec 'silent !rm ' . old_name
    redraw!
  endif
endfunction
map <leader>r :call RenameFile()<cr>

" Highlight extra whitespaces
set list listchars=tab:»·,trail:·

" Automatically reload a file when changed
set autoread

" Disable doc at the top
set completeopt-=preview

" To use echodoc
" https://github.com/Shougo/neocomplete.vim/issues/120#issuecomment-29281963
set cmdheight=2

" Enable backspace
set backspace=2

"" markdown
autocmd FileType md set spell spelllang=en_us

" Wrap visual selection in an XML comment
au FileType html,xml nmap <leader>c <esc>:call CommentWrap()<cr>
function! CommentWrap()
  normal `>
  if &selection == 'exclusive'
    exe "normal i-->"
  else
    exe "normal a-->"
  endif
  normal `<
  exe "normal i<!--"
  normal `<
endfunction

" Configure cursor position after expanding an HTML tag
function! Expander()
  let line   = getline(".")
  let col    = col(".")
  let first  = line[col-2]
  let second = line[col-1]
  let third  = line[col]

  if first ==# ">"
    if second ==# "<" && third ==# "/"
      return "\<CR>\<C-o>==\<C-o>O"

    else
      return "\<CR>"

    endif

  else
    return "\<CR>"

  endif

endfunction
au FileType html,js,jsx inoremap <expr> <CR> Expander()

" search for the word under the cursor
nnoremap <silent> <Leader>ag :Ack <C-R><C-W><CR>

" edit and source vim config
nnoremap <Leader>cv :vs ~/.dotfiles/nvim/init.vim<CR>
nnoremap <Leader>sv :source ~/.dotfiles/nvim/init.vim<CR>

" copy and paste using the system clipboard
noremap <Leader>y "+y
noremap <Leader>p "+p
