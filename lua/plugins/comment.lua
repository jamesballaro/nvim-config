return {
	"numToStr/Comment.nvim",
	lazy = false,
	config = function()
		require("Comment").setup({
			padding = true,
			sticky = true,
			toggler = {
				line = "<C-/>", -- Normal mode line comment
			},
			opleader = {
				line = "<C-/>", -- Visual mode line comment
			},
		})
	end,
}
