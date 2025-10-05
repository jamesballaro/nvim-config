return {
	{
		"folke/flash.nvim",
		enabled = true,
	},
	{
		"ggandor/leap.nvim",
		opts = function(_, opts)
			opts.enabled = true
			vim.api.nvim_set_hl(0, "LeapBackdrop", { link = "Comment" })
			vim.api.nvim_set_hl(0, "LeapLabel", {
				fg = "#ffffff",
				bold = false,
				nocombine = true,
			})
			return opts
		end,
	},
	{
		"folke/noice.nvim",
		opts = function(_, opts)
			opts.lsp.signature = {
				auto_open = { enabled = true },
			}
		end,
	},
	{
		"neovim/nvim-lspconfig",
		opts = {
			servers = {
				pyright = {},
			},
		},
	},
	{
		"numToStr/Comment.nvim",
		opts = {},
		lazy = false,
	},
	{
		"linux-cultist/venv-selector.nvim",
		dependencies = {
			"neovim/nvim-lspconfig",
			"mfussenegger/nvim-dap",
			"mfussenegger/nvim-dap-python",
			"nvim-telescope/telescope.nvim",
		},

		lazy = true,
		branch = "regexp",

		config = function()
			require("venv-selector").setup({})
			vim.api.nvim_create_autocmd("User", {
				pattern = "VenvActivated",
				callback = function()
					vim.cmd("LspRestart")
				end,
			})
		end,
		keys = {
			{ "<leader>vs", "<cmd>VenvSelect<cr>", desc = "Select Python venv" },
			{ "<leader>vl", "<cmd>VenvSelectCached<cr>", desc = "Use last venv" },
		},
	},
}
