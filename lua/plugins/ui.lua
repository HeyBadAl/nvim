local Util = require("lazyvim.util")
return {
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
    event = "VeryLazy",
    init = function()
      vim.g.lualine_laststatus = vim.o.laststatus
      if vim.fn.argc(-1) > 0 then
        -- set an empty statusline till lualine loads
        vim.o.statusline = " "
      else
        -- hide the statusline on the starter page
        vim.o.laststatus = 0
      end
    end,
    opts = function()
      -- PERF: we don't need this lualine require madness 🤷
      local lualine_require = require("lualine_require")
      lualine_require.require = require

      local icons = require("lazyvim.config").icons

      vim.o.laststatus = vim.g.lualine_laststatus

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
          lualine_z = {
            "location",
          },
        },
        extensions = { "neo-tree", "lazy" },
      }
    end,
  },
}
