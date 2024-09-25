return {
	-- Autocompletion
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies =
	-- Snippet Engine & its associated nvim-cmp source
	{
		"L3MON4D3/LuaSnip",
		"saadparwaiz1/cmp_luasnip",
		-- Adds other completion capabilities.
		--  nvim-cmp does not ship with all sources by default. They are split
		--  into multiple repos for maintenance purposes.
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-nvim-lua",
		"rafamadriz/friendly-snippets",
		"Jezda1337/nvim-html-css",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-buffer"
	},
	config = function()
		-- See `:help cmp`
		local cmp = require "cmp"
		local luasnip = require "luasnip"
		require("luasnip.loaders.from_vscode").lazy_load()
		luasnip.config.setup {}

		cmp.setup {
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end
			},
			debug = true,
			completion = { completeopt = "menu,menuone,preview,noinsert" },
			-- For an understanding of why these mappings were
			-- chosen, you will need to read `:help ins-completion`
			--
			-- No, but seriously. Please read `:help ins-completion`, it is really good!
			mapping = cmp.mapping.preset.insert({
				-- Select the [n]ext item
				["<C-j>"] = cmp.mapping.select_next_item(),
				-- Select the [p]revious item
				["<C-k>"] = cmp.mapping.select_prev_item(), -- Scroll the documentation window [b]ack / [f]orward
				["<C-b>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				-- Accept ([y]es) the completion.
				--  This will auto-import if your LSP supports it.
				--  This will expand snippets if the LSP sent a snippet.
				["<C-y>"] = cmp.mapping.confirm { select = true },
				-- If you prefer more traditional completion keymaps,
				-- you can uncomment the following lines
				--['<CR>'] = cmp.mapping.confirm { select = true },
				--['<Tab>'] = cmp.mapping.select_next_item(),
				--['<S-Tab>'] = cmp.mapping.select_prev_item(),

				-- Manually trigger a completion from nvim-cmp.
				--  Generally you don't need this, because nvim-cmp will display
				--  completions whenever it has completion options available.
				["<C-Space>"] = cmp.mapping.complete {},
				-- Think of <c-l> as moving to the right of your snippet expansion.
				--  So if you have a snippet that's like:
				--  function $name($args)
				--    $body
				--  end
				--
				-- <c-l> will move you to the right of each of the expansion locations.
				-- <c-h> is similar, except moving you backwards.
				["<C-l>"] = cmp.mapping(
					function()
						if luasnip.expand_or_locally_jumpable() then
							luasnip.expand_or_jump()
						end
					end,
					{ "i", "s" }
				),
				["<C-h>"] = cmp.mapping(
					function()
						if luasnip.locally_jumpable(-1) then
							luasnip.jump(-1)
						end
					end,
					{ "i", "s" }
				)
			}),
			sources = cmp.config.sources(
				{
					{ name = "nvim_lsp" },
					{ name = "nvim_lua" },
					{ name = "html-css", option = {
						max_count = {}, -- not ready yet
						enable_on = {
							"html", "css"
						},                                             -- set the file types you want the plugin to work on
						file_extensions = { "css", "sass", "less", "html" }, -- set the local filetypes from which you want to derive classes
						style_sheets = {
							-- example of remote styles, only css no js for now
							"https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css",
							"https://cdn.jsdelivr.net/npm/bulma@0.9.4/css/bulma.min.css",
						}
					} },
					{ name = "luasnip" },
					{ name = "buffer", keyword_length = 5 },
					{ name = "path" }
				}
			),
			experimental = {
				ghost_text = true,
				native_menu = false
			}
		}
	end
}
