local M = {}

function M.setup()
	vim.lsp.config('gopls', {})
	vim.lsp.enable('gopls')
end

return M
