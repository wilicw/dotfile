return {
  {
    "L3MON4D3/LuaSnip",
    -- follow latest release.
    version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
  },
  {
    "saghen/blink.cmp",
    opts = {
      keymap = {
        ["<Up>"] = { "select_prev", "fallback" },
        ["<Down>"] = { "select_next", "fallback" },
        ["<C-k>"] = { "select_prev", "fallback" },
        ["<C-j>"] = { "select_next", "fallback" },
        ["<Tab>"] = { "select_next", "fallback" },
        ["<C-p>"] = { "select_prev", "fallback_to_mappings" },
        ["<C-n>"] = { "select_next", "fallback_to_mappings" },
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = { enabled = false },
    },
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

        -- c/cpp stuff
        "clangd",
        "clang-format",
        "cmakelang",
        "pyright",
      },
    },
  },
}
