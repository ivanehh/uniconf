local M = {}

M.setup = function(capabilities)
	require('lspconfig').tailwindcss.setup({
		capabilities = capabilities,
		settings = {
			includeLanguages = {
				templ = "html"
			}
		}
		-- filetypes = {
		-- 	'html',
		-- 	'javascript',
		-- 	'javascriptreact',
		-- 	'typescript',
		-- 	'typescriptreact',
		-- 	'css',
		-- 	'templ',
		-- 	-- Add any other filetypes you use with Tailwind
		-- },
		-- init_options = {
		-- 	userLanguages = {
		-- 		-- Add any custom file associations if needed
		-- 		-- eelixir = "html-eex",
		-- 		-- eruby = "erb"
		-- 	}
		-- },
		-- settings = {
		-- 	tailwindCSS = {
		-- 		experimental = {
		-- 			classRegex = {
		-- 				-- Add custom regex patterns if needed for framework-specific class patterns
		-- 				'className\\s*=\\s*["\']([^"\']*)["\']',
		-- 				'class\\s*=\\s*["\']([^"\']*)["\']',
		-- 			}
		-- 		},
		-- 		validate = true,
		-- 		lint = {
		-- 			cssConflict = "warning",
		-- 			invalidApply = "error",
		-- 			invalidScreen = "error",
		-- 			invalidVariant = "error",
		-- 			invalidConfigPath = "error",
		-- 			invalidTailwindDirective = "error",
		-- 			recommendedVariantOrder = "warning"
		-- 		},
		-- 	}
		-- }
	})
end

return M
