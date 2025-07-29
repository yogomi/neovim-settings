return {
  {
    "dense-analysis/ale",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      -- ALEの基本設定
      vim.g.ale_linters_explicit = 1 -- 設定したリンターのみ使う（明示的に設定）
      vim.g.ale_fix_on_save = 1      -- 保存時に自動でFixを実行
      vim.g.ale_fixers = {
        ["python"] = { "black", "isort" },
        ["javascript"] = { "eslint" },
        ["typescript"] = { "eslint" },
        ["sh"] = { "shfmt" },
      }

      -- Linterを有効にするファイルタイプの設定例
      vim.g.ale_linters = {
        python = { "flake8", "mypy" },
        javascript = { "eslint" },
        typescript = { "eslint" },
        sh = { "shellcheck" },
      }

      -- エラーメッセージの表示位置をクイックフィックスにする
      vim.g.ale_set_quickfix = 1

      -- 問題がある行をハイライト
      vim.g.ale_virtualtext_cursor = 1

      -- キーマッピング例（問題ジャンプ）
      vim.api.nvim_set_keymap("n", "[e", "<Plug>(ale_previous_wrap)", {})
      vim.api.nvim_set_keymap("n", "]e", "<Plug>(ale_next_wrap)", {})
    end,
  },
}
