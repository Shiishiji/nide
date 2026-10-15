local M = {}

local function setup_oil()
	vim.pack.add({
		'https://github.com/stevearc/oil.nvim',
		'https://github.com/benomahony/oil-git.nvim',
		'https://github.com/JezerM/oil-lsp-diagnostics.nvim',
	})

	require("oil").setup({
		columns = {
			"permissions", "size", "mtime", "icon"
		},
		default_file_explorer = true,
		lsp_file_methods = {
			enabled = true,
		},
		watch_for_changes = true,
		view_options = {
			show_hidden = false,
		},
		float = {
			border = "rounded"
		},
		confirmation = {
			border = "rounded"
		},
		progress = {
			border = "rounded"
		},
		ssh = {
			border = "rounded"
		},
		keymaps_help = {
			border = "rounded"
		},
	})
end

local function setup_telescope()
	vim.pack.add({
		{ src = 'https://github.com/nvim-telescope/telescope.nvim' },
		{ src = 'https://github.com/nvim-lua/plenary.nvim' },
		{ src = 'https://github.com/nvim-telescope/telescope-fzf-native.nvim' },
		{ src = 'https://github.com/nvim-telescope/telescope-ui-select.nvim' },
	})

	local ts = require('telescope')
	ts.setup({
		defaults = {
			border = true,
			prompt_prefix = "🔍 ",
		}
	})
	-- ts.load_extension("fzf")
	ts.load_extension("ui-select")
end

local function setup_harpoon()
	vim.pack.add({
		{
			src = 'https://github.com/ThePrimeagen/harpoon',
			version = 'harpoon2'
		},
	})
	local harpoon = require('harpoon')
	harpoon:setup({})

	-- basic telescope configuration
	local conf = require("telescope.config").values
	local function toggle_telescope(harpoon_files)
		local file_paths = {}
		for _, item in ipairs(harpoon_files.items) do
			table.insert(file_paths, item.value)
		end

		require("telescope.pickers").new({}, {
			prompt_title = "Harpoon",
			finder = require("telescope.finders").new_table({
				results = file_paths,
			}),
			previewer = conf.file_previewer({}),
			sorter = conf.generic_sorter({}),
		}):find()
	end

	-- keymaps
	vim.keymap.set("n", "<leader>ha", function() harpoon:list():add() end, { desc = "Harpoon - Add file to list" })
	vim.keymap.set("n", "<leader>hh", function() toggle_telescope(harpoon:list()) end, { desc = "Telescope - Harpoon" })
	vim.keymap.set("n", "<leader>hl", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end,
		{ desc = "Harpoon - list" })
end

local function setup_trouble()
	vim.pack.add({ "https://github.com/folke/trouble.nvim" })

	require("trouble").setup({
		modes = {
			diagnostics = {
				preview = {
					type = "split",
					relative = "win",
					position = "right",
					size = 0.3,
				},
			},
		},
	})

	-- Telescope integrations
	local actions = require("telescope.actions")
	local open_with_trouble = require("trouble.sources.telescope").open

	-- Use this to add more results without clearing the trouble list
	local add_to_trouble = require("trouble.sources.telescope").add

	local telescope = require("telescope")

	telescope.setup({
		defaults = {
			mappings = {
				i = {
					["<c-z>"] = open_with_trouble,
					["<c-a>"] = add_to_trouble,
				},
				n = {
					["<c-z>"] = open_with_trouble,
					["<c-a>"] = add_to_trouble,
				},
			},
		},
	})

	-- keymaps
	vim.keymap.set("n", "<leader>xx", function()
		vim.cmd("Trouble diagnostics toggle focus=false filter.buf=0")
	end, { desc = "Diagnostics (Trouble)" })

	vim.keymap.set("n", "<leader>xl", function()
		vim.cmd("Trouble loclist toggle")
	end, { desc = "LocList (Trouble)" })

	vim.keymap.set("n", "<leader>xq", function()
		vim.cmd("Trouble qflist toggle")
	end, { desc = "QuickFix list (Trouble)" })

	vim.keymap.set("n", "<leader>xt", function()
		vim.cmd("Trouble telescope_files toggle")
	end, { desc = "Selected telescope files (Trouble)" })

	vim.keymap.set("n", "<leader>xr", function()
		vim.cmd("Trouble lsp toggle focus=false win.position=right")
	end, { desc = "LSP References (Trouble)" })

	vim.keymap.del("n", "gO") -- override default LSP action
	vim.keymap.set("n", "gO", function()
		vim.cmd("Trouble symbols toggle")
	end, { desc = "Display symbols (Trouble)" })
end

function M.setup()
	setup_oil()
	setup_telescope()
	setup_harpoon()
	setup_trouble()
end

return M
