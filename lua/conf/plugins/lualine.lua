return
{
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    -- lazy = true,
    event = "VeryLazy",
    -- priority = 1000,
    -- event = { "BufReadPre", "BufNewFile" },
    config = function()
        require('lualine').setup {
            options = {
                icons_enabled = true,
                theme = 'auto',
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
                lualine_a = { { 'mode', separator = { left = '', right = '' } } },
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
                    }
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
                    }
                },
                lualine_x = { 'encoding', { 'datetime', style = '%H:%M' } },
                lualine_y = { { 'progress', icon = { '', align = 'left' } } },
                lualine_z = { 'fileformat', { 'hostname', separator = { left = '', right = ''} } }
            },
            tabline = {},
            winbar = {},
            inactive_winbar = {},
            extensions = {},
        }
    end
}
