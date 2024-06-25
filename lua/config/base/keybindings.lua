-- Write buffers
vim.keymap.set(NMODE, '<leader>w', '<cmd>w<CR>', { desc = 'Writes the current buffer to its file' })
-- Diagnostic keymaps
vim.keymap.set(NMODE, '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set(NMODE, ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set(NMODE, '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set(NMODE, '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Disable arrow keys
vim.keymap.set(NMODE, '<left>', '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set(NMODE, '<right>', '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set(NMODE, '<up>', '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set(NMODE, '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands

vim.keymap.set(NMODE, '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set(NMODE, '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set(NMODE, '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set(NMODE, '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

vim.keymap.set(INMODE, 'jj', '<Esc>')
-- Manage panes
vim.keymap.set(NMODE, '<leader>pc', '<cmd>close<CR>', { desc = 'Close current pane' })
vim.keymap.set(NMODE, '<leader>pv', '<C-w>v', { desc = 'Split pane vertically' })
vim.keymap.set(NMODE, '<leader>ps', '<C-w>s', { desc = 'Split pane horizontally' })
vim.keymap.set(NMODE, '<leader>pe', '<C-w>=', { desc = 'Split window evenly between panes' })
--
-- Manage tabs
vim.keymap.set(NMODE, '<leader><tab>n', '<cmd>tabnew<CR>', { desc = 'Make new tab' })
vim.keymap.set(NMODE, '<leader><tab>nwb', '<cmd>tabnew %<CR>', { desc = 'Make new tab with the current buffer open' })
vim.keymap.set(NMODE, '<leader><tab>c', '<cmd>tabclose<CR>', { desc = 'Close current tab' })
vim.keymap.set(NMODE, '<leader><tab>0', '<cmd>tabfirst<CR>', { desc = 'Go to the first tab' })
vim.keymap.set(NMODE, '<leader><tab>$', '<cmd>tablast<CR>', { desc = 'Go to the last tab' })
vim.keymap.set(NMODE, '<leader><tab>h', '<cmd>tabprevious<CR>', { desc = 'Go to the previous tab according to tab sequence' })
vim.keymap.set(NMODE, '<leader><tab>l', '<cmd>tabnext<CR>', { desc = 'Go to the next tab accordig to tab sequence' })
--
-- Manage buffers
vim.keymap.set(NMODE, '<leader>lb', '<cmd>buffers<CR>')
vim.keymap.set(NMODE, '<leader>gb', '<cmd>:ls<CR>:b<Space>', { desc = 'open a list of buffers and await choice' })

-- Golang keymaps
local function go_keymaps()
  vim.api.nvim_buf_set_keymap(0, NMODE, '<leader>t', '<cmd>GoTestFunc<CR>', { noremap = true, desc = 'run the function the cursor is in or on' })
  vim.api.nvim_buf_set_keymap(0, NMODE, '<leader>T', '<cmd>GoTest<CR>', { noremap = true, desc = 'run the function the cursor is in or on' })
end

local go_group = vim.api.nvim_create_augroup('GoKeymaps', { clear = true })

vim.api.nvim_create_autocmd('FileType', {
  group = go_group,
  pattern = 'go',
  callback = go_keymaps,
})
