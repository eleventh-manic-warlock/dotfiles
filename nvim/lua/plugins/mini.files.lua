return {
  "nvim-mini/mini.files",
  version = "*",
  config = function()
    require("mini.files").setup({})

    -- mini.files opener shortcut
    vim.keymap.set("n", "<leader>e", "<cmd>lua MiniFiles.open()<CR>", opts)
  end,
}
