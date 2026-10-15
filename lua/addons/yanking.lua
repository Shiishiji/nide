local function yank_absolute_path()
	local absolute_path = vim.api.nvim_buf_get_name(0)

	vim.fn.setreg("+", absolute_path)
	print("Yanked absolute file path to register +")
end

local function yank_filename()
	local absolute_path = vim.api.nvim_buf_get_name(0)
	local parts = vim.split(absolute_path, "/")

	local filename = parts[#parts]

	vim.fn.setreg("+", filename)
	print("Yanked filename to register +")
end

local function yank_relative_path()
	local absolute_path_parts = vim.split(vim.api.nvim_buf_get_name(0), "/")
	local working_dir_parts = vim.split(vim.fn.getcwd(), "/")

	local relative_path_parts = vim.list_slice(absolute_path_parts, #working_dir_parts + 1)
	local relative_path = vim.fn.join(relative_path_parts, "/")

	vim.fn.setreg("+", relative_path)
	print("Yanked relative path to register +")
end

local function yank_class_name()
	-- TODO
end

local function yank_fqn()
	-- TODO
end

local function yank_namespace()
	-- TODO
end

vim.keymap.set("n", "<space>ya", function() yank_absolute_path() end, { desc = "Yank absolute file path" })
vim.keymap.set("n", "<space>yf", function() yank_filename() end, { desc = "Yank filename" })
vim.keymap.set("n", "<space>yr", function() yank_relative_path() end, { desc = "Yank relative path" })
vim.keymap.set("n", "<space>ylc", function() yank_class_name() end, { desc = "(LSP) Yank class name" })
vim.keymap.set("n", "<space>ylf", function() yank_fqn() end, { desc = "(LSP) Yank FQN" })
vim.keymap.set("n", "<space>yln", function() yank_namespace() end, { desc = "(LSP) Yank namespace" })
