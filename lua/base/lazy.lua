-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out,                            "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
require("lazy").setup({
	spec = {
		-- import your plugins
		{
			require("plugins.colorscheme"),
			require('plugins.dap'),
			require('plugins.linter.nvim-lint'),
			require("plugins.mini"),
			require("plugins.lualine"),
			require("plugins.telescope"),
			require("plugins.treesitter"),
			require('plugins.lsp.mason'),
			require('plugins.lsp.lspconfig'),
			require('plugins.dressing'),
			require('plugins.nvim-cmp'),
			require('plugins.vim-tmux'),
			require('plugins.trouble'),
			require('plugins.todo-comments'),
			require('plugins.repl'),
			require('plugins.nvim-notify'),
			require('plugins.oil'),
			require('plugins.gitsigns'),
			require('plugins.vim-go'),
			require('plugins.lsp.py.black'),
			require('plugins.lsp.py.isort'),
			require('plugins.lsp.py.debug-py'),
			require 'plugins.yuck',
			require 'plugins.parinfer',
		},
	},
	-- Configure any other settings here. See the documentation for more details.
	-- colorscheme that will be used when installing plugins.
	install = { colorscheme = { "habamax" } },
	-- automatically check for plugin updates
	checker = { enabled = true },
	change_detection = {
		notify = false },
})
