return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        filetypes = { markdown = true },
        suggestion = { auto_trigger = true },
        panel = { enabled = false },
      })
    end,
  },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      "zbirenbaum/copilot.lua",
      "nvim-lua/plenary.nvim",
    },
    keys = {
      {
        "<leader>cc",
        function() require("CopilotChat").toggle() end,
        desc = "Copilot Chat",
      },
    },
    config = function()
      require("CopilotChat").setup({
        system_prompt = [[
【基本方針】
- 文章はやや硬めの文体で回答してほしい。
- 「名言風」や感情に訴えるような表現は避けてほしい。
- 回答の末尾に「何かしましょうか？」などの提案を毎回つけないでほしい（本当に有益な場合のみ）。

【使用環境】
- エディタ：Neovim（init.lua + lazy.nvim 構成）
- OS：MacBook Air（macOS）
- デフォルトシェル：zsh
- GitHub Copilotは `copilot.lua` 

【開発プロジェクト】
- React v19.0.0 + react-leaflet v5.0.0 + leaflet v1.9.4 を使用
- Reactアプリでは `index.tsx` にてテーマ、CookieProvider、React Router（`/quest-board/...`）を使用

【翻訳プロジェクト】
- Whisper + NLLBを使ったウクライナ語⇄日本語のリアルタイム通訳システムを構築中
- 自動言語検出あり、話者識別なし
- 許容遅延：6〜12秒
- 翻訳ではSentencePieceを使用予定

【AIモデル・解析関連】
- LLaMA 4を物体検知などの文脈で使用予定
- YOLOv10 または RT-DETR も使用予定
- 映像からのリアルタイム異常検知に関心あり

【投資・ビジネス】
- BLOCK INCの株を20株（購入価格：55.02ドル）保有
- キャッシュレス決済銘柄に関心あり
- 海外旅行好きな層向けにストリート系Tシャツを販売予定（Printful + Etsy）
- SNSではInstagramとXを活用予定

【やり取りに関する希望】
- 専門用語や概念にズレがあれば逐次指摘してほしい（ただし「やめて」と言ったら一時停止し、翌日以降再開）
        ]],
        show_help = true,
        debug = true,

        edit_with_instructions = {
          diff = false,
        },
        mappings = {
          submit_prompt = {
            insert = '<C-s>',
          },
          show_diff = {
            full_diff = true
          }
        },
        prompts = {
          Explain = {
            prompt = "/COPILOT_EXPLAIN コードを日本語で説明してください",
            mapping = "<leader>ce",
            description = "コードの説明をお願いする",
          },
          Review = {
            prompt = "/COPILOT_REVIEW コードを日本語でレビューしてください。",
            mapping = "<leader>cr",
            description = "コードのレビューをお願いする",
          },
          Fix = {
            prompt = "/COPILOT_FIX このコードには問題があります。バグを修正したコードを表示してください。説明は日本語でお願いします。",
            mapping = "<leader>cf",
            description = "コードの修正をお願いする",
          },
          Optimize = {
            prompt = "/COPILOT_REFACTOR 選択したコードを最適化し、パフォーマンスと可読性を向上させてください。説明は日本語でお願いします。",
            mapping = "<leader>co",
            description = "コードの最適化をお願いする",
          },
          Docs = {
            prompt = "/COPILOT_GENERATE 選択したコードに関するドキュメントコメントを日本語で生成してください。",
            mapping = "<leader>cd",
            description = "コードのドキュメント作成をお願いする",
          },
          Tests = {
            prompt = "/COPILOT_TESTS 選択したコードの詳細なユニットテストを書いてください。説明は日本語でお願いします。",
            mapping = "<leader>ct",
            description = "テストコード作成をお願いする",
          },
          FixDiagnostic = {
            prompt = "コードの診断結果に従って問題を修正してください。修正内容の説明は日本語でお願いします。",
            mapping = "<leader>cd",
            description = "コードの修正をお願いする",
            selection = require("CopilotChat.select").diagnostics,
          },
          Commit = {
            prompt = "実装差分に対するコミットメッセージを日本語で記述してください。",
            mapping = "<leader>cco",
            description = "コミットメッセージの作成をお願いする",
            selection = require("CopilotChat.select").gitdiff,
          },
          CommitStaged = {
            prompt = "ステージ済みの変更に対するコミットメッセージを日本語で記述してください。",
            mapping = "<leader>cs",
            description = "ステージ済みのコミットメッセージの作成をお願いする",
            selection = function(source)
              return require("CopilotChat.function").gitdiff(source, true)
            end,
          },
        },
      })
    end,
  },
}
