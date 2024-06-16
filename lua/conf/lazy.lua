local fn = vim.fn
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.notify('Installing lazy.nvim')
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
    local rtp_addition = vim.fn.stdpath('data') .. '/lazy/*'
    if not string.find(vim.o.runtimepath, rtp_addition) then
        vim.o.runtimepath = rtp_addition .. ',' .. vim.o.runtimepath
    end
    vim.notify('Lazy.nvim has been installed')
end
vim.opt.rtp:prepend(lazypath)

-- Use a protected call so we don't error out on first use

local status_ok, lazy = pcall(require, 'lazy')
if not status_ok then
    vim.notify('lazy.nvim is not declare')
    return
end

lazy.setup({
    { import = "conf.plugins" },
    { import = "conf.plugins.lsp" },
    { import = "conf.plugins.dap" },
    { import = "conf.plugins.theme" },
})
