vim.opt.expandtab = true
vim.opt.smarttab = true
vim.opt.shiftwidth = 2 -- 1 tab == 2 spaces
vim.opt.tabstop = 2
vim.opt.autoindent = true -- Auto indent
vim.opt.smartindent = true -- Smart indent
vim.opt.wrap = true -- Wrap lines

vim.opt.number = true
vim.opt.relativenumber = true

-- Fold
vim.opt.foldlevelstart = 99
vim.opt.foldmethod = 'indent'
vim.keymap.set('n', 'z0', ':set foldlevel=0<CR>zz', { noremap = true })
vim.keymap.set('n', 'z1', ':set foldlevel=1<CR>', { noremap = true })
vim.keymap.set('n', 'z2', ':set foldlevel=2<CR>', { noremap = true })
vim.keymap.set('n', 'z3', ':set foldlevel=3<CR>', { noremap = true })
vim.keymap.set('n', 'z4', ':set foldlevel=4<CR>', { noremap = true })
vim.keymap.set('n', 'z5', ':set foldlevel=5<CR>', { noremap = true })
vim.keymap.set('n', 'zx', 'zRkzt', { noremap = true })

-- Miscellaneous settings
vim.opt.list = true
vim.opt.listchars = 'tab:»·,trail:·' -- Highlight extra whitespaces
vim.opt.autoread = true -- Automatically reload a file when changed
vim.opt.completeopt:remove('preview') -- Disable doc at the top
vim.opt.cmdheight = 2 -- To use echodoc
vim.opt.backspace = '2' -- Enable backspace

-- General vim mappings
vim.keymap.set('n', '<CR>', ':noh<CR>', { noremap = true })
vim.keymap.set('', '<leader>s', '<esc>:w<cr>')
vim.keymap.set('', '<leader>q', '<esc>:q<cr>')
vim.keymap.set('i', '<leader>s', '<esc>:w<cr>i')
vim.keymap.set('i', 'jk', '<Esc>')

-- Navigate between panes
vim.keymap.set('n', '<C-J>', '<C-W><C-J>', { noremap = true })
vim.keymap.set('n', '<C-K>', '<C-W><C-K>', { noremap = true })
vim.keymap.set('n', '<C-L>', '<C-W><C-L>', { noremap = true })
vim.keymap.set('n', '<C-H>', '<C-W><C-H>', { noremap = true })

vim.g.go_fmt_command = "gofmt"
vim.g.go_fmt_options = {
  gofmt = '-s'
}
vim.g.go_def_mode = 'gopls'
vim.g.go_metalinter_command = 'gopls'
vim.g.go_metalinter_autosave = 1
vim.g.go_metalinter_enabled = {'govet', 'errcheck'}
vim.g.go_metalinter_deadline = "10s"
vim.g.go_auto_type_info = 1
