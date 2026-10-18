local M = {}

local function setup_gitsigns()
	vim.pack.add({ 'https://github.com/lewis6991/gitsigns.nvim' })

	require('gitsigns').setup()
	-- scrollbar plugin integration
	require("scrollbar.handlers.gitsigns").setup()
end

function M.setup()
	setup_gitsigns()
end

return M
