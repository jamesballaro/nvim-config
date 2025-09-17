-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
local map = vim.keymap.set
local project = require("project_nvim.project")

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
map({ "n", "v" }, "<S-U>", "<C-R>", { noremap = true })
-- New Dashboard tab
map("n", "<leader>sf", function()
    vim.cmd("tabnew")
    Snacks.dashboard.open()
end, { desc = "Show Dashboard (New Tab)" })
-- Go back to Dashboard
map("n", "<leader>se", function()
    vim.cmd("enew") -- clears current buffer
    Snacks.dashboard.open()
end, { desc = "Show Dashboard (Clear Buffer)" })
vim.keymap.set("n", "<leader>tw", ":%s/\\s\\+$//e<CR>", { desc = "Trim trailing whitespace" })
