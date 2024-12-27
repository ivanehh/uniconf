local M = {}

local function get_servers()
	-- Get the directory of the current file
	local source_dir = "~/.config/nvim/lua/plugins/lsp/servers/"
	local servers = {}

	-- Scan the directory for Lua files
	local paths = vim.fn.glob(source_dir .. "*.lua", false, true)

	for _, file in ipairs(paths) do
		-- Extract filename without extension
		local server = vim.fn.fnamemodify(file, ":t:r")
		if server ~= "init" then
			table.insert(servers, server)
		end
	end

	return servers
end

M.setup = function()
	local capabilities = require("plugins.lsp.utils").get_capabilities()
	local servers = get_servers()

	for _, server in ipairs(servers) do
		local ok, err = pcall(server.setup, capabilities)
		if not ok then
			vim.notify(
				string.format("LSP setup failed for %s: %s", server, err),
				vim.log.levels.WARN
			)
			goto continue
		end
		require("plugins.lsp.servers." .. server).setup(capabilities)
		::continue::
	end
end

return M
