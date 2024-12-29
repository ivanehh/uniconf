local M = {}

M.setup = function(capabilities)
	local lspconfig = require("lspconfig")
	local config = require("lspconfig.configs.html").default_config
	config.settings.html.validate = false
	lspconfig.html.setup({
		capabilities = capabilities,
		filetypes = { "html", "templ" },
		settings = config.settings
	})
end

return M
