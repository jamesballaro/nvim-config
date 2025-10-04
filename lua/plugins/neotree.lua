return {
    {
        "nvim-neo-tree/neo-tree.nvim",
        opts = {
            enable_git_status = true,
            enable_diagnostics = true,
            window = {
                width = 30,
                -- v
            },
            filesystem = {
                filtered_items = {
                    visible = false,
                    hide_dotfiles = false,
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
        },
    },
}
