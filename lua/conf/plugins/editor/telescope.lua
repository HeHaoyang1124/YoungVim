return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.6',
    dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-telescope/telescope-ui-select.nvim'
    },
    config = function()
        require("telescope").load_extension("ui-select")
    end,
    keys = {
        {
            "<leader>ff",
            "<cmd>Telescope find_files<CR>",
            noremap = true,
            silent = true
        },
        {
            "<leader>fg",
            "<cmd>Telescope live_grep<CR>",
            noremap = true,
            silent = true
        },
        {
            "<leader>fb",
            "<cmd>Telescope buffers<CR>",
            noremap = true,
            silent = true
        },
        {
            "<leader>fh",
            "<cmd>Telescope help_tags<CR>",
            noremap = true,
            silent = true
        }
    }
}
