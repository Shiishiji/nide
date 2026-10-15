local M = {}

function M.setup()
	vim.pack.add({
		"https://github.com/stevearc/conform.nvim"
	})

	local opts = {
		formatters_by_ft = {
			gradle = { "npm-groovy-lint" },
			groovy = { "npm-groovy-lint" },
			kotlin = { "ktlint" },
			go = { 'gofmt', 'goimports' },
			lua = { "stylua" },
			python = { "black" },
		},
		formatters = {
			["npm-groovy-lint"] = {
				command = "npm-groovy-lint",
				args = { "--format", "--failon", "none", "-" },
				stdin = true,
			},
		},
		format_on_save = {
			timeout_ms = 750,
			lsp_format = "fallback",
		},
	}

	require("conform").setup(opts)
end

return M
