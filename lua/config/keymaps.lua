local map = vim.keymap.set
local unmap = vim.keymap.del
local project = require("project_nvim.project")

-- ============================================================================
-- Plugin Setup
-- ============================================================================
require("leap").setup({
	default_mappings = false,
})

-- ============================================================================
-- Navigation
-- ============================================================================
-- Leap (quick cursor movement)
map("n", "s", "<Plug>(leap-forward)", { desc = "Leap forward" })
map("n", "S", "<Plug>(leap-backward)", { desc = "Leap backward" })

-- Faster scrolling with Shift
map({ "n", "v" }, "<S-Down>", "5j", { noremap = true, desc = "Scroll down 5 lines" })
map({ "n", "v" }, "<S-Up>", "5k", { noremap = true, desc = "Scroll up 5 lines" })
map({ "n", "v" }, "<S-j>", "5j", { noremap = true, desc = "Scroll down 5 lines" })
map({ "n", "v" }, "<S-k>", "5k", { noremap = true, desc = "Scroll up 5 lines" })
map("n", "<S-PageDown>", "5<PageDown>", { noremap = true, desc = "Page down 5x" })
map("n", "<S-PageUp>", "5<PageUp>", { noremap = true, desc = "Page up 5x" })

-- ============================================================================
-- Window Management
-- ============================================================================
map("n", "<C-=>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
map("n", "<C-->", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
map("n", "<C-.>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })
map("n", "<C-,>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })

-- ============================================================================
-- Project Management
-- ============================================================================
map("n", "<leader>ap", project.add_project_manually, { desc = "Add project manually" })
map("n", "<leader>p", ":Telescope project<CR>", { desc = "Open Telescope project" })

-- ============================================================================
-- Terminal
-- ============================================================================
unmap("n", "<C-/>")
-- Open/focus terminal
map({ "n", "v", "t" }, "<C-;>", function()
	local term = require("snacks.terminal")
	local current_buf = vim.api.nvim_get_current_buf()

	for _, win in ipairs(vim.api.nvim_list_wins()) do
		local buf = vim.api.nvim_win_get_buf(win)
		if vim.bo[buf].buftype == "terminal" then
			if buf == current_buf then
				term.toggle(nil, { cwd = require("lazyvim.util").root() })
				return
			end
			vim.api.nvim_set_current_win(win)
			vim.cmd("startinsert")
			return
		end
	end

	-- If no terminal found, open a new one
	term.toggle(nil, { cwd = require("lazyvim.util").root() })
end, { desc = "Toggle/focus terminal" })

map({ "n", "t" }, "<Esc>", "<Esc><Esc>", { noremap = true, silent = true, desc = "Escape terminal" })
-- ============================================================================
-- Editing
-- ============================================================================
-- Command mode shortcut
map({ "n", "i", "v" }, ";", ":", { desc = "Enter command mode" })

-- Undo/Redo
map({ "n", "v" }, "<S-U>", "<C-R>", { noremap = true, desc = "Redo" })

-- Black hole deletion
map("v", "d", '"_d', { noremap = true, desc = "Delete without copying" })
map("n", "dd", '"_dd', { noremap = true, desc = "Delete without copying" })

-- Remove trailing whitespace
map("n", "<leader>tw", ":%s/\\s\\+$//e<CR>", { desc = "Trim trailing whitespace" })

-- Comments
map("n", "<C-/>", require("Comment.api").toggle.linewise.current, { desc = "Comment current line" })
-- ============================================================================
-- Application
-- ============================================================================
-- Return to dashboard
map(
	"n",
	"<leader>db",
	"<cmd>%bdelete!<cr><cmd>lua require('snacks.dashboard').open()<cr>",
	{ desc = "Return to dashboard" }
)
-- Quit Neovim
map("n", "<leader>qq", ":qa<CR>", { desc = "Quit Neovim" })
