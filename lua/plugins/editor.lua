local Util = require("lazyvim.util")
return {
  { "nvim-neo-tree/neo-tree.nvim", enabled = false },

  -- nvim-tree
  -- local HEIGHT_RATIO = 0.8 -- You can change this
  -- local WIDTH_RATIO = 0.5 -- You can change this took

  {
    "nvim-tree/nvim-tree.lua",
    lazy = false,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      local nvimtree = require("nvim-tree")

      -- recommended settings from nvim-tree documentation
      vim.g.loaded_netrw = 1
      vim.g.loaded_netrwPlugin = 1

      -- change color for arrows in tree to light blue
      vim.cmd([[ highlight NvimTreeFolderArrowClosed guifg=#3FC5FF ]])
      vim.cmd([[ highlight NvimTreeFolderArrowOpen guifg=#3FC5FF ]])

      -- configure nvim-tree
      nvimtree.setup({
        on_attach = "default",
        hijack_cursor = false,
        auto_reload_on_write = true,
        disable_netrw = false,
        hijack_netrw = true,
        hijack_unnamed_buffer_when_opening = false,
        view = {
          -- width = 35,
          relativenumber = true,
          number = true,
          -- float = {
          -- 	enable = true,
          -- 	open_win_config = function()
          -- 		local screen_w = vim.opt.columns:get()
          -- 		local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
          -- 		local window_w = screen_w * WIDTH_RATIO
          -- 		local window_h = screen_h * HEIGHT_RATIO
          -- 		local window_w_int = math.floor(window_w)
          -- 		local window_h_int = math.floor(window_h)
          -- 		local center_x = (screen_w - window_w) / 2
          -- 		local center_y = ((vim.opt.lines:get() - window_h) / 2) - vim.opt.cmdheight:get()
          -- 		return {
          -- 			border = "rounded",
          -- 			relative = "editor",
          -- 			row = center_y,
          -- 			col = center_x,
          -- 			width = window_w_int,
          -- 			height = window_h_int,
          -- 		}
          -- 	end,
          -- },
        },
        -- change folder arrow icons
        renderer = {
          indent_markers = {
            enable = true,
            icons = {
              corner = "󱞩 ",
              edge = "│ ",
              item = "󱞩 ",
              -- edge = " │ ",
              -- item = " │ ",
              none = "  ",
            },
          },
          icons = {
            glyphs = {
              folder = {
                arrow_closed = "", -- arrow when folder is closed
                arrow_open = "", -- arrow when folder is open
              },
            },
          },
        },
        -- disable window_picker for
        -- explorer to work well with
        -- window splits
        actions = {
          open_file = {
            window_picker = {
              enable = false,
            },
          },
        },
        filters = {
          custom = { ".DS_Store" },
        },
        git = {
          ignore = false,
        },
      })
    end,
  },

  -- gitsigns
  {
    "lewis6991/gitsigns.nvim",
    event = "LazyFile",
    opts = {
      signs = {
        add = { text = "▎" },
        change = { text = "▎" },
        delete = { text = "" },
        topdelete = { text = "" },
        changedelete = { text = "▎" },
        untracked = { text = "▎" },
      },
      on_attach = function(buffer)
        local gs = package.loaded.gitsigns

        local function map(mode, l, r, desc)
          vim.keymap.set(mode, l, r, { buffer = buffer, desc = desc })
        end

      -- stylua: ignore start
      map("n", "]h", gs.next_hunk, "Next Hunk")
      map("n", "[h", gs.prev_hunk, "Prev Hunk")
      map({ "n", "v" }, "<leader>ghs", ":Gitsigns stage_hunk<CR>", "Stage Hunk")
      map({ "n", "v" }, "<leader>ghr", ":Gitsigns reset_hunk<CR>", "Reset Hunk")
      map("n", "<leader>ghS", gs.stage_buffer, "Stage Buffer")
      map("n", "<leader>ghu", gs.undo_stage_hunk, "Undo Stage Hunk")
      map("n", "<leader>ghR", gs.reset_buffer, "Reset Buffer")
      map("n", "<leader>ghp", gs.preview_hunk, "Preview Hunk")
      map("n", "<leader>ghb", function() gs.blame_line({ full = true }) end, "Blame Line")
      map("n", "<leader>ghd", gs.diffthis, "Diff This")
      map("n", "<leader>ghD", function() gs.diffthis("~") end, "Diff This ~")
      map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", "GitSigns Select Hunk")
      end,
    },
  },
  --
  -- -- Telescope
  -- {
  --   "nvim-telescope/telescope.nvim",
  --   config = function()
  --     require("telescope").setup({
  --       defaults = {
  --         prompt_prefix = "󱞩 ",
  --         selection_caret = " ",
  --         path_display = { "smart" },
  --         file_ignore_patterns = {
  --           ".git",
  --         },
  --         -- -- include .github directory
  --         -- file_include_patterns = {
  --         -- 	".github/**",
  --         -- 	".gitignore",
  --         -- },
  --       },
  --       pickers = {
  --         find_files = {
  --           theme = "dropdown",
  --           previewer = true,
  --           hidden = true,
  --         },
  --         live_grep = {
  --           theme = "dropdown",
  --           previewer = true,
  --         },
  --         buffers = {
  --           theme = "dropdown",
  --           previewer = true,
  --         },
  --       },
  --     })
  --   end,
  -- },
}
