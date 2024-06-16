return {
    "rcarriga/nvim-dap-ui",
    lazy = true,
    dependencies = {
        "mfussenegger/nvim-dap",
        "nvim-neotest/nvim-nio"
    },
    config = function()
        local dap, dapui = require("dap"), require("dapui")
        dapui.setup({
            element_mappings = {
                scopes = { edit = "e", repl = "r", },
                watches = { edit = "e", repl = "r", },
                stacks = { open = "g", },
                breakpoints = { open = "g", toggle = "b", },
            },

            layouts = {
                {
                    elements = { "scopes", "stacks", "breakpoints", "watches", },
                    size = 0.2, -- 40 columns
                    position = "left",
                },
                {
                    elements = { "repl", },
                    size = 0.25, -- 25% of total lines
                    position = "bottom",
                },
                {
                    elements = { "console", },
                    size = 0.2,
                    position = "right",
                },
            },

            floating = {
                max_height = nil,   -- These can be integers or a float between 0 and 1.
                max_width = nil,    -- Floats will be treated as percentage of your screen.
                border = "rounded", -- Border style. Can be "single", "double" or "rounded"
                mappings = { close = { "q", "<Esc>" }, },
            },
        })

        dap.listeners.after.event_initialized["dapui_config"] = function()
            dapui.open()
            -- vim.cmd([[Neotree close]])
            vim.cmd([[AerialClose]])
        end

        dap.listeners.before.event_terminated["dapui_config"] = function()
            dapui.close()
        end

        dap.listeners.before.event_exited["dapui_config"] = function()
            dapui.close()
        end
    end
}
