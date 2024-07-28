return {
    'phaazon/hop.nvim',
    branch = 'v2', -- optional but strongly recommended
    config = function()
        require 'hop'.setup {}
    end,
    keys = {
        { "<m-w>", "<cmd>HopWord<CR>", silent = true, noremap = true },
        { "<m-e>", "<cmd>HopAnywhere<CR>", silent = true, noremap = true },
        { "<m-r>", "<cmd>HopLine<CR>", silent = true, noremap = true }
    }
}
