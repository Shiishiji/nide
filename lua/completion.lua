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

-- Show function signature when you type
-- Toggle with Ctrl+l in insert mode
local function setup_lsp_signature()
	vim.pack.add({ "https://github.com/ray-x/lsp_signature.nvim" })

	local l = require('lsp_signature')
	l.setup({
		bind = true,
		toggle_key = '<C-l>',
		handler_opts = {
			border = "rounded"
		}
	})
end

function M.setup()
	setup_blinkcmp()
	setup_lsp_signature()
end

return M
