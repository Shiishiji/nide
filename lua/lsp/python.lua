local M = {}

function M.setup()
	vim.lsp.config('pylsp', {})
	vim.lsp.enable('pylsp')
end

return M
