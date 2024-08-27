return {
	'nvim-lualine/lualine.nvim',
	dependencies = { 'nvim-tree/nvim-web-devicons' },
	opts = {
		options = {
			icons_enabled = true,
			theme = 'everforest',
			globalstatus = true,
		},
		sections = {
			lualine_a = {
				{
					'mode',
					icons_enabled = true,
				}
			},
			lualine_b = {
				{
					'diff', 'diagnostics'
				}
			},
			lualine_c = {
				{
					'filename',
					file_status = true,
					newfile_status = false,
					path = 1,
				}
			}
		}
	},
}
