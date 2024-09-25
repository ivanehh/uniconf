return {
	"Jezda1337/nvim-html-css",
	event = { 'BufReadPre', 'BufNewFile' },
	config = function()
		require("html-css"):setup()
	end
}
