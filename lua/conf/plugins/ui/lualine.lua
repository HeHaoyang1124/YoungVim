return
{
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    -- event = "VeryLazy",
    -- priority = 1000,
    lazy = false,
    config = function()
        require('lualine').setup {
            options = {
                icons_enabled = true,
                -- theme = 'gruvbox-material',
                theme = require("conf.core.color").themeName == "gruvbox" and 'gruvbox-material' or 'auto',
                component_separators = { left = '', right = '' },
                section_separators = { left = '', right = '' },
                disabled_filetypes = {
                    statusline = {},
                    winbar = {},
                },
                ignore_focus = {},
                always_divide_middle = true,
                globalstatus = true,
                refresh = {
                    statusline = 1000,
                    tabline = 1000,
                    winbar = 1000,
                }
            },
            sections = {
                lualine_a = { { 'mode', separator = { left = require("conf.core.color").themeName == "catppuccin" and '' or '', right = '' } } },
                lualine_b = {
                    'branch',
                    {
                        'diff',
                        symbols = {
                            added = ' ',
                            modified = ' ',
                            removed = ' ' }
                    },
                    {
                        'diagnostics',
                        symbols = {
                            error = ' ', -- Changes diagnostics' error color.
                            warn  = ' ', -- Changes diagnostics' warn color.
                            info  = ' ', -- Changes diagnostics' info color.
                            hint  = '󰌶 ', -- Changes diagnostics' hint color.
                        }
                    },
                },
                lualine_c = {
                    {
                        'windows',
                        symbols = {
                            modified = '󰻃 ', -- Text to show when the file is modified.
                            readonly = ' ', -- Text to show when the file is non-modifiable or readonly.
                            unnamed = '[No Name]', -- Text to show for unnamed buffers.
                            newfile = '[New]', -- Text to show for newly created file before first write
                        },
                        filetype_names = {
                            TelescopePrompt = 'Telescope',
                            dashboard = 'Dashboard',
                            packer = 'Packer',
                            fzf = 'FZF',
                            alpha = 'Alpha',
                            aerial = "aerial"
                        },
                        use_mode_colors = false,
                    },
                },
                lualine_x = {
                    'encoding', { 'datetime', style = '%H:%M' },
                    { 'progress', icon = { '', align = 'left' } },
                },
                lualine_y = { {
                    function()
                        local msg = 'No Active Lsp'
                        local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
                        local clients = vim.lsp.get_active_clients()
                        if next(clients) == nil then
                            return msg
                        end
                        for _, client in ipairs(clients) do
                            local filetypes = client.config.filetypes
                            if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
                                return client.name
                            end
                        end
                        return msg
                    end,
                    icon = ' LSP:',
                    color = { gui = 'bold' },
                },
                },
                lualine_z = { 'fileformat', { 'hostname', separator = { left = '', right = require("conf.core.color").themeName == "catppuccin" and '' or '' } } }
            },
            tabline = {},
            winbar = {},
            inactive_winbar = {},
            extensions = {},
        }
    end
}
