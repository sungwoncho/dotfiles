return {
  "fatih/vim-go",
  config = function()
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
  end,
  build  = "GoUpdateBinaries"
}
