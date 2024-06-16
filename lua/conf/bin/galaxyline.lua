return {
    'glepnir/galaxyline.nvim',
    branch = 'main',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    lazy = true,
    -- event = { "BufReadPre", "BufNewFile" },
    config = function()
        local gl = require('galaxyline')
        local condition = require('galaxyline.condition')

        local theme = require("conf.core.color").theme
        local function mode_alias(m)
            local alias = {
                n = 'NORMAL',
                i = 'INSERT',
                c = 'COMMAND',
                R = 'REPLACE',
                t = 'TERMINAL',
                [''] = 'V-BLOCK',
                V = 'V-LINE',
                v = 'VISUAL',
            }

            return alias[m] or ''
        end

        local function mode_color(m)
            local mode_colors = {
                --normal =  colors.green,
                normal  = theme.blue,
                insert  = theme.green,
                visual  = theme.purple,
                replace = theme.red,
                --insert =  colors.blue,
                --visual =  colors.purple,
                --replace =  colors.red,
            }

            local color = {
                n = mode_colors.normal,
                i = mode_colors.insert,
                c = mode_colors.replace,
                R = mode_colors.replace,
                t = mode_colors.insert,
                [''] = mode_colors.visual,
                V = mode_colors.visual,
                v = mode_colors.visual,
            }

            --return color[m] or colors.bg_light
            return color[m] or theme.gray
        end


        gl.section.left[0] = {
            LeftEdge = {
                highlight = { theme.black, theme.bg },
                provider = function() return "" end,
            }
        }

        gl.section.left[1] = {
            ViModeIcon = {
                separator = '  ',
                separator_highlight = { theme.black, theme.gray },
                highlight = { theme.white, theme.black },

                provider = function()
                    local m = vim.fn.mode() or vim.fn.visualmode()
                    local color = mode_color(m)
                    vim.api.nvim_command('hi GalaxyViModeIcon guifg=' .. color)
                    return "    "
                end,

            }
        }

        gl.section.left[2] = {
            CWD = {
                separator = '  ',
                separator_highlight = function()
                    return { theme.gray, condition.buffer_not_empty() and theme.black or theme.bg }
                end,
                highlight = { theme.dark, theme.gray },
                provider = function()
                    local dirname = vim.fn.fnamemodify(vim.fn.getcwd(), ':t')
                    return ' ' .. dirname .. ' '
                end,
            }
        }

        gl.section.left[3] = {
            FileIcon = {
                provider = 'FileIcon',
                condition = condition.buffer_not_empty,
                highlight = { theme.white, theme.black },
            }
        }

        gl.section.left[4] = {
            FileName = {
                provider = 'FileName',
                condition = condition.buffer_not_empty,
                highlight = { theme.white, theme.black },
                separator_highlight = { theme.black, theme.bg },
                separator = '',
            }
        }

        gl.section.left[5] = {
            DiagnosticError = {
                provider = 'DiagnosticError',
                icon = '  ',
                highlight = { theme.red, theme.bg }
            }
        }

        gl.section.left[6] = {
            DiagnosticWarn = {
                provider = 'DiagnosticWarn',
                icon = '  ',
                highlight = { theme.yellow, theme.bg },
            }
        }

        gl.section.right[0] = {
            GitBranch = {
                icon = ' ',
                separator = '  ',
                condition = condition.check_git_workspace,
                highlight = { theme.yellow, theme.bg },
                provider = 'GitBranch',
            }
        }

        gl.section.right[1] = {
            FileLocation = {
                icon = ' ',
                separator = ' ',
                separator_highlight = { theme.gray, theme.bg },
                highlight = { theme.dark, theme.gray },
                provider = function()
                    local current_line = vim.fn.line('.')
                    local total_lines = vim.fn.line('$')

                    if current_line == 1 then
                        return 'Top'
                    elseif current_line == total_lines then
                        return 'Bot'
                    end

                    local percent, _ = math.modf((current_line / total_lines) * 100)
                    return '' .. percent .. '%'
                end,
            }
        }

        vim.api.nvim_command('hi GalaxyViModeReverse guibg=' .. theme.gray)

        gl.section.right[2] = {
            ViMode = {
                icon = '󰸳',
                separator = ' ',
                separator_highlight = 'GalaxyViModeReverse',
                --highlight = {catppuccin.gray, mode_color()},
                highlight = { theme.gray, theme.gray },
                provider = function()
                    local m = vim.fn.mode() or vim.fn.visualmode()
                    local mode = mode_alias(m)
                    local color = mode_color(m)
                    vim.api.nvim_command('hi GalaxyViMode guibg=' .. color)
                    vim.api.nvim_command('hi GalaxyViModeReverse guifg=' .. color)
                    return ' ' .. mode
                end,
            }
        }

        gl.section.right[3] = {
            RightSide = {
                highlight = { theme.blue, theme.bg },
                provider = function()
                    local m = vim.fn.mode() or vim.fn.visualmode()
                    local color = mode_color(m)
                    vim.api.nvim_command('hi GalaxyRightSide guifg=' .. color)
                    return ''
                end,
            }

        }

        gl.short_line_list = {
            'startify',
            'nerdtree',
            'term',
            'fugitive',
            'NvimTree',
            "neo-tree",
            "alpha",
        }


        gl.section.short_line_left[0] = {
            LeftEdge = {
                highlight = { theme.black, theme.bg },
                --provider = ''
                condition = condition.buffer_not_empty,
                provider = function()
                    return condition and ''
                end,
            }
        }

        gl.section.short_line_left[2] = {
            FileIcon = {
                provider = 'FileIcon',
                condition = condition.buffer_not_empty,
                highlight = { theme.white, theme.black },
            }
        }

        gl.section.short_line_left[3] = {
            FileName = {
                provider = 'FileName',
                condition = condition.buffer_not_empty,
                highlight = { theme.white, theme.gray },
                separator_highlight = { theme.black, theme.bg },
                separator = '',
            }
        }


        gl.section.short_line_right[0] = {
            DiagnosticError = {
                provider = 'DiagnosticError',
                icon = '  ',
                highlight = { theme.red, theme.bg }
            }
        }

        gl.section.short_line_right[1] = {
            DiagnosticWarn = {
                provider = 'DiagnosticWarn',
                icon = '  ',
                highlight = { theme.yellow, theme.bg },
            }
        }
    end,
}
