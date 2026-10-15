local M = {}

local function setup_whichkey()
	vim.pack.add({ "https://github.com/folke/which-key.nvim" })

	require("which-key").setup({
		preset = "helix"
	})
end

function M.setup()
	setup_whichkey()

	-- terminal escape
	vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { noremap = true, silent = true })

	-- oil
	vim.keymap.set("n", "<space>_", function() require("oil").toggle_float(vim.uv.cwd()) end, { desc = "Open oil CWD" }) -- oil cwd
	vim.keymap.set("n", "<space>-", function() require("oil").toggle_float() end, { desc = "Open oil here" })           -- oil buffer wd

	-- terminals addon
	local terminals = require("addons.terminals")
	for i = 0, 9, 1 do
		vim.keymap.set("n", "<space>t" .. i, function()
			terminals.toggle(i)
		end, { desc = "Toggle terminal " .. i })
	end

	vim.keymap.set("n", "<space>to", function() terminals.toggle("opencode", "opencode") end, { desc = "Toggle OpenCode" })
	vim.keymap.set("n", "<space>tlg", function() terminals.toggle("lazygit", "lazygit") end, { desc = "Toggle LazyGit" })

	-- telescope
	local tsbuiltin = require('telescope.builtin')
	vim.keymap.set("n", "<space>fh", tsbuiltin.help_tags, { desc = "Telescope - help" })
	vim.keymap.set("n", "<space>ff", tsbuiltin.find_files, { desc = "Telescope - files" })
	vim.keymap.set("n", "<space>fb", tsbuiltin.buffers, { desc = "Telescope - buffers" })
	vim.keymap.set("n", "<space>fs", tsbuiltin.git_status, { desc = "Telescope - git status" })
	vim.keymap.set("n", "<space>fq", tsbuiltin.quickfixhistory, { desc = "Telescope - quickfixes" })
	vim.keymap.set("n", "<space>fc", tsbuiltin.commands, { desc = "Telescope - commands" })
	vim.keymap.set("n", "<space>fw", tsbuiltin.man_pages, { desc = "Telescope - wiki manpages" })
	vim.keymap.set("n", "<space>fg", tsbuiltin.live_grep, { desc = "Telescope - live grep" })
end

return M
