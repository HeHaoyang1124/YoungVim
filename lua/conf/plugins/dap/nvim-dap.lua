return {
    "mfussenegger/nvim-dap",
    dependencies = {
        "rcarriga/nvim-dap-ui",
        'nvim-telescope/telescope.nvim',
        "theHamsta/nvim-dap-virtual-text",
    },
    config = function()
        local dap = require('dap')
        local install_root_dir = vim.fn.stdpath("data") .. "/mason/packages/"
        local codelldb_path = install_root_dir .. "codelldb/extension/adapter/codelldb.exe"
        local cpptools_path = install_root_dir .. "cpptools/extension/debugAdapters/bin/OpenDebugAD7.exe"

        dap.adapters.codelldb = {
            type = 'server',
            port = "${port}",
            executable = {
                command = codelldb_path,
                args = { "--port", "${port}" },
                -- On windows you may have to uncomment this:
                detached = false,
            }
        }

        dap.adapters.cppdbg = {
            id = 'cppdbg',
            type = 'executable',
            command = cpptools_path,
            options = {
                detached = false
            }
        }

        dap.configurations.cpp = {
            {
                name = "CMake Application",
                type = "cppdbg",
                request = "launch",
                program = function()
                   return vim.fn.getcwd() .. "./bin/application.exe"
                end,
                cwd = '${workspaceFolder}',
                stopAtEntry = true,
                setupCommands = {
                    {
                        text = '-enable-pretty-printing',
                        description = 'enable pretty printing',
                        ignoreFailures = false
                    },
                }
            },
            {
                name = "gdb launch",
                type = "cppdbg",
                request = "launch",
                program = function()
                    return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
                end,
                cwd = '${workspaceFolder}',
                stopAtEntry = true,
                setupCommands = {
                    {
                        text = '-enable-pretty-printing',
                        description = 'enable pretty printing',
                        ignoreFailures = false
                    },
                }
            },
            {
                name = "lldb Launch",
                type = "codelldb",
                request = "launch",
                program = function()
                    return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
                end,
                cwd = '${workspaceFolder}',
                stopOnEntry = false,
                setupCommands = {
                    {
                        text = 'type summary add --expand -x "std::vector<" --summary-string "${svar%#} items"',
                        description = 'enable pretty printing',
                        ignoreFailures = false
                    },
                }
            },
        }

        require('dap.ext.vscode').load_launchjs("./launch.json")

        vim.api.nvim_set_hl(0, "DapBreakpoint", { fg = require('conf.core.color').theme.red })
        vim.api.nvim_set_hl(0, "DapLogPoint", { fg = require('conf.core.color').theme.green })
        vim.api.nvim_set_hl(0, "DapStopped", { fg = require('conf.core.color').theme.yellow })


        local dap_breakpoint = {
            error = {

                text = "",
                texthl = "DapBreakpoint",
                linehl = "DapBreakpoint",
                numhl = "DapBreakpoint",
            },
            condition = {
                text = '',
                texthl = 'DapBreakpoint',
                linehl = 'DapBreakpoint',
                numhl = 'DapBreakpoint',
            },
            rejected = {
                text = "",
                texthl = "DapBreakpint",
                linehl = "DapBreakpoint",
                numhl = "DapBreakpoint",
            },
            logpoint = {
                text = '',
                texthl = 'DapLogPoint',
                linehl = 'DapLogPoint',
                numhl = 'DapLogPoint',
            },
            stopped = {
                text = '',
                texthl = 'DapStopped',
                linehl = 'DapStopped',
                numhl = 'DapStopped',
            },
        }


        vim.fn.sign_define('DapBreakpoint', dap_breakpoint.error)
        vim.fn.sign_define('DapBreakpointCondition', dap_breakpoint.condition)
        vim.fn.sign_define('DapBreakpointRejected', dap_breakpoint.rejected)
        vim.fn.sign_define('DapLogPoint', dap_breakpoint.logpoint)
        vim.fn.sign_define('DapStopped', dap_breakpoint.stopped)
        --- Toggle Breakpoint
    end,
    keys = {
        -- Breakpoint
        { '<leader>b', "<cmd>lua require('dap').toggle_breakpoint()<CR>" },
        { '<Leader>B', "<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>" },

        --- Step
        { '<F5>',      "<cmd>lua  require('dap').continue()<CR>" },
        { '<F10>',     "<cmd>lua  require('dap').step_over()<CR>" },
        { '<F11>',     "<cmd>lua  require('dap').step_into()<CR>" },
        { '<F12>',     "<cmd>lua  require('dap').step_out()<CR>" },

        --- Evaluate Expression
        { '<leader>w', "<cmd>lua require('dapui').eval()<CR>" },

        --- terminate ---
        { "<S-F5>",
            ":lua require'dap'.terminate()<CR>"
            -- ":lua require'dap'.disconnect()<CR>"
            .. ":lua require'dap'.close()<CR>"
            .. ":lua require'dap.repl'.close()<CR>" .. ":lua require'dapui'.close()<CR>"
            .. "<C-w>o<CR>"
        },

        --- restart ---
        { '<C-S-F5>', "<cmd>require('dap').restart()<CR>" },

    }
}
