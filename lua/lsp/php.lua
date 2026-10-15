local M = {}

function M.setup()
	vim.lsp.config('phpactor', {})
	vim.lsp.enable('phpactor')
end

return M
