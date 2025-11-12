return {
  "Exafunction/windsurf.vim",
  event = "BufEnter",
  config = function()
    -- Disable for specific filetypes (example)
    vim.g.codeium_filetypes = {
      env = false,
      text = false,
    }
  end,
}
