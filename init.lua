-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
require("leap").setup({
	default_mappings = false, -- don’t set s, S, x, X automatically
})

require("config.theme").setup()
