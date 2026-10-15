local M = {}

local function setup_blinkcmp()
	vim.pack.add({
		'https://github.com/saghen/blink.lib',
		'https://github.com/saghen/blink.cmp'
	})
	local cmp = require('blink.cmp')
	cmp.build():pwait()
	cmp.setup({
		sources = {
			-- add lazydev to your completion providers
			default = { "lazydev", "lsp", "path", "snippets", "buffer" },
			providers = {
				lazydev = {
					name = "LazyDev",
					module = "lazydev.integrations.blink",
					-- make lazydev completions top priority (see `:h blink.cmp`)
					score_offset = 100,
				},
			},
		}
	})
end

function M.setup()
	setup_blinkcmp()
end

return M
