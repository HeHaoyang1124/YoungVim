return {
    "stevearc/aerial.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        require("aerial").setup({
            -- optionally use on_attach to set keymaps when aerial has attached to a buffer
            on_attach = function(bufnr)
                -- Jump forwards/backwards with '{' and '}'
                vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
                vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr })
            end,
        })
    end,
    keys = {
        { "<leader>a", "<cmd>AerialToggle!<CR>" },
        { "<F2>", "<cmd>AerialToggle!<CR>" },
    }

}
