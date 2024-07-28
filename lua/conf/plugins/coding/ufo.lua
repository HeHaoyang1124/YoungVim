return {
    'kevinhwang91/nvim-ufo',
    dependencies = 'kevinhwang91/promise-async',
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        -- vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
        vim.o.foldcolumn = '0' -- '0' is not bad
        vim.o.foldlevel = 99   -- Using ufo provider need a large value, feel free to decrease the value
        vim.o.foldlevelstart = 99
        vim.o.foldenable = true

        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities.textDocument.foldingRange = {
            dynamicRegistration = false,
            lineFoldingOnly = true
        }
        local language_servers = require("lspconfig").util.available_servers() -- or list servers manually like {'gopls', 'clangd'}
        for _, ls in ipairs(language_servers) do
            require('lspconfig')[ls].setup({
                capabilities = capabilities
            })
        end

        require('ufo').setup()
    end,
    keys = {
        { "zR", "<CMD>lua require('ufo').openAllFolds()<CR>",         noremap = true, silent = true },
        { "zM", "<CMD>lua require('ufo').closeAllFolds()<CR>",        noremap = true, silent = true },
        { "zr", "<CMD>lua require('ufo').openFoldsExceptKinds()<CR>", noremap = true, silent = true },
        { "zm", "<CMD>lua require('ufo').closeFoldsWith()<CR>",       noremap = true, silent = true },
    }
}
