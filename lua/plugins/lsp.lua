local add, now, later = MiniDeps.add, MiniDeps.now, MiniDeps.later

now(function()
  add { source = "neovim/nvim-lspconfig", depends = { "williamboman/mason.nvim", "williamboman/mason-lspconfig.nvim" } }
end)
now(function()
  add {
    source = "hrsh7th/nvim-cmp",
    depends = { "hrsh7th/cmp-nvim-lsp", "hrsh7th/cmp-path", "saadparwaiz1/cmp_luasnip", "hrsh7th/cmp-buffer" },
  }
end)
now(function()
  add { source = "L3MON4D3/LuaSnip", depends = { "rafamadriz/friendly-snippets" } }
  require("luasnip.loaders.from_vscode").lazy_load()
end)
later(function()
  add { source = "Exafunction/codeium.nvim", depends = { "nvim-lua/plenary.nvim" } }
  require("codeium").setup {
    enable_chat = true,
  }
end)

vim.api.nvim_create_autocmd("LspAttach", {
  desc = "LSP actions",
  callback = function(event)
    local opts = { buffer = event.buf }

    vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
    vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
    vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts)
    vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts)
    vim.keymap.set("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>", opts)
    vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", opts)
    vim.keymap.set("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts)
    vim.keymap.set("n", "<F2>", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
    vim.keymap.set({ "n", "x" }, "<F3>", "<cmd>lua vim.lsp.buf.format({async = true})<cr>", opts)
    vim.keymap.set("n", "<F4>", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
  end,
})

local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()

local default_setup = function(server)
  require("lspconfig")[server].setup {
    capabilities = lsp_capabilities,
  }
end

require("mason").setup {
  ui = {
    border = "single",
    icons = {
      package_installed = "󰄳 ",
      package_pending = " ",
      package_uninstalled = " ",
    },
  },
}
require("mason-lspconfig").setup {
  ensure_installed = {},
  handlers = {
    default_setup,
    lua_ls = function()
      require("lspconfig").lua_ls.setup {
        capabilities = lsp_capabilities,
        settings = {
          Lua = {
            runtime = {
              version = "LuaJIT",
            },
            diagnostics = {
              globals = { "vim" },
            },
            workspace = {
              library = {
                vim.env.VIMRUNTIME,
              },
            },
            format = {
              enable = false,
            },
          },
        },
      }
    end,
  },
}

local cmp = require "cmp"
local luasnip = require "luasnip"

cmp.setup {
  sources = {
    { name = "codeium" },
    { name = "luasnip" },
    { name = "nvim_lsp" },
    { name = "buffer" },
    { name = "path" },
  },
  mapping = cmp.mapping.preset.insert {
    ["<C-p>"] = cmp.mapping.select_prev_item(),
    ["<C-n>"] = cmp.mapping.select_next_item(),
    ["<CR>"] = cmp.mapping.confirm { select = false },
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-c>"] = cmp.mapping {
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    },
    ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
    ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expandable() then
        luasnip.expand()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, {
      "i",
      "s",
    }),
  },
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  experimental = { ghost_text = true },
  window = {
    completion = cmp.config.window.bordered {
      scrollbar = true,
      border = "single",
      col_offset = -1,
      side_padding = 0,
    },
    documentation = cmp.config.window.bordered {
      scrollbar = true,
      border = "single",
    },
  },
}

later(function()
  add "stevearc/conform.nvim"
  require("conform").setup {
    format_on_save = {
      timeout_ms = 500,
      lsp_fallback = true,
    },
    formatters_by_ft = {
      lua = { "stylua" },
      sh = { "shfmt" },
      rust = { "rustfmt" },
      toml = { "taplo" },
      json = { "prettierd" },
    },
  }
end)
