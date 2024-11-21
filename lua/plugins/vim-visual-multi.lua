return {
  "mg979/vim-visual-multi",
  branch = "master",
  event = "InsertEnter",
  config = function()
    vim.cmd [[
    nmap <M-C-j> <Plug>(VM-Add-Cursor-Down)
    nmap <M-C-k> <Plug>(VM-Add-Cursor-Up)
    ]]
  end,
}
