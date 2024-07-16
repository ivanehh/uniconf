return {
  'VonHeikemen/fine-cmdline.nvim',
  dependencies = {
    'MunifTanjim/nui.nvim',
  },
  opts = function()
    vim.api.nvim_set_keymap(NMODE, ':', '<cmd>FineCmdline<CR>', { noremap = true, desc = 'launches a nice gui for command execution' })
  end,
}
