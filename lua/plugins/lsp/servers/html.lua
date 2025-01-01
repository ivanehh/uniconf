local M = {}

M.setup = function(capabilities)
	local lspconfig = require("lspconfig")
	local config = require("lspconfig.configs.html").default_config
	lspconfig.html.setup({
		capabilities = (function(caps)
			caps.documentFormattingProvider = true
			caps.documentRangeFormattingProvider = true
			caps.textDocument.colorProvider = false
			return caps
		end)(capabilities),
		filetypes = {
			"html",
			-- "templ", -- golang templ files
		},
		init_options = {
			configurationSection = { "html", "css", "javascript" },
			embeddedLanguages = {
				css = true,
				javascript = true
			},
			provideFormatter = true,
			-- Add HTMX data attributes to the HTML properties
		},
		settings = {
			html = {
				format = {
					indentInnerHtml = false,
					wrapLineLength = 80,
					wrapAttributes = 'auto',
					templating = true, -- Enable template support
					unformatted = nil,
				},
				hover = {
					documentation = true,
					references = true,
				},
				validate = {
					scripts = true,
					styles = true,
				},
				suggest = {
					html5 = true,
				},
			},
		}
	})
end

return M
