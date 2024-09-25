vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
	vim.lsp.handlers.hover, {
		border = "single",
		title = "LSP Info",
		focusable = true
	}
)
