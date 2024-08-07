return {
    "nvimdev/lspsaga.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "neovim/nvim-lspconfig",
    },
    config = function()
        local lspsaga = require("lspsaga")
        lspsaga.setup({
            debug = false,
            use_saga_diagnostic_sign = true,
            -- diagnostic sign
            error_sign = "",
            warn_sign = "",
            hint_sign = "󰌶",
            infor_sign = "",
            diagnostic_header_icon = "",
            -- code action title icon
            code_action_icon = " ",
            code_action_prompt = {
                enable = true,
                sign = true,
                sign_priority = 40,
                virtual_text = false,
            },
            finder_definition_icon = "  ",
            finder_reference_icon = "  ",
            max_preview_lines = 10,
            finder_action_keys = {
                -- open = "o",
                open = "<CR>",
                vsplit = "s",
                split = "i",
                -- quit = "q",
                quit = "<ESC>",
                scroll_down = "<C-f>",
                scroll_up = "<C-b>",
            },
            code_action_keys = {
                -- quit = "q",
                quit = "<ESC>",
                exec = "<CR>",
            },
            rename_action_keys = {
                -- quit = "<C-c>",
                quit = "<ESC>",
                exec = "<CR>",
            },
            definition_preview_icon = "󰀹",
            rename_prompt_prefix = "➤",
            rename_output_qflist = {
                enable = false,
                auto_open_qflist = false,
            },
            server_filetype_map = {},
            diagnostic_prefix_format = "%d. ",
            diagnostic_message_format = "%m %c",
            highlight_prefix = false,
            ui = {
                title = true,
                border = "rounded",
            },
            lightbulb = {
                enable = false,
            },

            symbol_in_winbar = {
                enable = false,
            },
            outline = {
                win_position = "right",
                win_with = "",
                win_width = 30,
                preview_width = 0.4,
                show_detail = true,
                auto_preview = true,
                auto_refresh = true,
                auto_close = true,
                auto_resize = false,
                custom_sort = nil,
                keys = {
                    expand_or_jump = 'o',
                    quit = "<F8>",
                },
            },
        })
    end
}
