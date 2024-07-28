return {
    "RRethy/vim-illuminate",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        -- default configuration
        require('illuminate').configure({
            -- providers: provider used to get references in the buffer, ordered by priority
            providers = {
                'lsp',
                'treesitter',
                'regex',
            },
            -- delay: delay in milliseconds
            delay = 100,
            -- filetype_overrides: filetype specific overrides.
            -- The keys are strings to represent the filetype while the values are tables that
            -- supports the same keys passed to .configure except for filetypes_denylist and filetypes_allowlist
            filetype_overrides = {},
            -- filetypes_denylist: filetypes to not illuminate, this overrides filetypes_allowlist
            filetypes_denylist = {
                'dirbuf',
                'dirvish',
                'fugitive',
            },
            filetypes_allowlist = {},
            modes_denylist = {},
            modes_allowlist = {},
            providers_regex_syntax_denylist = {},
            providers_regex_syntax_allowlist = {},
            under_cursor = true,
            large_file_cutoff = nil,
            large_file_overrides = nil,
            min_count_to_highlight = 1,
            should_enable = function(bufnr) return true end,
            case_insensitive_regex = false,
        })
        vim.cmd([[hi IlluminatedWordText  gui=underline]])
        vim.cmd([[hi IlluminatedWordRead  gui=underline]])
        vim.cmd([[hi IlluminatedWordWrite gui=underline]])
    end
}
