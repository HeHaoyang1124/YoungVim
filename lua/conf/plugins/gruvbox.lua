return {
    "ellisonleao/gruvbox.nvim",
    lazy = true,
    -- event = "VeryLazy",
    config = function()
        require("gruvbox").setup({
            terminal_colors = true, -- add neovim terminal colors
            undercurl = true,
            underline = true,
            bold = true,
            italic =
            {
                strings = false,
                emphasis = false,
                comments = false,
                operators = false,
                folds = false,
            },
            strikethrough = true,
            invert_selection = false,
            invert_signs = false,
            invert_tabline = false,
            invert_intend_guides = false,
            inverse = true,
            contrast = "hard",
            palette_overrides = {},
            overrides = {},
            dim_inactive = false,
            transparent_mode = true,
        })
        vim.cmd([[colorscheme gruvbox]])
        vim.cmd([[hi visual guifg=#fafafa cterm=underline]])
    end
}
