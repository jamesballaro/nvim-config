local M = {}

-- Color palette
local colors = {
	bg = "#292828",
	fg = "#fce9cf",
	green = "#8ec07c",
	blue = "#83a598",
	pink = "#d3869b",
	light_blue = "#61afef",
	red = "#e06c75",
	gray = "#c5c8d6",
	dark_gray = "#4b5263",
	cursor_line = "#2c2c2c",
}

-- NeoTree highlights
local neotree_highlights = {
	-- Directories (all use green + bold)
	NeoTreeDirectoryIcon = { fg = colors.green, bold = true },
	NeoTreeDirectoryName = { fg = colors.green, bold = true },
	NeoTreeRootName = { fg = colors.green, bold = true },
	NeoTreeOpenedFolderName = { fg = colors.green, bold = true },

	-- Files (all use foreground color)
	NeoTreeFileName = { fg = colors.fg },
	NeoTreeFileIcon = { fg = colors.fg },
	NeoTreeExecFile = { fg = colors.fg, italic = true },

	-- Git status
	NeoTreeGitModified = { fg = colors.green },
	NeoTreeGitDeleted = { fg = colors.pink },
	NeoTreeGitRenamed = { fg = colors.blue },
	NeoTreeGitConflict = { fg = colors.red },
	NeoTreeGitUntracked = { fg = colors.light_blue },

	-- UI elements
	NeoTreeNormal = { fg = colors.gray, bg = "NONE" },
	NeoTreeIndentMarker = { fg = colors.dark_gray },
	NeoTreeCursorLine = { bg = colors.cursor_line },
	NeoTreeEndOfBuffer = { bg = "NONE" },
}

local terminal_highlights = {
	TerminalNormal = { bold = true, fg = colors.fg },
	TerminalNormalNC = { bold = true, fg = colors.fg },
}
function M.apply_highlights()
	-- Apply NeoTree highlights
	for group, settings in pairs(neotree_highlights) do
		vim.api.nvim_set_hl(0, group, settings)
	end

	-- Apply terminal highlights
	for group, settings in pairs(terminal_highlights) do
		vim.api.nvim_set_hl(0, group, settings)
	end
end

function M.setup()
	M.apply_highlights()

	vim.api.nvim_set_hl(0, "Visual", { bg = "#5c626b", fg = "NONE" })
	vim.api.nvim_create_autocmd("ColorScheme", {
		group = vim.api.nvim_create_augroup("CustomTheme", { clear = true }),
		desc = "Apply custom theme highlights after colorscheme change",
		callback = M.apply_highlights,
	})
end

return M
