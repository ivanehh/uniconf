require("base.keybindings")
require("base.autocmds")
require("base.options")
require("base.lazy")
vim.keymap.set('n', '<leader>w', '<cmd>w<CR>')
-- vim.g.python3_host_prog = vim.cmd("!which python3")
-- vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWinEnter' }, {
-- 	pattern = { "*.hl", "hypr*.conf" },
-- 	callback = function(event)
-- 		print(string.format("starting hyprls for %s", vim.inspect(event)))
-- 		vim.lsp.start({
-- 			name = "hyprlang",
-- 			cmd = { "hyprls" },
-- 			root_dir = vim.fn.getcwd()
-- 		})
-- 	end
-- })
