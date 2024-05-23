-- General options are held here
vim.g.mapleader = ' '
vim.opt.number = true
vim.opt.relativenumber = true
--tab width
vim.opt.tabstop = 4
-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
-- when yanking send to clipboard
vim.opt.clipboard.append(vim.opt.clipboard, 'unnamedplus')

-- Preview substitutions live, as you type!
vim.opt.inccommand = 'split'

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10
vim.opt.title = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.smarttab = true
vim.opt.ignorecase = true
vim.opt.breakindent = true
vim.opt.backspace = { 'indent', 'eol', 'indent' }
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.splitkeep = 'cursor'
vim.opt.mouse = ''
