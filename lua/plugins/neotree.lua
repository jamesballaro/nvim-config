return {
    {
        "nvim-neo-tree/neo-tree.nvim",
        opts = {
            enable_git_status = true,
            enable_diagnostics = true,
            window = {
                width = 30,
                mappings = {
                    ["<S-Tab>"] = function(state)
                        local node = state.tree:get_node()
                        if require("neo-tree.utils").is_expandable(node) then
                            state.commands["toggle_node"](state)
                        else
                            state.commands["open"](state)
                        end
                    end,
                },
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
            -- New File with Shift-N
            -- {
            --     "<S-n>",
            --     function()
            --         require("neo-tree.command").execute({ action = "new" })
            --     end,
            --     desc = "New File",
            -- },
            -- Decrease filetree width with Ctrl-<
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
