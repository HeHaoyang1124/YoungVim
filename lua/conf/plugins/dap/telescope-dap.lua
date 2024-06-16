return {
    "nvim-telescope/telescope-dap.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "mfussenegger/nvim-dap",
        'nvim-telescope/telescope.nvim',
    },
    config = function()
        require('telescope').load_extension('dap')
    end
}
