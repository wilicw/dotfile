---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["<C-b>"] = {
      function()
        require'dap'.toggle_breakpoint()
      end,
      "toggle breakpoint",
    },
    ["<F5>"] = {
      function()
        require'dapui'.toggle()
        vim.cmd(':NvimTreeResize 45')
      end,
      "toggle dap-ui"
    }
  },
}

return M
