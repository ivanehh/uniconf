return {
  'folke/todo-comments.nvim',
  event = 'VimEnter',
  dependencies = { 'nvim-lua/plenary.nvim' },
  opts = { signs = true },
  -- Todo-comments
  vim.keymap.set(NMODE, '<leader>lc', '<cmd>TodoLocList<CR>', { desc = '[l]ocation [c]omments in project' }),
}
