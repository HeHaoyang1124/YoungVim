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

        local function toggle_cmd(cmd)
            local Terminal = require('toggleterm.terminal').Terminal
            local term     = Terminal:new({
                cmd = cmd,
                direction = 'horizontal'
            })
            term:toggle()
        end

        function python_toggle() toggle_cmd("python") end

        function powershell_toggle() toggle_cmd("powershell") end

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
    }
}
