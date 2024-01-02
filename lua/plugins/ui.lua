local Util = require("lazyvim.util")
return {
  { import = "plugins.extras.ui.ui" },

  -- bufferline disable
  { "akinsho/bufferline.nvim", enabled = false },

  -- lualine
  -- {
  --   "nvim-lualine/lualine.nvim",
  --   lazy = false,
  --   config = function()
  --     require("lualine").setup({
  --       options = {
  --         -- colorscheme = "tokyonight",
  --         colorscheme = "catppuccin",
  --         globalstatus = true,
  --         component_separators = { left = "", right = "" },
  --         section_separators = { left = "", right = "" },
  --         -- make lualine hidden when alpha is shown
  --         disabled_filetypes = { "alpha", "dashboard" },
  --       },
  --       sections = {
  --         lualine_a = { "mode" },
  --         lualine_b = {
  --           "buffers",
  --         },
  --         lualine_c = { "branch", "diff", "diagnostics" },
  --         lualine_x = {},
  --         lualine_y = {},
  --         lualine_z = { "location" },
  --       },
  --     })
  --   end,
  -- },
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
        table.insert(opts.sections.lualine_x, 2, require("lazyvim.util").lualine.cmp_source("codeium")),
      }
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
}
