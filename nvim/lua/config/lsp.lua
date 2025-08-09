local cmp = require('cmp')

cmp.setup({
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-e>'] = cmp.mapping.abort(),
    ["<S-Tab>"] = cmp.mapping.select_prev_item(),
    ["<Tab>"] = cmp.mapping.select_next_item(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
  }, {
    { name = 'buffer' },
  })
})

local capabilities = require('cmp_nvim_lsp').default_capabilities()
local lspconfig = require('lspconfig')

require('lspconfig').gopls.setup {
  capabilities = capabilities
}

require('lspconfig').pyright.setup {
  capabilities = capabilities
}

require('lspconfig').rust_analyzer.setup {
  capabilities = capabilities
}

-- require('lspconfig').tsserver.setup {
--   capabilities = capabilities
-- }

-- LSP keymaps
vim.keymap.set('n', '<leader>o', vim.diagnostic.open_float)
vim.keymap.set('n', '<leader>p', vim.diagnostic.setloclist)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
