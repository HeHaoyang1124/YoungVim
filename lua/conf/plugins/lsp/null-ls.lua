return {
    "jose-elias-alvarez/null-ls.nvim",
    config = function()
        local formatting = require("null-ls").builtins.formatting
        local diagnostics = require("null-ls").builtins.diagnostics
        local code_actions = require("null-ls").builtins.code_actions

        require("null-ls").setup({
            debug = false,
            sources = {
                -- Formatting ---------------------
                -- StyLua
                formatting.stylua,
                --c/c++
                formatting.clang_format,
                -- frontend
                formatting.prettier.with({ -- 比默认少了 markdown
                    filetypes = {
                        "c",
                        "cpp",
                    },
                    prefer_local = "node_modules/.bin",
                }),
                formatting.rustfmt,
                -- code actions ---------------------
                code_actions.gitsigns,
                code_actions.eslint.with({
                    prefer_local = "node_modules/.bin",
                }),
            },
            diagnostics_format = "[#{s}] #{m}",
            on_attach = function(_)
                vim.cmd([[ command! Format execute 'lua vim.lsp.buf.formatting_sync']])
            end,
        })
    end
}
