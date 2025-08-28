local keymap = vim.keymap.set
keymap("n", "<leader>e", ":NvimTreeToggle<CR>", { desc = "Toggle file explorer" })
keymap("n", "<Space>.", ":edit $MYVIMRC<CR>", { desc = "Edit Neovim config" })
keymap("n", "<Space>s.", ":source $MYVIMRC<CR>", { desc = "Reload Neovim config" })
keymap('n', ',,', '<C-y>', { noremap = true, silent = true })
keymap('n', ';', ':', { noremap = true, silent = true })

keymap('n', '<Esc><Esc>', '<Cmd>nohlsearch<CR><Esc>', { noremap = true, silent = true })
keymap('n', 'x', '"_x', { noremap = true, silent = true })

-- カーソル位置のシンタックスグループ名を表示する関数
local function show_syntax_group()
  local line = vim.fn.line('.')
  local col = vim.fn.col('.')
  local syn_id = vim.fn.synID(line, col, 1)
  local syn_name = vim.fn.synIDattr(syn_id, 'name')
  local trans_id = vim.fn.synIDtrans(syn_id)
  local trans_name = vim.fn.synIDattr(trans_id, 'name')
  local syn_id0 = vim.fn.synID(line, col, 0)
  local syn_name0 = vim.fn.synIDattr(syn_id0, 'name')
  print(string.format('hi<%s> trans<%s> lo<%s>', syn_name, syn_name0, trans_name))
end

-- <Leader>s にマッピング
vim.keymap.set('n', '<leader>s', show_syntax_group, { desc = 'Show Syntax Group under cursor' })

keymap("i", "<C-a>", "<Home>", { desc = "Go to start of line" })
keymap("i", "<C-e>", "<End>", { desc = "Go to end of line" })
keymap("i", "<C-f>", "<Right>", { desc = "Move cursor right" })
keymap("i", "<C-b>", "<Left>", { desc = "Move cursor left" })
keymap("i", "<C-p>", "<Up>", { desc = "Move cursor up" })
keymap("i", "<C-n>", "<Down>", { desc = "Move cursor down" })
keymap("i", "<C-h>", "<BS>", { desc = "Delete character before cursor" })
keymap("i", "<C-d>", "<Del>", { desc = "Delete character after cursor" })

keymap("c", "<C-a>", "<Home>", { desc = "Go to start of command line" })
keymap("c", "<C-e>", "<End>", { desc = "Go to end of command line" })
keymap("c", "<C-f>", "<Right>", { desc = "Move cursor right in command line" })
keymap("c", "<C-b>", "<Left>", { desc = "Move cursor left in command line" })
keymap("c", "<C-p>", "<Up>", { desc = "Previous command in command line" })
keymap("c", "<C-n>", "<Down>", { desc = "Next command in command line" })
keymap("c", "<C-h>", "<BS>", { desc = "Delete character before cursor in command line" })
keymap("c", "<C-d>", "<Del>", { desc = "Delete character after cursor in command line" })

-- comment
vim.keymap.set("n", "<C-z>", function()
  require("Comment.api").toggle.linewise.current()
end, { desc = "Toggle comment (normal)" })

vim.keymap.set("v", "<C-z>", function()
  local esc = vim.api.nvim_replace_termcodes("<ESC>", true, false, true)
  vim.api.nvim_feedkeys(esc, "x", false)
  require("Comment.api").toggle.linewise(vim.fn.visualmode())
end, { desc = "Toggle comment (visual)" })

-- Copilot keymaps
-- Copilot accept
vim.keymap.set("i", "<C-k>", function()
  require("copilot.suggestion").accept()
end, { desc = "Copilot: Accept", noremap = true, silent = true })

vim.keymap.set("i", "<C-w>", function()
  require("copilot.suggestion").accept_word()
end, { desc = "Copilot: Accept Word", noremap = true, silent = true })


-- Next/Previous suggestion
vim.keymap.set("i", "<C-n>", function()
  require("copilot.suggestion").next()
end, { desc = "Copilot: Next", noremap = true, silent = true })

vim.keymap.set("i", "<C-p>", function()
  require("copilot.suggestion").prev()
end, { desc = "Copilot: Previous", noremap = true, silent = true })

-- Dismiss suggestion
vim.keymap.set("i", "<C-]>", function()
  require("copilot.suggestion").dismiss()
end, { desc = "Copilot: Dismiss", noremap = true, silent = true })
vim.keymap.set('x', 'c', '<Nop>', { noremap = true, silent = true })

vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
vim.keymap.set('n', '<leader>a', "myggVG$", { desc = "Select all" })
vim.keymap.set('i', '<leader>a', "<ESC>myggVG$", { desc = "Select all" })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)

-- yunk code block
local yunk_codeblock = require("modules.yunk-codeblock").yank_codeblock
vim.keymap.set("n", "<leader>y", yunk_codeblock, { desc = "Yank code block" })
