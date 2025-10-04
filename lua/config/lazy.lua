local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out, "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
    spec = {
        { "LazyVim/LazyVim", import = "lazyvim.plugins" },
        {
            "sainnhe/gruvbox-material",
            --"marko-cerovac/material.nvim",
            lazy = false,
            priority = 1000,
            config = function()
                vim.cmd.colorscheme("gruvbox-material")
                vim.g.gruvbox_material_background = "medium"
                -- vim.api.nvim_set_hl(0, "TerminalNormalNC", { bold = true, fg = "#ffffff" })
                -- vim.api.nvim_set_hl(0, "TerminalNormal", { bold = true, fg = "#ffffff" })
            end,
        },
        {
            "karb94/neoscroll.nvim",
            opts = {
                duration_multiplier = 0.2,
                easing = "cubic",
            },
        },
        {
            "rachartier/tiny-inline-diagnostic.nvim",
            event = "VeryLazy", -- Or `LspAttach`
            priority = 1000, -- needs to be loaded in first
            config = function()
                require("tiny-inline-diagnostic").setup({
                    preset = "classic",
                })
                vim.diagnostic.config({ virtual_text = false }) -- Only if needed in your configuration, if you already have native LSP diagnostics
            end,
        },
        {
            "akinsho/toggleterm.nvim",
            version = "*",
            config = true,
            keys = {
                { "<leader>tt", "<cmd>ToggleTerm<cr>", desc = "Toggle Terminal" },
            },
        },
        {
            "hrsh7th/nvim-cmp",
            event = "InsertEnter",
            dependencies = {
                "L3MON4D3/LuaSnip",
                "saadparwaiz1/cmp_luasnip",
                "rafamadriz/friendly-snippets",
                "hrsh7th/cmp-buffer",
                "hrsh7th/cmp-path",
                "hrsh7th/cmp-nvim-lsp",
                "hrsh7th/cmp-nvim-lua",
            },
            config = function()
                local cmp = require("cmp")
                local luasnip = require("luasnip")

                require("luasnip.loaders.from_vscode").lazy_load()

                cmp.setup({
                    snippet = {
                        expand = function(args)
                            luasnip.lsp_expand(args.body)
                        end,
                    },
                    mapping = cmp.mapping.preset.insert({
                        ["<Tab>"] = cmp.mapping.select_next_item(),
                        ["<S-Tab>"] = cmp.mapping.select_prev_item(),
                        ["<CR>"] = cmp.mapping.confirm({ select = true }),
                        ["<C-Space>"] = cmp.mapping.complete(),
                    }),
                    sources = cmp.config.sources({
                        { name = "nvim_lsp" },
                        { name = "luasnip" },
                        { name = "buffer" },
                        { name = "path" },
                        { name = "nvim_lua" },
                    }),
                    formatting = {
                        format = require("lspkind").cmp_format({
                            mode = "symbol_text", -- Shows symbol + text (e.g. "λ function")
                            maxwidth = 50, -- Truncate long entries
                            ellipsis_char = "...", -- Char to show truncated content
                        }),
                    },
                })
            end,
        },
        { "VonHeikemen/lsp-zero.nvim", branch = "v3.x" },
        { "neovim/nvim-lspconfig" },
        { "mason-org/mason.nvim" },
        { "mason-org/mason-lspconfig.nvim" },
        { "WhoIsSethDaniel/mason-tool-installer.nvim" },
        -- {
        --     "supermaven-inc/supermaven-nvim",
        --     event = "InsertEnter",
        --     config = function()
        --         require("supermaven-nvim").setup({})
        --     end,
        -- },
        -- {
        --     "onsails/lspkind.nvim",
        --     config = function()
        --         require("lspkind").init()
        --     end,
        -- },
        -- import/override with your plugins
        { import = "plugins" },
    },
    defaults = {
        lazy = false,
        version = false,
    },
    -- install = { colorscheme = { "tokyonight", "habamax", "gruvbox-material" } },
    checker = {
        enabled = true,
        notify = false,
    },
    performance = {
        rtp = {
            -- disable some rtp plugins
            disabled_plugins = {
                "gzip",
                -- "matchit",
                -- "matchparen",
                -- "netrwPlugin",
                "tarPlugin",
                "tohtml",
                "tutor",
                "zipPlugin",
            },
        },
    },
}
require("lazy").setup(plugins)
