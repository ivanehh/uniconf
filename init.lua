if vim.g.vscode then
	require("base.vscode_keybindings")
else
	require("base.lazy")
	require("base.autocmds")
	require("base.options")
	require("base.keybindings")
	vim.keymap.set('n', '<leader>w', '<cmd>w<CR>')
end
