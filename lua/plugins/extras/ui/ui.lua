return {
  -- drop
  {
    "folke/drop.nvim",
    event = "VimEnter",
    config = function()
      require("drop").setup({
        theme = "xmas", -- leaves, snow, stars, xmas, spring, summer
      })
    end,
  },

  -- tailwind-colorizer-cmp
  {
    "roobert/tailwindcss-colorizer-cmp.nvim",
    -- optionally, override the default options:
    config = function()
      require("tailwindcss-colorizer-cmp").setup({
        color_square_width = 2,
      })
    end,
  },

  -- vim-maximizer
  {
    "szw/vim-maximizer",
    keys = {
      { "<leader>am", "<cmd>MaximizerToggle<CR>", desc = "Maximize/minimize a split" },
    },
  },
}
