local M = {}

local function setup_hex_colors()
	vim.pack.add({ "https://github.com/norcalli/nvim-colorizer.lua" })
	require("colorizer").setup()
end

local function setup_treesitter()
	-- Neovim > 0.12 has it's own treesitter integrated
	-- but it lacks parser installer
	-- this plugin adds it
	vim.pack.add({
		{ src = 'https://github.com/romus204/tree-sitter-manager.nvim' },
	})

	require("tree-sitter-manager").setup({
		ensure_installed = {
			"angular",
			"bash",
			"bicep",
			"c",
			"c_sharp",
			"cmake",
			"css",
			"csv",
			"diff",
			"dockerfile",
			"go",
			"gomod",
			"gosum",
			"graphql",
			"groovy",
			"html",
			"htmldjango",
			"hyprlang",
			"java",
			"javascript",
			"jsdoc",
			"json",
			"json5",
			"kotlin",
			"lua",
			"luadoc",
			"luap",
			"markdown",
			"markdown_inline",
			"nix",
			"nu",
			"php",
			"php_only",
			"phpdoc",
			"printf",
			"proto",
			"python",
			"query",
			"razor",
			"regex",
			"rust",
			"scss",
			"terraform",
			"toml",
			"tsx",
			"typescript",
			"vim",
			"vimdoc",
			"xml",
			"yaml",
			"yuck",
			"zig",
		}
	})
end

function M.setup()
	setup_hex_colors()
	setup_treesitter()
end

return M
