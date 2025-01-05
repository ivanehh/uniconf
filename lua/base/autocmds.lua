-- Autocommands
--- helpers
local function should_close_buffer(bufnr)
	local deleteErrors = {}
	if vim.api.nvim_buf_is_valid(bufnr) == false then
		table.insert(deleteErrors, string.format("buffer %d is not valid", bufnr))
	elseif #vim.fn.win_findbuf(bufnr) ~= 0 then
		table.insert(deleteErrors, string.format("buffer %d is active in a window", bufnr))
	elseif vim.bo[bufnr].modified == true then
		table.insert(deleteErrors, string.format("buffer %d is modified", bufnr))
	elseif vim.bo[bufnr].buftype ~= '' then
		table.insert(deleteErrors, string.format("buffer %d is a special buffer:", bufnr, vim.bo[bufnr].buftype))
	end
	return deleteErrors
end

-- TODO: Get this to work...somehow
local function close_unmodified_buffer()
	local deletedBuffers = {}
	local buffers = vim.api.nvim_list_bufs()
	for _, bufnr in ipairs(buffers) do
		local deleteErrors = should_close_buffer(bufnr)
		if #deleteErrors ~= 0 then
			for _, err in ipairs(deleteErrors) do
				print(string.format("buf %d not deleted:%s", bufnr, err))
			end
		end
	end
	return deletedBuffers
end

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

-- local on_open = vim.api.nvim_create_augroup('OnOpen', { clear = true })

-- When saving various files
local on_save = vim.api.nvim_create_augroup('OnSave', { clear = true })

-- local buffer_autoclose = vim.api.nvim_create_augroup('BufCleanUp', { clear = true })

-- vim.api.nvim_create_autocmd('BufLeave',
-- 	{
-- 		group = buffer_autoclose,
-- 		callback = function()
-- 			vim.defer_fn(function()
-- 				local deletedBuffers = close_unmodified_buffer()
-- 				for _, v in ipairs(deletedBuffers) do
-- 					vim.notify(string.format("deleted buffer: %s", v))
-- 				end
-- 				if #deletedBuffers == 0 then
-- 					vim.notify("did not delete any buffers")
-- 				end
-- 			end, 400)
-- 		end,
-- 		desc = 'Delete unmodified buffers when exiting them'
-- 	})


vim.api.nvim_create_autocmd('BufWritePre', {
	group = on_save,
	callback = function()
		if vim.bo.filetype ~= 'python' then
			vim.lsp.buf.format()
		end
	end,
})

vim.api.nvim_create_autocmd({ 'BufWritePost' }, {
	group = on_save,
	callback = function()
		local cbuf = vim.api.nvim_get_current_buf()
		local s, e = nil, nil
		require("lint").try_lint()
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
			if s or e then
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
			vim.cmd('Isort')
		end
	end
})
