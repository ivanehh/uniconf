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
-- Manage buffers
vim.keymap.set(NMODE, '<leader>gb', '<cmd>:ls<CR>:b<Space>', { desc = 'open a list of buffers and await choice' })
