return {
  "nvim-lualine/lualine.nvim",
  opts = function(_, opts)
    -- Add git blame at the end of lualine_x (after existing items)
    table.insert(opts.sections.lualine_x, 1, {
      function()
        if not vim.b.gitsigns_blame_line then
          return ""
        end

        local blame = vim.b.gitsigns_blame_line
        if blame:match("^Not Committed Yet") or blame == "" then
          return ""
        end

        -- Calculate max width as percentage of window width (e.g., 30%)
        local max_width_percentage = 0.3
        local win_width = vim.api.nvim_win_get_width(0)
        local max_width = math.floor(win_width * max_width_percentage)

        -- Truncate if too long
        if #blame > max_width then
          blame = blame:sub(1, max_width - 3) .. "..."
        end

        return "󰀄 " .. blame
      end,
      color = { fg = "#7aa2f7" },
    })

    -- Keep your other customizations
    opts.sections.lualine_c = {}
    opts.sections.lualine_z = {
      {
        "filetype",
        colored = false,
        icon_only = false,
      },
    }

    return opts
  end,
}
