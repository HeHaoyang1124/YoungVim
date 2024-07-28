return {
    'tikhomirov/vim-glsl',
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
    },
    lazy = false,
    opt = true,
    config = function()
        require("mason-lspconfig").setup({ ensure_installed = "glsl_analyzer" })
        vim.cmd [[ autocmd BufRead,BufNewFile *.vert :LspStart glsl_analyzer]]
        vim.cmd [[ autocmd BufRead,BufNewFile *.frag :LspStart glsl_analyzer]]
    end

}
