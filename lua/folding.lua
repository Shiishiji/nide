local M = {}

local function ufo_fold_text_handler(virtText, lnum, endLnum, width, truncate)
	local newVirtText = {}
	local suffix = (' 󰁂 %d '):format(endLnum - lnum)
	local sufWidth = vim.fn.strdisplaywidth(suffix)
	local targetWidth = width - sufWidth
	local curWidth = 0
	for _, chunk in ipairs(virtText) do
		local chunkText = chunk[1]
		local chunkWidth = vim.fn.strdisplaywidth(chunkText)
		if targetWidth > curWidth + chunkWidth then
			table.insert(newVirtText, chunk)
		else
			chunkText = truncate(chunkText, targetWidth - curWidth)
			local hlGroup = chunk[2]
			table.insert(newVirtText, { chunkText, hlGroup })
			chunkWidth = vim.fn.strdisplaywidth(chunkText)
			-- str width returned from truncate() may less than 2nd argument, need padding
			if curWidth + chunkWidth < targetWidth then
				suffix = suffix .. (' '):rep(targetWidth - curWidth - chunkWidth)
			end
			break
		end
		curWidth = curWidth + chunkWidth
	end
	table.insert(newVirtText, { suffix, 'MoreMsg' })
	return newVirtText
end

local function setup_ufo()
	vim.pack.add({
		'https://github.com/kevinhwang91/promise-async',
		'https://github.com/kevinhwang91/nvim-ufo'
	})

	vim.o.fillchars = 'eob: ,fold: ,foldopen:,foldsep: ,foldinner: ,foldclose:'
	vim.o.foldcolumn = '1'
	vim.o.foldlevel = 99
	vim.o.foldlevelstart = 99
	vim.o.foldenable = true

	vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
	vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)

	require('ufo').setup({
		fold_virt_text_handler = ufo_fold_text_handler,
		provider_selector = function(bufnr, filetype, buftype)
			return { 'treesitter', 'indent' }
		end
	})
end

function M.setup()
	setup_ufo()
end

return M
