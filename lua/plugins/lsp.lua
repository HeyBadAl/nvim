return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        cssls = {
          tailwindcss = {
            root_dir = function(...)
              return require("lspconfig.util").root_pattern(".git")(...)
            end,
          },
        },
      },
    },
  },
}
