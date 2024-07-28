return {
    "hrsh7th/nvim-cmp",
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        {
            "garymjr/nvim-snippets",
            opts = {
                friendly_snippets = true,
            },
            dependencies = { "rafamadriz/friendly-snippets" },
        },
        "onsails/lspkind.nvim",
    },

    event = { "InsertEnter", "CmdlineEnter" },

    config = function()
        local cmp = require("cmp")
        local lspkind = require("lspkind")

        local select_next = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif vim.snippet.active({ direction = 1 }) then
                vim.schedule(function()
                    vim.snippet.jump(1)
                end)
            else
                fallback()
            end
        end, { "i", "s" })

        local select_prev = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif vim.snippet.active({ direction = 1 }) then
                vim.schedule(function()
                    vim.snippet.jump(-1)
                end)
            else
                fallback()
            end
        end, { "i", "s" })

        cmp.setup({

            snippet = {},

            mapping = cmp.mapping.preset.insert({
                -- ["<S-Tab>"] = cmp.mapping.select_prev_item(--[[ { behavior = cmp.SelectBehavior.Select } ]]),
                -- ["<Tab>"] = cmp.mapping.select_next_item(  --[[ { behavior = cmp.SelectBehavior.Select } ]]),
                ["<Tab>"] = select_next,
                ["<S-Tab>"] = select_prev,
                ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                ["<C-f>"] = cmp.mapping.scroll_docs(4),
                ["<C-a>"] = cmp.mapping.complete(), -- show completion suggestions
                ["<C-e>"] = cmp.mapping.abort(), -- close completion window
                ["<CR>"] = cmp.mapping.confirm({ select = false }),
            }),

            -- sources for autocompletion
            sources = cmp.config.sources({
                { name = "nvim_lsp" }, -- lsp
                { name = "snippets" }, -- snippets
                { name = "buffer" }, -- text within current buffer
                { name = "path" }, -- file system paths
            }),

            window = { completion = cmp.config.window.bordered() },

            experimental = { ghost_text = true },

            formatting = {
                format = lspkind.cmp_format({
                    mode = "symbol", -- show only symbol annotations
                    maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
                    -- can also be a function to dynamically calculate max width such as
                    -- maxwidth = function() return math.floor(0.45 * vim.o.columns) end,
                    ellipsis_char = "...", -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
                    show_labelDetails = true, -- show labelDetails in menu. Disabled by default

                    before = function(entry, vim_item)
                        vim_item.menu = "[" .. string.upper(entry.source.name) .. "]"
                        return vim_item
                    end,
                }),
            },
        })

        cmp.setup.cmdline(":", {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources({ { name = "path" } }, { { name = "cmdline" } }),
        })
    end,
}
