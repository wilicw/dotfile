---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["<leader>tb"] = {
      function()
        require'dap'.toggle_breakpoint()
      end,
      "toggle breakpoint",
    },
    ["<leader>db"] = {
      function()
        require'dapui'.toggle()
      end,
      "toggle dap-ui"
    }
  },
}

return M
