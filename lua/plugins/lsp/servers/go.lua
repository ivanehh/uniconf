local M = {}
M.setup = function(capabilities)
	local lspconfig = require("lspconfig")
	lspconfig.gopls.setup({
		capabilities = capabilities,
		settings = {
			gopls = {
				usePlaceholders = true,
				experimentalPostfixCompletions = true,
				completeFunctionCalls = true,
				analyses = {
					assign = true,
					unusedparams = true,
					nilness = true,
					useany = true,
				},
				staticcheck = true,
				gofumpt = true,
			}
		}
	})
	lspconfig.templ.setup({
		capabilities = capabilities,
	})
end
return M
