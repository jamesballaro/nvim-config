return {
    {
        "folke/flash.nvim",
        enabled = false,
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
            -- Add your desired language servers here
            servers = {
                pyright = {},
            },
        },
    },
    {
        "linux-cultist/venv-selector.nvim",
        dependencies = {
            "neovim/nvim-lspconfig",
            "mfussenegger/nvim-dap",
            "mfussenegger/nvim-dap-python", --optional
            { "nvim-telescope/telescope.nvim", branch = "0.1.x", dependencies = { "nvim-lua/plenary.nvim" } },
        },
        lazy = true,
        branch = "regexp", -- This is the regexp branch, use this for the new version
        config = function()
            require("venv-selector").setup()
        end,
        keys = {
            { ",v", "<cmd>VenvSelect<cr>" },
        },
    },
}
