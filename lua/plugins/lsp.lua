return {
	{
		"neovim/nvim-lspconfig",
		config = function()
			local lspconfig = require("lspconfig")
			local util = require("lspconfig.util")

			-- Clangd setup
			lspconfig.clangd.setup({
				cmd = { "clangd" },
				filetypes = { "c", "cpp", "objc", "objcpp" },
				root_dir = util.root_pattern("compile_commands.json", ".git"),
				single_file_support = true,
			})
		end,
	},

	-- Ensure LSPs are installed via mason-tool-installer
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		opts = {
			ensure_installed = {
				"pyright",
				"clangd",
				"yamlls",
				"jsonls",
			},
		},
	},
}
