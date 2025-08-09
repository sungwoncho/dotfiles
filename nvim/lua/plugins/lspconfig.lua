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
