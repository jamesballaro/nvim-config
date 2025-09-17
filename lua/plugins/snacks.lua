return {
    {
        "snacks.nvim",
        opts = function(_, opts)
            -- Customize styles
            opts.styles = {
                terminal = {
                    height = 0.2,
                },
            }

            -- Configure dashboard with custom header
            opts.dashboard = {
                enabled = true,
                preset = {
                    header = [[
███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝
]],
                },
                sections = {
                    { section = "header" },
                    { icon = " ", title = "Keymaps", section = "keys", indent = 2, padding = 1 },
                    { icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
                    { icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
                    -- { section = "startup" },
                },
            }
            opts.scroll = { enabled = false }

            -- Set up highlights after colorscheme loads
            vim.api.nvim_create_autocmd({ "ColorScheme", "VimEnter" }, {
                callback = function()
                    -- Dashboard highlights
                    vim.api.nvim_set_hl(0, "SnacksDashboardNormal", { bg = "#292828", fg = "#fce9cf" })
                    vim.api.nvim_set_hl(0, "SnacksDashboardHeader", { fg = "#83a598", bold = true })
                    vim.api.nvim_set_hl(0, "SnacksDashboardTitle", { fg = "#8ec07c", bold = true })
                    vim.api.nvim_set_hl(0, "SnacksDashboardKey", { fg = "#83a598", bold = true })
                    vim.api.nvim_set_hl(0, "SnacksDashboardIcon", { fg = "#fce9cf" })
                    vim.api.nvim_set_hl(0, "SnacksDashboardDesc", { fg = "#fce9cf" })
                    vim.api.nvim_set_hl(0, "SnacksDashboardDir", { fg = "#b5b1ac" })
                    vim.api.nvim_set_hl(0, "SnacksDashboardFile", { fg = "#fce9cf" })

                    -- Terminal highlights
                    vim.api.nvim_set_hl(0, "SnacksNormal", { bg = "#292828", fg = "#fce9cf" })
                    vim.api.nvim_set_hl(0, "SnacksNormalNC", { bg = "#292828", fg = "#fce9cf" })
                end,
            })

            opts.indent = {
                priority = 1,
                enabled = true, -- enable indent guides
                char = "│",
                animate = {
                    enabled = false,
                },
            }

            return opts
        end,

        keys = {
            --  { "<C-/>", false },
        },
    },
}
