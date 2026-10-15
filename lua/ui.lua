local M = {
	enable_bubbles_theme = 1,
}

local function setup_animations()
	vim.pack.add({ 'https://github.com/nvim-mini/mini.animate' })

	require("mini.animate").setup()
end

local function setup_lualine()
	vim.pack.add({ "https://github.com/nvim-lualine/lualine.nvim" })

	local opts = {}
	if (M.enable_bubbles_theme == 1) then
		opts = require("lib.lualine-bubbles").bubbles_config
	end

	require('lualine').setup(opts)
end

-- Extensible UI for Neovim notifications and LSP progress messages.
-- Fidget is an unintrusive window in the corner of your editor that manages its own lifetime.
local function setup_fidget()
	vim.pack.add({ "https://github.com/j-hui/fidget.nvim" })

	require("fidget").setup({})
end

-- This is a VS Code like winbar
-- uses nvim-navic in order to get LSP context from your language server.
local function setup_barbecue()
	vim.pack.add({
		"https://github.com/utilyre/barbecue.nvim",
		"https://github.com/SmiteshP/nvim-navic"
	})

	require("nvim-navic").setup({})
	require("barbecue").setup({})
end

local function setup_indent_blankline()
	vim.pack.add({ 'https://github.com/nvim-mini/mini.indentscope' })

	require("mini.indentscope").setup()
end

function M.setup()
	setup_animations()
	setup_fidget()
	setup_barbecue()
	setup_indent_blankline()
	setup_lualine()
end

return M
