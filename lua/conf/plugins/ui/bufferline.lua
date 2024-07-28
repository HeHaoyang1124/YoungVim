return {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons',
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        local bufferline = require('bufferline')
        bufferline.setup {
            options = {
                mode = "buffers", -- set to "tabs" to only show tabpages instead
                style_preset = bufferline.style_preset.default, -- or bufferline.style_preset.minimal,
                themable = true, -- allows highlight groups to be overriden i.e. sets highlights as default
                numbers = "none",
                close_command = "bdelete! %d", -- can be a string | function, | false see "Mouse actions"
                right_mouse_command = "bdelete! %d", -- can be a string | function | false, see "Mouse actions"
                left_mouse_command = "buffer %d", -- can be a string | function, | false see "Mouse actions"
                middle_mouse_command = nil, -- can be a string | function, | false see "Mouse actions"
                indicator = {
                    icon = '|', -- this should be omitted if indicator style is not 'icon'
                    style = 'icon'
                    -- style = 'icon' -- 'icon' | 'underline' | 'none',
                },
                buffer_close_icon = '󰅖',
                modified_icon = '●',
                close_icon = '',
                left_trunc_marker = '',
                right_trunc_marker = '',
                diagnostics = "nvim_lsp",

                color_icons = true,
                show_buffer_icons = true,
                show_buffer_close_icons = true,
                show_close_icon = true,
                show_tab_indicators = true,
                show_duplicate_prefix = true,    -- whether to show duplicate buffer prefix
                duplicates_across_groups = true, -- whether to consider duplicate paths in different groups as duplicates
                persist_buffer_sort = true,      -- whether or not custom sorted buffers should persist
                move_wraps_at_ends = true,      -- whether or not the move command "wraps" at the first or last position
                separator_style = "thin",       -- "slant" | "slope" | "thick" | "thin" | { 'any', 'any' },
                enforce_regular_tabs = false,
                always_show_bufferline = true,
                hover = {
                    enabled = true,
                    delay = 200,
                    reveal = { 'close' }
                },

                offsets = {
                    {
                        filetype = "neo-tree",
                        text = "󰙅 File Explorer",
                        highlight = "Directory",
                        text_align = "center"
                    },
                    {
                        filetype = "NvimTree",
                        text = " File",
                        highlight = "Directory",
                        text_align = "left"
                    }
                }

            }
        }

        vim.opt.termguicolors = true
        vim.api.nvim_set_keymap("n", "<C-n>", ":bnext<CR>", { noremap = true, silent = true })
        vim.api.nvim_set_keymap("n", "<C-p>", ":bprevious<CR>", { noremap = true, silent = true })
    end
}
