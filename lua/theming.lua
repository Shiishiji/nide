local M = {
	theming_system = "nightfox",
	-- theming_system = "base16",
}

local function setup_icons()
	vim.pack.add({
		{ src = 'https://github.com/nvim-tree/nvim-web-devicons' }
	})
	require('nvim-web-devicons').setup({})
end

local function setup_markdown_renderer()
	vim.pack.add({
		'https://github.com/MeanderingProgrammer/render-markdown.nvim',
	})
end

local function setup_theming()
	if M.theming_system == "nightfox" then
		require("lib.theming-nightfox").setup()
		return
	end

	if M.theming_system == "base16" then
		require("lib.theming-base16").setup()
		return
	end
end

function M.setup()
	setup_icons()
	setup_markdown_renderer()
	setup_theming()
end

return M
