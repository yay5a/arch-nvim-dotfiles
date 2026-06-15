---@module "lazy"
---@type LazySpec
return {
    {
        "saghen/blink.cmp",
        version = "v1.*",
        dependencies = {
            "L3MON4D3/LuaSnip",
            "rafamadriz/friendly-snippets",
        },
        config = function()
            require("blink.cmp").setup({
                fuzzy = {
                    implementation = "prefer_rust_with_warning",
                },
                signature = { enabled = true },
                keymap = {
                    preset = "super-tab",
                },
                completion = {
                    menu = {
                        draw = {
                            -- We don't need label_description now because label and label_description are already
                            -- combined together in label by colorful-menu.nvim.
                            columns = { { "kind_icon" }, { "label", gap = 1 } },
                            components = {
                                label = {
                                    text = function(ctx)
                                        return require("colorful-menu").blink_components_text(ctx)
                                    end,
                                    highlight = function(ctx)
                                        return require("colorful-menu").blink_components_highlight(ctx)
                                    end,
                                },
                            },
                        },
                        auto_show = true,
                        auto_show_delay_ms = 500
                    },
                    documentation = {
                        auto_show = true,
                    },
                    ghost_text = {
                        enabled = true,
                        show_with_menu = false,
                    },
                    accept = {
                        auto_brackets = {
                            enabled = true,
                        },
                    },
                },
                cmdline = {
                    enabled = true,
                    keymap = { preset = "cmdline" },
                    completion = {
                        menu = { auto_show = true },
                    },
                },
                sources = {
                    default = { "lsp", "path", "buffer", "snippets" },
                    providers = {
                        lsp = {
                            fallbacks = {},
                            opts = {
                                tailwind_color_icon = "󱓻"
                            }
                        }
                    }
                },
                appearance = {
                    use_nvim_cmp_as_default = false,
                    nerd_font_variant = "mono",
                },
                snippets = {
                    preset = "luasnip"
                },
            })
            require("luasnip.loaders.from_vscode").lazy_load()
        end,
    },
}
