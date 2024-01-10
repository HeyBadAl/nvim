return {
  -- drop
  {
    "folke/drop.nvim",
    event = "VimEnter",
    config = function()
      require("drop").setup({
        theme = "leaves", -- leaves, snow, stars, xmas, spring, summer
        max = 30,
        screensaver = 1000 * 60 * 5, -- show after 2 minutes. Set to false, to disable
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
}
