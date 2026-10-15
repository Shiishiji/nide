local M = {
	enable_ai = true,
}

function M.setup()
	if not M.enable_ai then
		return -- disabled
	end

	vim.pack.add({ {
		src = "https://www.github.com/olimorris/codecompanion.nvim",
		version = vim.version.range("^19.0.0")
	} })

	require("codecompanion").setup({
		adapters = {
			acp = {
				extend = {
					opencode = {
						defaults = {
							session_config_options = {
								mode = "plan",
								model = "openai/gpt-6.1-sol",
							},
						},
					},
				},
			},
		},
		interactions = {
			chat = {
				adapter = "opencode",
			},
		},
	})

	-- keymaps
	vim.keymap.set({ "n", "v" }, "<C-a>", "<cmd>CodeCompanionActions<cr>", { noremap = true, silent = true })
	vim.keymap.set({ "n", "v" }, "<LocalLeader>a", "<cmd>CodeCompanionChat Toggle<cr>", { noremap = true, silent = true })
	vim.keymap.set("v", "ga", "<cmd>CodeCompanionChat Add<cr>", { noremap = true, silent = true })

	-- Expand 'cc' into 'CodeCompanion' in the command line
	vim.cmd([[cab cc CodeCompanion]])
	vim.cmd([[cab ccc CodeCompanionChat]])
end

return M
