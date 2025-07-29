return {
  -- telescope.nvim
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local telescope = require("telescope")
      telescope.setup{
        defaults = {
          prompt_prefix = "🔍 ",
          selection_caret = "➤ ",
          path_display = { "smart" },
        },
      }
      local builtin = require('telescope.builtin')
      -- キーマップ例
      vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = "Find Files" })
      vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = "Live Grep" })
      vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = "Buffers" })
      vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = "Help Tags" })
    end,
  },

  -- nvim-tree.lua
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("nvim-tree").setup({
        view = {
          width = 35,
        },
        renderer = {
          icons = {
            glyphs = {
              default = "",
              symlink = "",
              folder = {
                default = "",
                open = "",
                empty = "",
                empty_open = "",
                symlink = "",
              },
            },
          },
        },
      })

      -- ディレクトリを開いたときに nvim-tree を起動
      vim.api.nvim_create_autocmd("BufEnter", {
        group = vim.api.nvim_create_augroup("AutoNvimTree", { clear = true }),
        callback = function(args)
          local path = args.file
          if vim.fn.isdirectory(path) == 1 then
            vim.schedule(function()
              require("nvim-tree.api").tree.open()
              require("nvim-tree.api").tree.change_root(path)
            end)
          end
        end,
      })

      -- <leader>e でファイラをトグル
      vim.keymap.set('n', '<leader>e', require("nvim-tree.api").tree.toggle, { desc = "Toggle NvimTree" })
    end,
    lazy = false,
  },
} 
