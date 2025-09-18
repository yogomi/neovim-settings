return {
  "yetone/avante.nvim",
  event = "VeryLazy",
  lazy = false,
  version = false,
  build = 'make',
  opts = {
    provider = "copilot",
    auto_suggestions_provider = "copilot",
    -- 動作設定
    behaviour = {
      auto_suggestions = false,
      auto_set_highlight_group = true,
      auto_set_keymaps = true,
      auto_apply_diff_after_generation = false,
      support_paste_from_clipboard = false,
      minimize_diff = true,
    },
    providers = {
      copilot = {
        endpoint = "https://api.githubcopilot.com",
        model = "claude-3.7-sonnet",
        timeout = 30000,
        extra_request_body = {
          temperature = 0,
          max_tokens = 4096,
        },
      },
    },
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

    -- ウィンドウ設定
    windows = {
      position = "right",  -- サイドバーの位置
      wrap = true,        -- テキストの折り返し
      width = 30,         -- サイドバーの幅
      -- その他の詳細設定は省略
    },
  },
-- 依存関係の設定
  dependencies = {
    -- 必須の依存関係
    "stevearc/dressing.nvim",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    -- オプションの依存関係
    "hrsh7th/nvim-cmp",
    "nvim-tree/nvim-web-devicons",
    "zbirenbaum/copilot.lua",
    -- その他の拡張機能
  }
}
