local M = {}

function M.setup()
	vim.pack.add({
		'https://github.com/EdenEast/nightfox.nvim',
	})

	vim.cmd("colorscheme terafox")
end

return M
