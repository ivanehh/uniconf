local opt = vim.opt
-- General options are held here
vim.g.mapleader = ' '
opt.number = true
opt.relativenumber = true
vim.cmd 'let g:netrw_liststyle=3'
--tab width
opt.tabstop = 4
-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
opt.list = true
opt.listchars = { tab = '  ', trail = '·', nbsp = '␣' }
-- when yanking send to clipboard
opt.clipboard.append(vim.opt.clipboard, 'unnamedplus')

-- Preview substitutions live, as you type!
opt.inccommand = 'split'

-- Show which line your cursor is on
opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
opt.scrolloff = 10
opt.title = true
opt.autoindent = true
opt.smartindent = true
opt.smarttab = true
opt.ignorecase = true
opt.breakindent = true
opt.backspace = { 'indent', 'eol', 'indent' }
opt.splitbelow = true
opt.splitright = true
opt.splitkeep = 'cursor'
opt.mouse = ''
