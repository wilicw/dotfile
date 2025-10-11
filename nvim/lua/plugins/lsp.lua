return {
  {
    "L3MON4D3/LuaSnip",
    -- follow latest release.
    version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
    -- install jsregexp (optional!).
    build = "make install_jsregexp",
  },
  {
    "hrsh7th/nvim-cmp",
    opts = function()
      local cmp = require("cmp")
      return {
        mapping = cmp.mapping.preset.insert({
          ["<Up>"] = cmp.mapping.select_prev_item(),
          ["<Down>"] = cmp.mapping.select_next_item(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
          ["<Tab>"] = cmp.mapping.confirm({ select = true }),
          ["<C-j>"] = cmp.mapping(function(fallback)
            if require("luasnip").jumpable(1) then
              require("luasnip").jump(1)
            else
              fallback()
            end
          end, { "i", "s" }),
          ["<C-k>"] = cmp.mapping(function(fallback)
            if require("luasnip").jumpable(-1) then
              require("luasnip").jump(-1)
            else
              fallback()
            end
          end, { "i", "s" }),
        }),
      }
    end,
  },
  {
    "stevearc/conform.nvim",
    opts = {},
  },
  {
    "mason-org/mason.nvim",
    opt = {
      ensure_installed = {
        -- lua stuff
        "lua-language-server",
        "stylua",

        -- web dev stuff
        "css-lsp",
        "html-lsp",
        "typescript-language-server",
        "deno",
        "prettier",

        -- c/cpp stuff
        "clangd",
        "clang-format",
        "cmakelang",
        "pyright",
      },
    },
  },
}
