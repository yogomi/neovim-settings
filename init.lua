-- leaderを設定（必ず最初に）
vim.g.mapleader = ","
vim.g.maplocalleader = "."

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    local dir = vim.fn.argv(0)
    if dir ~= "" and vim.fn.isdirectory(dir) == 1 then
      vim.cmd("Neotree reveal dir=" .. dir)
    end
  end,
})

-- bootstrap lazy.nvim
require("config.lazy")

-- 基本オプション・色・キー割り当ての読み込み
require("config.options")
require("config.colorscheme")
require("config.keymaps")
