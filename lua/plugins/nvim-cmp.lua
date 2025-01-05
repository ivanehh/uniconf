return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		-- Snippet engine and its associated nvim-cmp source
		{
			"L3MON4D3/LuaSnip",
			dependencies = { "rafamadriz/friendly-snippets" },
		},
		"saadparwaiz1/cmp_luasnip",

		-- LSP completion capabilities
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-nvim-lua",

		-- Additional sources
		"hrsh7th/cmp-path", -- file paths
		"hrsh7th/cmp-buffer", -- buffer words
	},
	config = function()
		local cmp = require("cmp")
		local luasnip = require("luasnip")

		-- Load VSCode-like snippets
		require("luasnip.loaders.from_vscode").lazy_load()
		luasnip.config.setup({})

		local function has_words_before()
			local line, col = unpack(vim.api.nvim_win_get_cursor(0))
			return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
		end

		cmp.setup({
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},

			-- Completion settings
			completion = {
				completeopt = "menu,menuone,preview,noinsert",
			},

			-- Key mapping
			mapping = {
				-- Navigation
				["<C-j>"] = cmp.mapping.select_next_item(),
				["<C-k>"] = cmp.mapping.select_prev_item(),
				["<C-b>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),

				-- Confirmation
				["<C-y>"] = cmp.mapping.confirm({ select = true }),
				["<C-Space>"] = cmp.mapping.complete({}),

				-- Snippet navigation
				["<C-l>"] = cmp.mapping(function()
					if luasnip.expand_or_locally_jumpable() then
						luasnip.expand_or_jump()
					end
				end, { "i", "s" }),

				["<C-h>"] = cmp.mapping(function()
					if luasnip.locally_jumpable(-1) then
						luasnip.jump(-1)
					end
				end, { "i", "s" }),
			},

			-- Sources configuration
			sources = cmp.config.sources({
				{ name = "nvim_lsp", priority = 1000 },
				{ name = "nvim_lua", priority = 800 },
				{ name = "luasnip",  priority = 750 },
				{
					name = "buffer",
					priority = 500,
					keyword_length = 5,
					option = {
						get_bufnrs = function()
							return vim.api.nvim_list_bufs()
						end
					}
				},
				{ name = "path", priority = 250 },
			}),

			-- Window appearance
			window = {
				completion = cmp.config.window.bordered(),
				documentation = cmp.config.window.bordered(),
			},

			-- Experimental features
			experimental = {
				ghost_text = true,
				native_menu = false,
			},

			-- Formatting
			formatting = {
				format = function(entry, vim_item)
					local kind_icons = {
						Text = "󰉿",
						Method = "󰆧",
						Function = "󰊕",
						Constructor = "",
						Field = "󰜢",
						Variable = "󰀫",
						Class = "󰠱",
						Interface = "",
						Module = "",
						Property = "󰜢",
						Unit = "󰑭",
						Value = "󰎠",
						Enum = "",
						Keyword = "󰌋",
						Snippet = "",
						Color = "󰏘",
						File = "󰈙",
						Reference = "󰈇",
						Folder = "󰉋",
						EnumMember = "",
						Constant = "󰏿",
						Struct = "󰙅",
						Event = "",
						Operator = "󰆕",
						TypeParameter = "",
					}
					vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind)

					vim_item.menu = ({
						nvim_lsp = "[LSP]",
						luasnip = "[Snippet]",
						buffer = "[Buffer]",
						path = "[Path]",
						nvim_lua = "[Lua]",
					})[entry.source.name]

					return vim_item
				end
			},
		})
	end,
}
