return {
	'stevearc/oil.nvim',
	config = function()
		require('oil').setup({
			default_file_explorer = true,
			columns = {
				"icon",
			},
			view_options = {
				show_hidden = true
			},
			use_default_keymaps = false,
			keymaps = {
				["g?"] = "actions.show_help",
				["<CR>"] = "actions.select",
				["ov"] = { "actions.select", opts = { vertical = true }, desc = "Open the entry in a vertical split" },
				["oh"] = { "actions.select", opts = { horizontal = true }, desc = "Open the entry in a horizontal split" },
				["<C-t>"] = { "actions.select", opts = { tab = true }, desc = "Open the entry in new tab" },
				["<C-p>"] = "actions.preview",
				["<Esc>"] = "actions.close",
				["-"] = "actions.parent",
				["_"] = "actions.open_cwd",
				["`"] = "actions.cd",
				["~"] = { "actions.cd", opts = { scope = "tab" }, desc = ":tcd to the current oil directory" },
			}
		})
	end,
	-- Optional dependencies
	dependencies = { "echasnovski/mini.icons" },
	-- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
}
