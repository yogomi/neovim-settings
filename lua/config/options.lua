vim.opt.shell = "zsh"  -- デフォルトシェルとして zsh を使用

vim.opt.syntax = "on"
vim.opt.background = "dark"

vim.opt.encoding = "utf-8"
vim.opt_global.fileencoding = "utf-8" -- ファイルのエンコーディングを UTF-8 に設定
vim.opt.fileencodings = { "utf-8", "sjis", "euc-jp", "cp932" } -- 優先順位はテーブルで
vim.opt.fileformats = { "unix", "dos", "mac" } -- 改行コードの優先順位もテーブルで
vim.opt.swapfile = false  -- スワップファイルを作成しない
vim.opt.backupdir = vim.fn.expand("~/.nvimcache/backup")  -- チルダ展開必須
vim.opt.undodir = vim.fn.expand("~/.nvimcache/undo")  -- 同上
vim.opt.backup = true  -- バックアップを有効にする
vim.opt.viminfo = vim.opt.viminfo:get()
vim.opt.undofile = true  -- アンドゥ履歴をファイルに
vim.opt.ambiwidth = "double" -- 全角文字の幅を2に設定

vim.cmd("filetype plugin indent on")

local ostype
if vim.fn.has("win64") == 1 or vim.fn.has("win32") == 1 then
  ostype = "windows"
else
  ostype = vim.fn.system("uname"):gsub("%s+", "")  -- 改行除去
end

-- オートコマンドグループを作成
vim.api.nvim_create_augroup("MyAutoCmd", { clear = true })

-- 前回のカーソル位置に戻るオートコマンド
vim.api.nvim_create_autocmd("BufReadPost", {
  group = "MyAutoCmd",
  callback = function()
    local line = vim.fn.line
    if line([['"]]) > 0 and line([['"]]) <= line("$") then
      vim.cmd([[normal! g`"]])
    end
  end,
})

vim.opt.number = true
vim.opt.relativenumber = false
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.shiftround = true
vim.opt.softtabstop = 2  -- タブの幅を2スペースに設定
vim.opt.tabstop = 8 -- タブの幅を8スペースに設定
vim.opt.backspace = { "indent", "eol", "start" }  -- バックスペースの挙動を設定
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.wrap = true  -- 行の折り返しを有効にする
vim.opt.hlsearch = true  -- 検索結果をハイライト
vim.opt.list = true  -- 空白文字を表示
vim.opt.listchars = { tab = ">-", trail = "~", extends = ">", precedes = "<", nbsp = "␣" }  -- 空白文字
vim.opt.statusline = "[FORMAT=%{&ff}] [TYPE=%Y] [ASCII=%03.3b] [HEX=%02.2B] [POS=%04l,%04v][%p%%] [LEN=%L] %F%m%r%h%w"
vim.opt.laststatus = 2  -- ステータスラインを常に表示
vim.opt.showtabline = 2  -- タブラインを常に表示
vim.opt.ambiwidth = "double"  -- 全角文字の幅を2に設定
vim.opt.foldenable = false  -- 折りたたみを無効にする

vim.opt.clipboard:append({"unnamed", "unnamedplus"})  -- システムクリップボードを使用

vim.opt.tags:append({ ".tags", "tags" })

vim.opt.cursorline = true

-- カーソル行のスタイル（下線）
vim.api.nvim_set_hl(0, "CursorLine", { underline = true })
vim.api.nvim_set_hl(0, "Title", {
  bold = true,
  fg = "#60ff60",
})

vim.opt.conceallevel = 2
vim.opt.concealcursor = "inv"
vim.opt.colorcolumn = "100"

vim.api.nvim_create_autocmd("InsertLeave", {
  callback = function()
    local sysname = vim.loop.os_uname().sysname
    if sysname == "Darwin" then
      if vim.fn.executable("im-select") == 1 then
        os.execute("im-select com.apple.keylayout.ABC")
      end
    elseif sysname == "Linux" then
      if vim.fn.executable("fcitx-remote") == 1 then
        os.execute("fcitx-remote -c")
      end
    end
  end,
})
