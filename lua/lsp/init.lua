local M = {}

function M.setup()
	vim.pack.add({ "https://github.com/neovim/nvim-lspconfig" })

	require("lsp.lua").setup()
	require("lsp.php").setup()
	require("lsp.go").setup()
	require("lsp.python").setup()
end

return M
