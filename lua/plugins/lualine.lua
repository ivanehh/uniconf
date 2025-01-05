return {
	'nvim-lualine/lualine.nvim',
	dependencies = { 'nvim-tree/nvim-web-devicons' },
	opts = {
		options = {
			always_show_tabline = false,
			icons_enabled = true,
			theme = 'gruvbox-material',
			globalstatus = true,
			component_separators = { left = '', right = '' },
			section_separators = { left = '', right = '' },
			refresh = {
				statusline = 200,
				tabline = 200,
				winbar = 200,
			}
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
					'buffers',
					show_filename_only = true,
					show_modified_status = true,
					mode = 2, -- Show buffer number + name
					max_length = vim.o.columns * 2 / 3,
					filetype_names = {
						TelescopePrompt = 'Telescope',
						lazy = 'Lazy',
						fzf = 'FZF',
					},
					symbols = {
						modified = ' ●',
						alternate_file = '#',
						directory = '',
					},
				}
			},
			lualine_c = {
				{
					'filename',
					file_status = true,
					newfile_status = true,
					path = 1,
					symbols = {
						-- modified = '[+]',
						readonly = '[RO]',
						unnamed = '[No Name]',
						newfile = '[New]',
					}
				},
				{
					'diff',
					source = function()
						local gitsigns = vim.b.gitsigns_status_dict
						if gitsigns then
							return {
								added = gitsigns.added,
								modified = gitsigns.changed,
								removed = gitsigns.removed
							}
						end
					end
				},
			},
			lualine_x = {
				{
					'diagnostics',
					sources = { 'nvim_diagnostic' },
					sections = { 'error', 'warn', 'info', 'hint' },
				},
				'encoding',
				'fileformat',
				'filetype'
			},
			lualine_y = { 'progress' },
			lualine_z = { 'location' }
		},
		tabline = {
			lualine_a = {
				{
					'tabs',
					mode = 2, -- Show tab number + name
					max_length = vim.o.columns / 3,
					show_modified_status = true,
					symbols = {
						modified = ' [+]',
					},
				}
			},
			lualine_b = {},
			lualine_c = {},
			lualine_x = {},
			lualine_y = {},
			lualine_z = {}
		},
		extensions = { 'quickfix', 'fzf', 'mason' }
	},
}

