return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "neovim/nvim-lspconfig",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/nvim-cmp",
    },
    config = function()
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


      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("lsp-attach-keybinds", { clear = true }),
        callback = function(e)
          local keymap = function(keys, func)
            vim.keymap.set("n", keys, func, { buffer = e.buf })
          end
          local builtin = require("telescope.builtin")

          keymap("gd", builtin.lsp_definitions)
          keymap("gD", vim.lsp.buf.declaration)
        end
      })
    end
}
