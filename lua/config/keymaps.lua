local map = vim.keymap.set
local unmap = vim.keymap.del
local project = require("project_nvim.project")
require("leap").setup({
	default_mappings = false,
})

map("n", "s", "<Plug>(leap-forward)")
map("n", "S", "<Plug>(leap-backward)")
-- Set up the keymap
map("n", "<leader>ap", project.add_project_manually, { desc = "Add project manually" })
map("n", "<leader>p", ":Telescope project<CR>", { desc = "Open Telescope Project" })
map({ "n", "i", "v" }, ";", ":", { desc = "Enter command line without <S-;> " })
map("n", "<C-=>", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })
map("n", "<C-->", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })
map("n", "<C-.>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })
map("n", "<C-,>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })
-- Faster scrolling with Shift (works in both terminal and GUI)
map("n", "<S-Down>", "5j", { noremap = true })
map("n", "<S-Up>", "5k", { noremap = true })
map("n", "<S-PageDown>", "5<PageDown>", { noremap = true })
map("n", "<S-PageUp>", "5<PageUp>", { noremap = true })
map("n", "<S-j>", "5j", { noremap = true })
map("n", "<S-k>", "5k", { noremap = true })
-- Terminal
unmap("n", "<C-/>")
map({ "n", "v", "t" }, "<C-;>", function()
	require("snacks.terminal").toggle(nil, { cwd = require("lazyvim.util").root() })
end, { desc = "Terminal (Root Dir)" })
-- Undo
map({ "n", "v" }, "<S-U>", "<C-R>", { noremap = true })
-- Remove trailing whitespace in any file
map("n", "<leader>tw", ":%s/\\s\\+$//e<CR>", { desc = "Trim trailing whitespace" })
-- Comment
map({ "n", "v" }, "<C-/>", require("Comment.api").toggle.linewise.current, { desc = "Toggle comment (Ctrl+/)" })
-- Return to LazyVim dashboard from anywhere
map("n", "<leader>db", function()
	for _, buf in ipairs(vim.api.nvim_list_bufs()) do
		if vim.api.nvim_buf_is_loaded(buf) and vim.bo[buf].buflisted then
			vim.api.nvim_buf_delete(buf, { force = true })
		end
	end
	vim.cmd("enew") -- ensure a clean buffer
	vim.cmd("lua require('snacks.dashboard').open()")
end, { desc = "Return to Dashboard" })
-- Quit Neovim
map("n", "<leader>qq", ":qa<CR>", { desc = "Quit Neovim" })
