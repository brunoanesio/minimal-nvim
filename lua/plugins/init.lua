local add, now, later = MiniDeps.add, MiniDeps.now, MiniDeps.later

-- Colorscheme
now(function()
  add "catppuccin/nvim"
  local opts = require "plugins.catppuccin"
  require("catppuccin").setup(opts)
  vim.cmd.colorscheme "catppuccin"
end)

-- Mini stuff
now(function()
  require("mini.basics").setup {
    options = {
      basic = true,
      win_borders = "single",
    },
    mappings = {
      basic = true,
      windows = true,
    },
    autocommands = {
      basic = true,
      relnum_in_visual_mode = true,
    },
  }
end)
now(function()
  require("mini.notify").setup()
  vim.notify = require("mini.notify").make_notify()
end)
now(function()
  require("mini.tabline").setup()
end)
now(function()
  require("mini.sessions").setup {
    autoread = false,
    autowrite = true,
  }
end)
now(function()
  require("mini.statusline").setup()
end)
later(function()
  require("mini.ai").setup()
end)
later(function()
  require("mini.bracketed").setup()
end)
later(function()
  require("mini.comment").setup {
    mappings = {
      comment = "gc",
      comment_line = "gcc",
      textobject = "gc",
    },
  }
end)
later(function()
  require("mini.diff").setup()
end)
later(function()
  require("mini.files").setup()
end)
later(function()
  local hipatterns = require "mini.hipatterns"
  require("mini.hipatterns").setup {
    highlighters = {
      -- Highlight standalone 'FIXME', 'HACK', 'TODO', 'NOTE'
      fixme = { pattern = "%f[%w]()FIXME()%f[%W]", group = "MiniHipatternsFixme" },
      hack = { pattern = "%f[%w]()HACK()%f[%W]", group = "MiniHipatternsHack" },
      todo = { pattern = "%f[%w]()TODO()%f[%W]", group = "MiniHipatternsTodo" },
      note = { pattern = "%f[%w]()NOTE()%f[%W]", group = "MiniHipatternsNote" },

      -- Highlight hex color strings (`#rrggbb`) using that color
      hex_color = hipatterns.gen_highlighter.hex_color(),
    },
  }
end)
later(function()
  require("mini.indentscope").setup {
    -- symbol = "│",
    symbol = "▎",
    options = { try_as_border = true },
  }
  vim.api.nvim_create_autocmd("Filetype", {
    pattern = { "markdown", "lspsagafinder", "help", "dashboard", "notify", "mason" },
    callback = function()
      vim.b.miniindentscope_disable = true
    end,
  })
end)
later(function()
  require("mini.operators").setup()
end)
later(function()
  require("mini.pairs").setup()
end)
later(function()
  require("mini.pick").setup()
end)
later(function()
  require("mini.surround").setup()
end)

-- Other Useful plugins
now(function()
  add {
    source = "nvim-treesitter/nvim-treesitter",
    checkout = "master",
    monitor = "main",
    hooks = {
      post_checkout = function()
        vim.cmd "TSUpdate"
      end,
    },
  }
  require("nvim-treesitter.configs").setup {
    sync_install = false,
    auto_install = true,

    ensure_installed = { "lua", "vimdoc" },

    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
    },
    context_commenstring = {
      enable = true,
      enable_autocmd = false,
    },
  }
end)
