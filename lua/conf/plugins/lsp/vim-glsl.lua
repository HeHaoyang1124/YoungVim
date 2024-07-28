return {
    {
        "mason.nvim",
        opts = { ensure_installed = { "glsl_analyzer" } },
    },
    {
        "nvim-treesitter/nvim-treesitter",
        opts = { ensure_installed = { "glsl" } },
    },

    {
        'tikhomirov/vim-glsl',
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            "mason.nvim",
            "nvim-treesitter/nvim-treesitter",
        },

        lazy = true,
        opt = {

        },
        config = function()
            vim.cmd [[ autocmd BufRead,BufNewFile *.vert :LspStart glsl_analyzer]]
            vim.cmd [[ autocmd BufRead,BufNewFile *.frag :LspStart glsl_analyzer]]
        end,
    },
}
