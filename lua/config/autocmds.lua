local group = vim.api.nvim_create_augroup("BinaryXXD", { clear = true })

vim.api.nvim_create_autocmd("BufReadPre", {
  pattern = "*.bin",
  group = group,
  callback = function()
    vim.opt.binary = true
  end,
})

vim.api.nvim_create_autocmd("BufReadPost", {
  pattern = "*",
  group = group,
  callback = function()
    if vim.opt.binary:get() then
      vim.cmd("silent %!xxd -g 1")
      vim.cmd("set filetype=xxd")
    end
  end,
})

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  group = group,
  callback = function()
    if vim.opt.binary:get() then
      vim.cmd("%!xxd -r")
    end
  end,
})

vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = "*",
  group = group,
  callback = function()
    if vim.opt.binary:get() then
      vim.cmd("silent %!xxd -g 1")
      vim.cmd("set nomodified")
    end
  end,
})

