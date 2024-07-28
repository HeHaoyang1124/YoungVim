return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        local configs = require("nvim-treesitter.configs")
        configs.setup({
            ensure_installed = { "c", "cpp", "lua", "vim", "markdown", "markdown_inline" },
            sync_install = true,
            auto_install = true,
            highlight = {
                enable = true,

                disable = function(lang, buf)
                    local max_filesize = 50 * 1024 -- 50 KB
                    local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
                    if ok and stats and stats.size > max_filesize then
                        return true
                    end
                end,

                additional_vim_regex_highlighting = false,
            },
            indent = { enable = true },
        })
    end
}
