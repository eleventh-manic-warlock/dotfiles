-- Remove nvim-lspconfig global default keymappings
vim.keymap.del("n", "grn")
vim.keymap.del("n", "gra")
vim.keymap.del("n", "grr")
vim.keymap.del("n", "gri")
vim.keymap.del("n", "gO")

-- Custom keymappings for LSPs
-- LspAttach: After an LSP Client performs "initalize" and attaches to a buffer
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local keymap = vim.keymap
    local lsp = vim.lsp
    local bufopts = { noremap = true, silent = true }

    -- Normal Mode mappings
    keymap.set("n", "gr", lsp.buf.references, bufopts)              -- Show references
    keymap.set("n", "gd", lsp.buf.definition, bufopts)              -- Go to definition
    keymap.set("n", "gD", lsp.buf.declaration, bufopts)             -- Go to declaration
    keymap.set("n", "gi", lsp.buf.implementation, bufopts)          -- Go to implementation
    keymap.set("n", "K", lsp.buf.hover, bufopts)
    keymap.set("n", "<C-k>", lsp.buf.signature_help, bufopts)       -- Show signature help
    keymap.set("n", "<space>e", vim.diagnostic.open_float, bufopts) -- Show help in hover window
    keymap.set("n", "<space>rn", lsp.buf.rename, bufopts)           -- Rename symbol
    keymap.set({"n", "v"}, "<space>f", function()
      local mode = vim.api.nvim_get_mode().mode

      if vim.startswith(string.lower(mode), "v") then
        require("conform").format({ lsp_fallback = true, async = true, timeout_ms = 1000 }, function(err)
          if not err then
            if vim.startswith(string.lower(mode), "v") then
              vim.api.nvim_feedkeys(
                vim.api.nvim_replace_termcodes("<Esc>", true, false, true),
                "n",
                false
              )
            end
          end
        end)
      else
        require("conform").format({
          lsp_fallback = true,
          async = true,
          timeout_ms = 1000,
        })
      end
    end, bufopts)
  end,
})

vim.lsp.enable({
  "bashls",
  "lua_ls",
  "ruby-lsp"
})
