return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig",
        "nvimdev/lspsaga.nvim",
    },
    config = function()
        local servers = {
            lua_ls = {
                Lua = {
                    workspace = { checkThirdParty = false },
                    telemetry = { enable = false },
                },
            },
            clangd = {},
            cmake = {},
        }


        local on_attach = function(_, bufnr)
            local opt = {
                noremap = true,
                silent = true,
            }
            vim.keymap.set("n", "<C-I>", "<cmd>lua vim.lsp.buf.format()<CR>", opt)
            vim.keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opt)
            vim.keymap.set("n", "<leader>fe", "<cmd>Lspsaga code_action<CR>", opt)
            vim.keymap.set("n", "gd", "<cmd>Lspsaga goto_definition<CR>", opt)
            vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opt)

            vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<cr>", opt)
            vim.keymap.set("n", "gl", "<cmd>Lspsaga show_line_diagnostics<CR>", opt)
            vim.keymap.set("n", "gj", "<cmd>Lspsaga diagnostic_jump_next<CR>", opt)
            vim.keymap.set("n", "gk", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opt)
            -- vim.keymap.set("n", "go", "<cmd>Lspsaga outline<CR>", opt)
            vim.cmd([[Lspsaga winbar_toggle]])
        end

        require("mason").setup()
        require("mason-lspconfig").setup({
            ensure_installed = vim.tbl_keys(servers),
            handlers = {
                function(server_name) -- default handler (optional)
                    require("lspconfig")[server_name].setup {
                        settings = servers[server_name],
                        on_attach = on_attach,
                    }
                end,
            }
        })
    end
}
