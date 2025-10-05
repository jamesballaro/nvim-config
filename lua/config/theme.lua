local M = {}

local neotree_highlights = {
	NeoTreeDirectoryIcon = { fg = "#8ec07c", bold = true },
	NeoTreeDirectoryName = { fg = "#8ec07c", bold = true },
	NeoTreeRootName = { fg = "#8ec07c", bold = true },
	NeoTreeOpenedFolderName = { fg = "#8ec07c", bold = true },

	NeoTreeFileName = { fg = "#fce9cf" },
	NeoTreeFileIcon = { fg = "#fce9cf" },
	NeoTreeExecFile = { fg = "#fce9cf", italic = true },

	NeoTreeGitModified = { fg = "#8ec07c" },
	NeoTreeGitDeleted = { fg = "#d3869b" },
	NeoTreeGitRenamed = { fg = "#83a598" },
	NeoTreeGitConflict = { fg = "#e06c75" },
	NeoTreeGitUntracked = { fg = "#61afef" },

	NeoTreeNormal = { fg = "#c5c8d6", bg = "NONE" },
	NeoTreeIndentMarker = { fg = "#4b5263" },
	NeoTreeCursorLine = { bg = "#2c2c2c" },
	NeoTreeEndOfBuffer = { bg = "none" },
}

function M.apply_highlights()
	for group, settings in pairs(neotree_highlights) do
		vim.api.nvim_set_hl(0, group, settings)
	end
end

function M.setup()
	M.apply_highlights()

	vim.api.nvim_create_autocmd("ColorScheme", {
		group = vim.api.nvim_create_augroup("CustomTheme", { clear = true }),
		desc = "Apply custom theme highlights after colorscheme change",
		callback = function()
			M.apply_highlights()
			vim.api.nvim_set_hl(0, "TerminalNormalNC", { bold = true, fg = "#fce9cf" })
			vim.api.nvim_set_hl(0, "TerminalNormal", { bold = true, fg = "#fce9cf" })
		end,
	})
end

return M

