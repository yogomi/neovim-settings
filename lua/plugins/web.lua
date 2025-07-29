return {
  -- Emmet for HTML/JSX
  {
    "mattn/emmet-vim",
    ft = { "html", "css", "javascript", "javascriptreact", "typescriptreact" },
    init = function()
      vim.g.user_emmet_settings = {
        ["javascript.jsx"] = {
          extends = "jsx",
          quote_char = "'",
        },
      }
    end,
  },

  -- CSS3 syntax highlighting (used for better support in HTML/CSS files)
  {
    "hail2u/vim-css3-syntax",
    ft = { "css", "scss", "sass", "less" },
  },
}
