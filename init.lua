-- leaderを設定（必ず最初に）
vim.g.mapleader = " "
vim.g.maplocalleader = ","


-- bootstrap lazy.nvim
require("config.lazy")

-- 基本オプション・色・キー割り当ての読み込み
require("config.options")
require("config.colorscheme")
require("config.keymaps")
