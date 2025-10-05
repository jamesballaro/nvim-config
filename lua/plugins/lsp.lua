return {
	{
		"neovim/nvim-lspconfig",
		config = function()
			local lspconfig = require("lspconfig")
			local util = require("lspconfig.util")

			lspconfig.pyright.setup({
				settings = {
					python = {
						analysis = {
							typeCheckingMode = "basic",
							autoSearchPaths = true,
							useLibraryCodeForTypes = true,
							diagnosticSeverityOverrides = {
								reportMissingImports = "none",
								reportMissingModuleSource = "none",
								reportAttributeAccessIssue = "none",
							},
						},
					},
				},
				root_dir = function(fname)
					local util = require("lspconfig.util")
					return util.root_pattern("pyrightconfig.json")(fname) or vim.loop.os_homedir()
				end,
			})

			-- Clangd setup
			lspconfig.clangd.setup({
				cmd = { "clangd" },
				filetypes = { "c", "cpp", "objc", "objcpp" },
				root_dir = util.root_pattern("compile_commands.json", ".git"),
				single_file_support = true,
			})
		end,
	},

	-- Treesitter for syntax highlighting
	{
		"nvim-treesitter/nvim-treesitter",
		opts = {
			ensure_installed = {
				"cpp",
				"c",
				"python",
				"lua",
			},
			highlight = {
				enable = true,
			},
		},
	},

	-- Ensure LSPs are installed via mason-tool-installer
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		opts = {
			ensure_installed = {
				"pyright",
				"clangd",
			},
		},
	},
}
