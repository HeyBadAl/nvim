return {
  {
    "catppuccin/nvim",
    lazy = false,
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        flavour = "mocha", -- latte, frappe, macchiato, mocha
        transparent_background = true,
        show_end_of_buffer = false,

        integrations = {
          alpha = true,
          leap = true,
          indent_blankline = true,
          mason = true,
          markdown = true,
          treesitter = true,
          treesitter_context = true,
          which_key = true,
          noice = true,
          cmp = true,
          gitsigns = true,
          nvimtree = true,
          telescope = true,
          notify = true,
          mini = true,
        },
        color_overrides = {
          mocha = {
            base = "#000000",
            mantle = "#000000",
            crust = "#000000",
          },
        },
      })
      vim.cmd("colorscheme catppuccin")
    end,
  },
}
