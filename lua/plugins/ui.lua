return {
  { import = "plugins.extras.ui.ui" },

  -- bufferline disable
  { "akinsho/bufferline.nvim", enabled = false },

  {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
      return {
        options = {
          theme = "auto",
          globalstatus = true,
          disabled_filetypes = { statusline = { "dashboard", "alpha", "starter" } },
        },
        sections = {
          lualine_a = { "mode" },
          lualine_b = { "buffers" },
          lualine_c = { "branch", "diff", "diagnostics" },
          lualine_x = {
            { "filetype", icon_only = true, separator = " ", padding = { left = 1, right = 1 } },
          },
          lualine_y = { "progress" },
          lualine_z = { "location" },
        },
      }
    end,
  },

  -- noice
  {
    "folke/noice.nvim",
    opts = function(_, opts)
      table.insert(opts.routes, {
        filter = {
          event = "notify",
          find = "No information available",
        },
        opts = { skip = true },
      })
      opts.presets.lsp_doc_border = true
    end,
  },

  -- notify
  {
    "rcarriga/nvim-notify",
    opts = {
      timeout = 3000,
      background_colour = "#000000",
      stages = "fade",
      render = "compact",
    },
  },

  -- dashboard
  {
    "nvimdev/dashboard-nvim",
    event = "vimEnter",
    opts = function(_, opts)
      --  https://patorjk.com/software/taag/#p=display&f=ANSI%20Shadow&t=
      local logo = [[
██████╗  █████╗ ██████╗          █████╗ ██╗
██╔══██╗██╔══██╗██╔══██╗        ██╔══██╗██║
██████╔╝███████║██║  ██║        ███████║██║
██╔══██╗██╔══██║██║  ██║        ██╔══██║██║
██████╔╝██║  ██║██████╔╝███████╗██║  ██║██║
╚═════╝ ╚═╝  ╚═╝╚═════╝ ╚══════╝╚═╝  ╚═╝╚═╝
]]
      logo = string.rep("\n", 8) .. logo .. "\n\n"
      opts.config.header = vim.split(logo, "\n")
    end,
  },

  -- zen mode
  {
    "folke/zen-mode.nvim",
    cmd = "ZenMode",
    opts = {
      plugins = {
        gitsigns = true,
        tmux = true,
        kitty = { enabled = false, font = "+2" },
      },
    },
    keys = { { "<leader>z", "<cmd>ZenMode<cr>", desc = "Zen Mode" } },
  },
}
