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
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- アイコン表示
      "MunifTanjim/nui.nvim",
    },
    config = function()
      require("neo-tree").setup({
        -- 基本設定例
        window = {
          position = "left", -- "right"や"float"も指定可能
          width = 35,
        },
        filesystem = {
          bind_to_cwd = false,
          cwd_target = "none",
          filtered_items = {
            hide_dotfiles = false,
            hide_gitignored = false,
          },
        },
        event_handlers = {
          {
            event = "file_open_requested",
            handler = function()
              -- auto close
              print("aaaa")
              vim.cmd("Neotree close")
            end
          },
        },
      })
      vim.keymap.set("n", "<leader>e", "<Cmd>Neotree toggle<CR>", { desc = "Neo-tree Toggle" })

      vim.api.nvim_create_autocmd("BufEnter", {
        pattern = "*",
        callback = function()
          local buftype = vim.api.nvim_buf_get_option(0, "buftype")
          local ft = vim.api.nvim_buf_get_option(0, "filetype")
          local name = vim.api.nvim_buf_get_name(0)
          -- ディレクトリの場合
          if buftype == "" and ft == "" and name ~= "" and vim.fn.isdirectory(name) == 1 then
            vim.schedule(function()
              vim.cmd("Neotree reveal dir=" .. name)
            end)
          end
        end,
        desc = "Open neo-tree when opening a directory with :e",
      })


    end,
    lazy = false, -- 初期化を遅延させない
  },
}
