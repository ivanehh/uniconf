local M = {}

M.setup = function(capabilities)
	require("lspconfig").lua_ls.setup({
		capabilities = capabilities,
		settings = {
			Lua = {
				runtime = 'LuaJIT',
				format = {
					enable = true,
					defaultConfig = { indent_style = 'space', indent_size = '2' },
				},
				diagnostics = { globals = { 'vim' } },
				workspace = { [vim.fn.expand("$VIMRUNTIME/lua")] = true }
			},
		},
	})
end

return M
