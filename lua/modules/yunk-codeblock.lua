local M = {}

function M.yank_codeblock()
  local api = vim.api
  local cur = api.nvim_win_get_cursor(0)
  local bufnr = api.nvim_get_current_buf()
  local lines = api.nvim_buf_get_lines(bufnr, 0, -1, false)

  -- 現在行から上方向に ``` を探す
  local start_line = nil
  for i = cur[1] - 1, 1, -1 do
    if lines[i]:match("^```") then
      start_line = i
      break
    end
  end
  if not start_line then
    vim.notify("Start ``` not found", vim.log.levels.WARN)
    return
  end

  -- 現在行から下方向に ``` を探す
  local end_line = nil
  for i = cur[1], #lines do
    if lines[i]:match("^```") then
      end_line = i
      break
    end
  end
  if not end_line or end_line <= start_line then
    vim.notify("End ``` not found", vim.log.levels.WARN)
    return
  end

  -- コードブロックの中身を取得
  local code_lines = {}
  for i = start_line + 1, end_line - 1 do
    table.insert(code_lines, lines[i])
  end

  if #code_lines == 0 then
    vim.notify("Code block is empty", vim.log.levels.INFO)
    return
  end

  -- レジスタにセット
  vim.fn.setreg('l', table.concat(code_lines, "\n"))
  vim.notify("Code block yanked!", vim.log.levels.INFO)
end

return M
