return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
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
            clangd = {
                on_attach = function(client, bufnr)
                    client.server_capabilities.document_formatting = false
                    client.server_capabilities.document_range_formatting = false
                    local function buf_set_keymap(...)
                        vim.api.nvim_buf_set_keymap(bufnr, ...)
                    end
                    require("keybindings").mapLSP(buf_set_keymap)
                end,
            },
            cmake = {},
            glsl_analyzer = {},
        }


        local on_attach = function(_, bufnr)
            -- vim.cmd([[Lspsaga winbar_toggle]])
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
    end,

    keys = {
        { "<C-I>",      "<cmd>lua vim.lsp.buf.format()<CR>" },
        { "<leader>rn", "<cmd>Lspsaga rename<CR>" },
        { "<leader>fe", "<cmd>Lspsaga code_action<CR>" },
        { "gd",         "<cmd>Lspsaga goto_definition<CR>" },
        { "gD",         "<cmd>lua vim.lsp.buf.declaration()<CR>" },
        { "gp",         "<cmd>Lspsaga peek_definition<CR>" },
        { "gr",         "<cmd>Lspsaga finder<CR>" },
        { "K",          "<cmd>Lspsaga hover_doc<cr>" },
        { "gl",         "<cmd>Lspsaga show_line_diagnostics<CR>" },
        { "gj",         "<cmd>Lspsaga diagnostic_jump_next<CR>" },
        { "gk",         "<cmd>Lspsaga diagnostic_jump_prev<CR>" },
    }
}
