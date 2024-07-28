return {
    "numToStr/Comment.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        require('Comment').setup({
            padding = true,
            sticky = true,
            ignore = nil,
            toggler = {
                line = 'gcc',
                block = 'gbc',
            },
            opleader = {
                line = 'gc',
                block = 'gb',
            },
            extra = {
                above = 'gcO',
                below = 'gco',
                eol = 'gca',
            },
            ---NOTE: If given `false` then the plugin won't create any mappings
            mappings = {
                basic = true,
                extra = true,
            },
            pre_hook = nil,
            post_hook = nil,
        }
        )
    end
}
