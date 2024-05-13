return {
  default_integrations = true,
  integrations = {
    cmp = true,
    treesitter = true,
    mini = {
      enabled = true,
      indentscope_color = "",
    },
    -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
    telescope = { enabled = true, style = "nvchad" },
    mason = true,
  },
  custom_highlights = function(colors)
    return {
      NeoTreeWinSeparator = { fg = colors.base, bg = colors.base },
      DiagnosticVirtualTextError = { fg = colors.red, bg = colors.none },
      DiagnosticVirtualTextWarn = { fg = colors.yellow, bg = colors.none },
      DiagnosticVirtualTextInfo = { fg = colors.sky, bg = colors.none },
      DiagnosticVirtualTextHint = { fg = colors.teal, bg = colors.none },
    }
  end,
}
