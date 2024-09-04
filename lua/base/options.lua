local opt = vim.opt
-- General options are held here
vim.g.mapleader = ' '
opt.number = true
opt.relativenumber = true
opt.wrap = false
opt.hlsearch = false
opt.incsearch = true
opt.termguicolors = true
vim.cmd 'let g:netrw_liststyle=3'

--tab width
opt.tabstop = 2
opt.shiftwidth = 0

--folding
opt.foldmethod = "expr"
opt.foldexpr = vim.treesitter.foldexpr()
vim.opt.foldcolumn = "0"

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
-- Search
opt.smartcase = true
opt.ignorecase = true

-- Indentation
opt.autoindent = true
opt.smartindent = true
opt.smarttab = true

-- Minimal number of screen lines to keep above and below the cursor.
opt.scrolloff = 10
opt.title = true
opt.ignorecase = true
opt.breakindent = true
opt.backspace = { 'indent', 'eol', 'indent' }
opt.splitbelow = true
opt.splitright = true
opt.splitkeep = 'cursor'
opt.mouse = 'a'
vim.cmd.highlight("Visual cterm=bold gui=bold guifg=#dcd7ba guibg=#2d4f67")


-- special filetypes
vim.filetype.add(
	{ pattern = { [".*/hypr/.*%.conf"] = 'hyprlang' }, }
)
