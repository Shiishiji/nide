local M = {}

function M.setup()
	vim.g.mapleader = " "
	vim.g.maplocalleader = "\\"

	vim.g.editorconfig = true

	vim.opt.tabstop = 2
	vim.opt.shiftwidth = 2
	vim.opt.number = true
	vim.opt.relativenumber = true

	vim.opt.termguicolors = true

	local augroup = vim.api.nvim_create_augroup
	local autocmd = vim.api.nvim_create_autocmd

	autocmd("TextYankPost", {
		group = augroup("HighlightYank", {}),
		pattern = "*",
		callback = function()
			vim.hl.hl_op({
				higroup = "IncSearch",
				timeout = 250,
			})
		end,
	})

	local severity = vim.diagnostic.severity
	vim.diagnostic.config({
		-- better diagnostic icons
		signs = {
			text = {
				[severity.ERROR] = " ",
				[severity.WARN] = " ",
				[severity.HINT] = "󰠠 ",
				[severity.INFO] = " ",
			}
		},
		-- better diagnostic windows
		float = {
			border = "rounded",
			source = "if_many",
			header = "",
			prefix = "",
		},
	})
end

return M
