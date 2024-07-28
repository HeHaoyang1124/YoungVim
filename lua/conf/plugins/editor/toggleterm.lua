return {
    'akinsho/toggleterm.nvim',
    version = "*",
    config = function()
        require("toggleterm").setup({
            shade_terminals = true,
            start_in_insert = true,
            close_on_exit = true,
            auto_scroll = true,
        })

        local function toggle_cmd(cmd, close_on_exit)
            local Terminal = require('toggleterm.terminal').Terminal
            local term     = Terminal:new({
                cmd = cmd,
                direction = 'horizontal',
                close_on_exit = close_on_exit
            })
            term:toggle()
        end

        function python_toggle() toggle_cmd("python", true) end

        -- function powershell_toggle() toggle_cmd("powershell", true) end
        function powershell_toggle() toggle_cmd('"D:/Program Files (x86)/Git/bin/bash.exe"', false) end

        local cmake_generator          = '"MinGW Makefiles"'
        local cmake_type               = 'Debug'

        local cmake_generate_cmd       =
            "cmake -DCMAKE_BUILD_TYPE:STRING=" .. cmake_type .. " "
            .. "-DCMAKE_EXPORT_COMPILE_COMMANDS:BOOL=TRUE "
            .. "--no-warn-unused-cli "
            .. "-S" .. vim.fn.getcwd() .. " "
            .. "-G" .. cmake_generator .. " "
            .. "-B" .. "./build"

        local cmake_build_cmd          =
            "cmake --build " .. vim.fn.getcwd() .. "/build "
            .. "--config " .. cmake_type .. " "
            .. "--target all -j 6 --"

        local cmake_launch_program_cmd = "start ./build/Application"

        function cmake_generate() toggle_cmd(cmake_generate_cmd, false) end

        function cmake_build() toggle_cmd(cmake_build_cmd, false) end

        function cmake_launch_program() toggle_cmd(cmake_launch_program_cmd, false) end

        local opts = { buffer = 0 }
    end,

    keys = {
        { "<C-\\>",     "<cmd>ToggleTerm<CR>",                              noremap = true, silent = true },
        { "<leader>th", "<cmd>ToggleTerm size=10 direction=horizontal<CR>", noremap = true, silent = true },
        { "<leader>tf", "<cmd>ToggleTerm direction=float<CR>",              noremap = true, silent = true },
        { "<leader>sl", "<cmd>ToggleTermSendCurrentLine<CR>",               noremap = true, silent = true },
        { "<leader>py", "<Cmd>lua python_toggle()<CR>",                     noremap = true, silent = true },
        { "<leader>ps", "<Cmd>lua powershell_toggle()<CR>",                 noremap = true, silent = true },
        { "<leader>tl", "<Cmd>lua cmake_launch_program()<CR>",              noremap = true, silent = true },
        { "<C-B>",      "<Cmd>lua cmake_build()<CR>",                       noremap = true, silent = true },
        { "<C-G>",      "<Cmd>lua cmake_generate()<CR>",                       noremap = true, silent = true },
    }
}
