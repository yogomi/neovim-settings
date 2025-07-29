return {
  {
    "tpope/vim-fugitive",
    event = "VeryLazy",
    config = function()
      vim.keymap.set("n", "<leader>gs", "<cmd>G<CR>", { desc = "Git status (Fugitive)" })
    end,
  },
}
