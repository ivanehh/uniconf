-- Autocommands

-- On yanking
local on_yank = vim.api.nvim_create_augroup('OnYank', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
	group = on_yank,
	callback = function()
		vim.highlight.on_yank({ higroup = 'IncSearch', timeout = 200 })
	end
})

-- Golang-specific
local go_group = vim.api.nvim_create_augroup('GoKeymaps', { clear = true })

local function go_keymaps()
	vim.api.nvim_buf_set_keymap(0, NMODE, '<leader>t', '<cmd>GoTestFunc<CR>',
		{ noremap = true, desc = 'run the function the cursor is in or on' })
	vim.api.nvim_buf_set_keymap(0, NMODE, '<leader>T', '<cmd>GoTest<CR>',
		{ noremap = true, desc = 'run the function the cursor is in or on' })
end

vim.api.nvim_create_autocmd('FileType', {
	group = go_group,
	pattern = 'go',
	callback = go_keymaps,
})

-- When opening files

local on_open = vim.api.nvim_create_augroup('OnOpen', { clear = true })

-- When saving various files
local on_save = vim.api.nvim_create_augroup('OnSave', { clear = true })


vim.api.nvim_create_autocmd('BufWritePre', {
	group = on_save,
	callback = function()
		if vim.bo.filetype ~= 'python' then
			vim.lsp.buf.format()
		end
	end,
})

vim.api.nvim_create_autocmd({ 'BufWritePost', 'InsertLeave' }, {
	group = on_save,
	callback = function()
		local cbuf = vim.api.nvim_get_current_buf()
		local s, e = nil, nil
		if vim.bo.filetype == 'python' then
			require('lint').try_lint()
		end
		--- format json and notify if there are errors
		if vim.bo.filetype == 'json' or vim.bo.filetype == 'jsonc' then
			local res = vim.api.nvim_exec2(
				string.format(
					'!jq "." %q',
					vim.api.nvim_buf_get_name(cbuf)
				),
				{ output = true }
			)
			s, e = string.find(res['output'], 'error')
			if e then
				local notify_text = string.sub(res['output'], e + 3,
					string.len(
						res['output'])
				)
				vim.notify(notify_text, 'warn')
				return
			else
				res = vim.api.nvim_exec2(
					'%!jq "." ',
					{ output = true }
				)
				vim.notify('JSON formatted', 'info')
			end
		end
	end
})

vim.api.nvim_create_autocmd('BufWritePre', {
	group = on_save,
	callback = function()
		if vim.bo.filetype == 'python' then
			vim.cmd('Black')
			vim.cmd("Isort")
		end
	end
})
