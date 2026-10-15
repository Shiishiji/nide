local M = {}

function M.setup()
	vim.pack.add({
		"https://github.com/olimorris/persisted.nvim"
	})

	require("persisted").setup({
	})

	-- Add telescope picker for sessions
	require("telescope").load_extension("persisted")

	vim.keymap.set("n", "<leader>ss", function() vim.cmd("Persisted select") end, { desc = "Sessions - select from list" })
	vim.keymap.set("n", "<leader>sd", function() vim.cmd("Persisted delete") end, { desc = "Sessions - delete from list" })
end

return M
