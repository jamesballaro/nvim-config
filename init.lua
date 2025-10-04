-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
require('leap').setup({
    default_mappings = false,  -- don’t set s, S, x, X automatically
})

require("config.theme").setup()
if vim.g.neovide then
    vim.g.neovide_scroll_animation_length = 0
    vim.g.neovide_cursor_trail_length = 0.1
    vim.g.neovide_cursor_trail_size = 0.1
    vim.g.neovide_cursor_animate_from = false
    vim.g.neovide_cursor_trail_slowdown = 0.1
end
