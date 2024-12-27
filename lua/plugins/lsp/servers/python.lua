local util = require 'lspconfig.util'

local M = {}

local root_files = {
	'pyproject.toml',
	'setup.py',
	'setup.cfg',
	'requirements.txt',
	'pipfile',
	'pyrightconfig.json',
	'.git',
}

local function organize_imports()
	local params = {
		command = 'pyright.organizeimports',
		arguments = { vim.uri_from_bufnr(0) },
	}

	local clients = util.get_lsp_clients {
		bufnr = vim.api.nvim_get_current_buf(),
		name = 'pyright',
	}
	for _, client in ipairs(clients) do
		client.request('workspace/executecommand', params, nil, 0)
	end
end

local function set_python_path(path)
	local clients = util.get_lsp_clients {
		bufnr = vim.api.nvim_get_current_buf(),
		name = 'pyright',
	}
	for _, client in ipairs(clients) do
		if client.settings then
			client.settings.python = vim.tbl_deep_extend('force', client.settings.python or {},
				{ pythonpath = path })
		else
			client.config.settings = vim.tbl_deep_extend('force', client.config.settings,
				{ python = { pythonpath = path } })
		end
		client.notify('workspace/didchangeconfiguration', { settings = nil })
	end
end


-- todo: this is only done for a compatible standard; i don't think it'll actually work
M.setup = function()
	local config = {
		cmd = { 'pyright-langserver', '--stdio' },
		filetypes = { 'python' },
		root_dir = function(fname)
			return util.root_pattern(unpack(root_files))(fname)
		end,
		single_file_support = true,
		settings = {
			pyright = {
				analysis = {
					autosearchpaths = true,
					uselibrarycodefortypes = true,
					diagnosticmode = 'openfilesonly',
				},
			},
		},
		commands = {
			pyrightorganizeimports = {
				organize_imports,
				description = 'organize imports',
			},
			pyrightsetpythonpath = {
				set_python_path,
				description = 'reconfigure pyright with the provided python path',
				nargs = 1,
				complete = 'file',
			},
		},
		docs = {
			description = [[
https://detachhead.github.io/basedpyright

`basedpyright`, a static type checker and language server for python
]],
		}
	}
	require('lspconfig').pyright.setup(config)
end

return M
