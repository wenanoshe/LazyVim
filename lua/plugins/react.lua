return {
  -- LSPs are already managed by LazyVim’s defaults
  -- But we can extend TypeScript config:
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        ts_ls = {
          settings = {
            typescript = {
              format = { semicolons = "remove" },
            },
          },
        },
      },
    },
  },

  -- Prettier formatter
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        javascript = { "prettier" },
        javascriptreact = { "prettier" },
        typescript = { "prettier" },
        typescriptreact = { "prettier" },
        json = { "prettier" },
        css = { "prettier" },
        html = { "prettier" },
        blade = { "blade-formatter" },
      },
    },
  },
}
