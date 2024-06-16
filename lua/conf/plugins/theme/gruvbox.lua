return {
    "ellisonleao/gruvbox.nvim",
    lazy = true,
    event = "VeryLazy",
    -- priority = 1000,
    config = function()
        require("gruvbox").setup({
            terminal_colors = require("conf.core.color").transparent,
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
    end
}
