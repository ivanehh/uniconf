vim.g.mapleader = " "
NMODE = 'n'
INMODE = 'i'
TMODE = 't'
VMODE = 'v'
-- Write buffers
vim.keymap.set(NMODE, '<leader>w', '<cmd>w<CR>', { desc = 'Writes the current buffer to its file' })
vim.keymap.set(NMODE, '<leader>W', '<cmd>wa<CR>', { desc = 'Writes all changed buffers to their files' })
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

vim.keymap.set(NMODE, '<C-h>', '<C-w><C-h>', { noremap = true, desc = 'Move focus to the left window' })
vim.keymap.set(NMODE, '<C-l>', '<C-w><C-l>', { noremap = true, desc = 'Move focus to the right window' })
vim.keymap.set(NMODE, '<C-j>', '<C-w><C-j>', { noremap = true, desc = 'Move focus to the lower window' })
vim.keymap.set(NMODE, '<C-k>', '<C-w><C-k>', { noremap = true, desc = 'Move focus to the upper window' })

vim.keymap.set(INMODE, 'jj', '<Esc>')
-- Manage panes
vim.keymap.set(NMODE, '<leader>pc', '<cmd>close<CR>', { desc = 'Close current pane' })
vim.keymap.set(NMODE, '<leader>pv', '<C-w>v', { desc = 'Split pane vertically' })
vim.keymap.set(NMODE, '<leader>ps', '<C-w>s', { desc = 'Split pane horizontally' })
vim.keymap.set(NMODE, '<leader>pe', '<C-w>=', { desc = 'Split window evenly between panes' })
-- Manage tabs
vim.keymap.set(NMODE, '<leader><tab>n', '<cmd>tabnew<CR>', { desc = 'Make new tab' })
vim.keymap.set(NMODE, '<leader><tab>nwb', '<cmd>tabnew %<CR>', { desc = 'Make new tab with the current buffer open' })
vim.keymap.set(NMODE, '<leader><tab>c', '<cmd>tabclose<CR>', { desc = 'Close current tab' })
vim.keymap.set(NMODE, '<leader><tab>0', '<cmd>tabfirst<CR>', { desc = 'Go to the first tab' })
vim.keymap.set(NMODE, '<leader><tab>$', '<cmd>tablast<CR>', { desc = 'Go to the last tab' })
vim.keymap.set(NMODE, '<leader><tab>h', '<cmd>tabprevious<CR>',
	{ desc = 'Go to the previous tab according to tab sequence' })
vim.keymap.set(NMODE, '<leader><tab>l', '<cmd>tabnext<CR>', { desc = 'Go to the next tab accordig to tab sequence' })
-- Plugin Keybinds
vim.keymap.set(NMODE, '<leader>g', '<cmd>Gitsigns<CR>', { desc = "Launch Gitsigns" })
vim.keymap.set(NMODE, '<leader>gj', '<cmd>Gitsigns next_hunk<CR>', { desc = "Go to next hunk" })
vim.keymap.set(NMODE, '<leader>gk', '<cmd>Gitsigns prev_hunk<CR>', { desc = "Go to previous hunk" })

-- DAP Keybinds
local dap = require('dap')
local dapui = require('dapui')
vim.keymap.set(NMODE, '<leader>dt', dapui.toggle, { noremap = true, desc = "Toggle the DAP UI" })
vim.keymap.set(NMODE, '<leader>db', dap.toggle_breakpoint, { noremap = true, desc = "Toggle the DAP UI" })
vim.keymap.set(NMODE, '<leader>dc', dap.continue, { noremap = true, desc = "Next breakpoint;Continue debugging" })
vim.keymap.set(NMODE, '<leader>dt', dap.up, { noremap = true, desc = "Toggle the DAP UI" })
vim.keymap.set(NMODE, '<leader>dt', dapui.toggle, { noremap = true, desc = "Toggle the DAP UI" })


-- Todo Keybinds
vim.keymap.set(NMODE, '<leader>lc', '<cmd>TodoLocList<CR>', { desc = '[l]ocation [c]omments in project' })


-- Oil Keybinds
vim.keymap.set(NMODE, '<leader>e', '<cmd>Oil<CR>', { desc = 'Open Oil' })
