return {
  {
    "skywind3000/asyncrun.vim",
    lazy = false,
  },
  {
    "github/copilot.vim",
    event = "InsertEnter",
    config = function()
      vim.cmd(":AsyncRun! Copilot setup")
      vim.cmd('imap <silent><script><expr> <C-]> copilot#Accept("")')
      vim.cmd("let g:copilot_no_tab_map = v:true")
    end,
  },
}
