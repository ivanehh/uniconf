return {
	'mfussenegger/nvim-lint',
	event = 'BufWritePost',
	config = function()
		require('lint').linters_by_ft = {
			'ruff'
		}
	end
}
