""""""""""""""""""""""""""""""""""""""""""""""""""""""
color torte
let mapleader = ','
syntax off " Enable syntax highlighting

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


"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" managed by vim-plug
call plug#begin('~/.local/share/nvim/plugged')

Plug 'ctrlpvim/ctrlp.vim'
Plug 'bling/vim-airline'
Plug 'tpope/vim-fugitive'
Plug 'mileszs/ack.vim'
Plug 'vim-airline/vim-airline-themes'
Plug 'jiangmiao/auto-pairs'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdtree'

Plug 'neovim/nvim-lspconfig'

" auto-complete
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'

call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin specific mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <silent> <leader>an :ALENext<cr>
nmap <silent> <leader>am :ALEPrevious<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin specific settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ctrlp.vim
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|vendor|compiled'
let g:ctrlp_show_hidden = 1
let g:ctrlp_max_files=0
let g:ctrlp_max_depth=40

" vim-airline
let g:airline_theme = 'powerlineish'
let g:airline#extensions#branch#enabled = 1

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
let g:go_fmt_options = {
  \ 'gofmt': '-s',
\ }

let g:go_def_mode='gopls'
" let g:go_info_mode='gocode'

let g:go_metalinter_command='gopls'
let g:go_metalinter_autosave = 1
let g:go_metalinter_enabled = ['govet', 'errcheck']
let g:go_metalinter_deadline = "10s"

let g:go_auto_type_info = 1
set updatetime=150

" ack.vim
if executable('ag')
  let g:ackprg = 'ag --vimgrep --ignore compiled --ignore-dir dist'
endif

" nerdtree
" close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" find and focus the current file in the tree
nmap ,n :NERDTreeFind<CR>

" show hidden files
let NERDTreeShowHidden=1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vim mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>s <esc>:w<cr>
map <leader>q <esc>:q<cr>
imap <leader>s <esc>:w<cr>i
nmap <leader>e :NERDTreeToggle<cr>
imap jk <Esc>

" Open a file in a new tab
map GF <C-W>gf
" Open a file in a vertical split
map gF :vertical wincmd f<CR> <C-W>L
" Open a file in a horizontal split
map Gf <C-W>f

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

autocmd BufNewFile,BufRead *.gohtml set syntax=html

" lua stuff
lua <<EOF
  -- Set up nvim-cmp.
  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
      end,
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ["<S-Tab>"] = cmp.mapping.select_prev_item(),
      ["<Tab>"] = cmp.mapping.select_next_item(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
    }, {
      { name = 'buffer' },
    })
  })

  -- Set up lspconfig.
  local capabilities = require('cmp_nvim_lsp').default_capabilities()

  require('lspconfig').gopls.setup {
    capabilities = capabilities
  }
  require('lspconfig').pyright.setup{
    capabilities = capabilities
  }
  require('lspconfig').rust_analyzer.setup({
  })
  require('lspconfig').tsserver.setup({
  })
EOF
