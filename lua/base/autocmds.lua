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
vim.api.nvim_create_autocmd('BufReadPost', {
	group = on_open,
	pattern = "*.json",
	callback = function()
		vim.cmd('%!jq "."')
	end
})

-- When saving various files
local on_save = vim.api.nvim_create_augroup('OnSave', { clear = true })

vim.api.nvim_create_autocmd('BufWritePre', {
	group = on_save,
	callback = function()
		if vim.bo.filetype ~= 'python' then
			vim.lsp.buf.format()
		end
	end
})

vim.api.nvim_create_autocmd({ 'BufWritePost', 'InsertLeave' }, {
	group = on_save,
	callback = function()
		if vim.bo.filetype == 'python' then
			require('lint').try_lint()
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
