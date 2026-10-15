local M = {}

local store = {
	buffers = {},
	windows = {}
}

function M.toggle(ix, command)
	if store.windows[ix] and vim.api.nvim_win_is_valid(store.windows[ix]) then
		vim.api.nvim_win_hide(store.windows[ix])
		return -- toggle behavior - hide when window with ix is active
	end

	local opts = {
		relative = "editor",
		border = "rounded",
		style = "minimal"
	}

	local ui = vim.api.nvim_list_uis()[1]
	local scale = 2 / 3

	if ui.width <= 100 or ui.height <= 30 then
		scale = 0.99
	elseif ui.width >= 240 and ui.height >= 60 then
		scale = 0.5
	end

	opts.width = math.max(1, math.floor(ui.width * scale))
	opts.height = math.max(1, math.floor(ui.height * scale))
	opts.col = math.floor((ui.width - opts.width) / 2)
	opts.row = math.floor((ui.height - opts.height) / 2)

	local buf = nil
	if store.buffers[ix] and vim.api.nvim_buf_is_valid(store.buffers[ix]) then
		buf = store.buffers[ix]
	else
		buf = vim.api.nvim_create_buf(false, true)
		store.buffers[ix] = buf
	end

	local win = vim.api.nvim_open_win(buf, true, opts)
	store.windows[ix] = win

	-- When command is passed proxy it to the terminal
	if command then
		vim.api.nvim_buf_call(buf, function()
			vim.cmd(":terminal " .. command)
		end)
	else
		vim.api.nvim_buf_call(buf, function()
			vim.cmd(":terminal")
		end)
	end
end

return M
