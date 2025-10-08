return {
	{
		"nvim-neo-tree/neo-tree.nvim",
		opts = {
			enable_git_status = true,
			enable_diagnostics = true,
			window = {
				width = 30,
				mappings = {
					["<S-h>"] = "toggle_hidden",
				},
			},
			filesystem = {
				filtered_items = {
					visible = false,
					hide_dotfiles = true,
					hide_gitignored = false,
				},
			},
		},
		keys = {
			{
				"<S-Tab>",
				function()
					require("neo-tree.command").execute({ source = "filesystem", toggle = true })
				end,
				desc = "Explorer NeoTree (toggle)",
			},
			{
				"<C-Left>",
				function()
					require("neo-tree.command").execute({ size = true })
				end,
				desc = "Change filetree width",
			},
			-- Increase filetree width with Ctrl->
			{
				"<C-Right>",
				function()
					require("neo-tree.command").execute({ size = true })
				end,
				desc = "Change filetree width",
			},
			-- Toggle  dotfiles
			{
				"<S-h>",
				function()
					local manager = require("neo-tree.sources.manager")
					local renderer = require("neo-tree.ui.renderer")
					local state = manager.get_state("filesystem")
					local filters = state.filtered_items
					filters.hide_dotfiles = not filters.hide_dotfiles
					renderer.redraw(state)
				end,
				desc = "Toggle  dotfiles",
			},
		},
	},
}
