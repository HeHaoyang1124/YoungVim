vim.g.mapleader = " "
vim.g.maplocalleader = " "

local opt = {
    noremap = true,
    silent = true,
}

vim.keymap.set("i", "jk", "<ESC>", opt)
-- get

-- line move up/down
vim.keymap.set("n", "<C-j>", "dd$p", opt)
vim.keymap.set("n", "<C-k>", "kdd$pk", opt)

vim.keymap.set("n", "<S-Up>", ":resize -1<CR>", opt)
vim.keymap.set("n", "<S-Down>", ":resize +1<CR>", opt)
vim.keymap.set("n", "<S-Left>", "<C-w><", opt)
vim.keymap.set("n", "<S-Right>", "<C-w>>", opt)

vim.keymap.set({ "n", "v" }, "<M-j>", "5j", opt)
vim.keymap.set({ "n", "v" }, "<M-k>", "5k", opt)
vim.keymap.set({ "n", "v" }, "<M-l>", "5l", opt)
vim.keymap.set({ "n", "v" }, "<M-h>", "5h", opt)
vim.keymap.set({ "n", "v" }, "<leader>h", "^", opt)
vim.keymap.set({ "n", "v" }, "<leader>l", "$", opt)

-- cmake settings
local cmake_generator = '"MinGW Makefiles"'
local cmake_type      = 'Debug'

vim.keymap.set("n", "<C-R>", "<CMD>!start ./build/application.exe<CR>", opt)
vim.keymap.set("n", "<C-G>", "<CMD>!cmake -S. -Bbuild -G" .. cmake_generator .. "<CR>", opt)
vim.keymap.set("n", "<C-B>", "<cmd>!cmake --build " .. vim.fn.getcwd() .. "/build "
    .. "--config " .. cmake_type .. " --target all -j 6 --<CR>")

