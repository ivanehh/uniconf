local M = {}

M.setup = function()
	-- Define diagnostic signs
	local signs = { Error = "⮾ ", Warn = "⚠ ", Info = "🛈 " }
	for type, icon in pairs(signs) do
		local hl = "DiagnosticSign" .. type
		vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
	end

	-- Setup LSP keymaps and autocommands
	vim.api.nvim_create_autocmd("LspAttach", {
		group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
		callback = function(event)
			local map = function(keys, func, desc)
				vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
			end

			-- Your existing keymaps here
			map("gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")
			map("gI", require("telescope.builtin").lsp_implementations,
				"[G]oto [I]mplementation")
			map("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
			map("<leader>D", require("telescope.builtin").lsp_type_definitions,
				"Type [D]efinition")
			map("<leader>ds", require("telescope.builtin").lsp_document_symbols,
				"[D]ocument [S]ymbols")
			map(
				"<leader>ws",
				require("telescope.builtin").lsp_dynamic_workspace_symbols,
				"[W]orkspace [S]ymbols"
			)
			map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
			map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
			map("K", vim.lsp.buf.hover, "Hover Documentation")
			map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")

			-- Document highlight setup
			local client = vim.lsp.get_client_by_id(event.data.client_id)
			if client and client.server_capabilities.documentHighlightProvider then
				local highlight_augroup = vim.api.nvim_create_augroup("lsp-highlight",
					{ clear = false })
				vim.api.nvim_create_autocmd(
					{ "CursorHold", "CursorHoldI" },
					{
						buffer = event.buf,
						group = highlight_augroup,
						callback = vim.lsp.buf.document_highlight
					}
				)

				vim.api.nvim_create_autocmd(
					{ "CursorMoved", "CursorMovedI" },
					{
						buffer = event.buf,
						group = highlight_augroup,
						callback = vim.lsp.buf.clear_references
					}
				)

				vim.api.nvim_create_autocmd(
					"LspDetach",
					{
						group = vim.api.nvim_create_augroup("lsp-detach",
							{ clear = true }),
						callback = function(event2)
							vim.lsp.buf.clear_references()
							vim.api.nvim_clear_autocmds { group = "lsp-highlight", buffer = event2.buf }
						end
					}
				)
			end

			-- -- Inlay hints setup
			if client and client.server_capabilities.inlayHintProvider and vim.lsp.inlay_hint then
				map(
					"<leader>th",
					function()
						vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint
							.is_enabled())
					end,
					"[T]oggle Inlay [H]ints"
				)
			end
		end,
	})
end

return M
