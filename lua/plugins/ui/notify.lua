return {
	"rcarriga/nvim-notify",
	config = function()
		require('notify').setup({
			background_colour = "NotifyBackground",
			fps = 24,
			icons = {
				DEBUG = "",
				ERROR = "",
				INFO = "",
				TRACE = "✎",
				WARN = ""
			},
			level = 2,
			minimum_width = 50,
			render = "wrapped-compact",
			stages = "static",
			time_formats = {
				notification = "%T",
				notification_history = "%FT%T"
			},
			timeout = 1500,
			top_down = true
		})
	end
}
