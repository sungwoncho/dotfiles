return {
  "preservim/nerdtree",
  config = function()
    vim.keymap.set('n', '<leader>e', ':NERDTreeToggle<cr>', { noremap = true })
    vim.keymap.set('n', ',n', ':NERDTreeFind<CR>', { noremap = true })
    vim.g.NERDTreeShowHidden = 1
  end
}
