local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- remap leader key
keymap("n", "<Space>", "", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- yank to system clipboard
keymap({ "n", "v" }, "<leader>y", '"+y', opts)

-- paste from system clipboard
keymap({ "n", "v" }, "<leader>p", '"+p', opts)

-- better indent handling
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- move text up and down
keymap("v", "J", ":m .+1<CR>==", opts)
keymap("v", "K", ":m .-2<CR>==", opts)
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)

-- paste preserves primal yanked piece
keymap("v", "p", '"_dP', opts)

-- removes highlighting after escaping vim search
keymap("n", "<Esc>", "<Esc>:noh<CR>", opts)


-- call vscode commands from neovim

-- general keymaps
keymap({ "n", "v" }, "<leader>t", "<cmd>lua require('vscode').action('workbench.action.terminal.toggleTerminal')<CR>",
	{ desc = "Toggle terminal" })
keymap({ "n", "v" }, "<leader>b", "<cmd>lua require('vscode').action('editor.debug.action.toggleBreakpoint')<CR>",
	{ desc = "Toggle line breakpoint" })
keymap({ "n", "v" }, "<leader>d", "<cmd>lua require('vscode').action('editor.action.showHover')<CR>",
	{ desc = "Show hover" })
keymap({ "n", "v" }, "<leader>a", "<cmd>lua require('vscode').action('editor.action.quickFix')<CR>",
	{ desc = "Open quickfix list" })
keymap({ "n", "v" }, "<leader>sp", "<cmd>lua require('vscode').action('workbench.actions.view.problems')<CR>",
	{ desc = "List code warnings" })
keymap({ "n", "v" }, "<leader>cn", "<cmd>lua require('vscode').action('notifications.clearAll')<CR>",
	{ desc = "Clear notifications" })
keymap({ "n", "v" }, "<leader>ff", "<cmd>lua require('vscode').action('workbench.action.quickOpen')<CR>",
	{ desc = "Quick open" })
keymap({ "n", "v" }, "<leader>cp", "<cmd>lua require('vscode').action('workbench.action.showCommands')<CR>",
	{ desc = "Show code actions" })
keymap({ "n", "v" }, "<leader>pr", "<cmd>lua require('vscode').action('code-runner.run')<CR>", { desc = "Code runner run" })
keymap({ "n", "v" }, "<leader>fd", "<cmd>lua require('vscode').action('editor.action.formatDocument')<CR>",
	{ desc = "Format document" })
