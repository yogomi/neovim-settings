return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    ensure_installed = {
      "lua",
      "vim",
      "vimdoc",
      "query",
      "bash",
      "json",
      "yaml",
      "markdown",
      "regex",
      "javascript",
      "typescript",
      "tsx",
      "html",
      "css",
    },
    highlight = { enable = true },
    indent = { enable = true },
    auto_install = true,
  },
  config = function(_, opts)
    require("nvim-treesitter").setup(opts)
  end,
}
