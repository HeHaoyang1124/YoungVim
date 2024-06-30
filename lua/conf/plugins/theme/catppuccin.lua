return {
    "catppuccin/nvim",
    name = "catppuccin",
    -- event = "VeryLazy",
    lazy = true,
    config = function()
        require("catppuccin").setup({
            flavour = "auto", -- latte, frappe, macchiato, mocha
            background = {    -- :h background
                light = "latte",
                dark = "mocha",
            },
            transparent_background = require("conf.core.color").transparent, -- disables setting the background color.
            show_end_of_buffer = false,                                      -- shows the '~' characters after the end of buffers
            term_colors = true,                                              -- sets terminal colors (e.g. `g:terminal_color_0`)
            dim_inactive = {
                enabled = false,                                             -- dims the background color of inactive window
                shade = "dark",
                percentage = 0.15,                                           -- percentage of the shade to apply to the inactive window
            },
            no_italic = true,                                                -- Force no italic
            no_bold = false,                                                 -- Force no bold
            no_underline = false,                                            -- Force no underline
            styles = {
                comments = { "italic" },                                     -- Change the style of comments
                conditionals = { "italic" },
            },
            default_integrations = true,
            integrations = {
                cmp = true,
                gitsigns = true,
                nvimtree = true,
                neotree = true,
                treesitter = true,
                notify = false,
                mini = {
                    enabled = false,
                    -- indentscope_color = "",
                },
            },
        })
        vim.cmd [[colorscheme catppuccin]]
        vim.cmd [[hi LineNr guifg=none]]
        vim.cmd([[hi visual guifg=#fafafa cterm=underline]])
    end

}
