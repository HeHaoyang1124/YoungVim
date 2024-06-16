return {
    'echasnovski/mini.animate',
    version = false,
    event = "VeryLazy",
    config = function()
        local animate = require('mini.animate')
        animate.setup({
            cursor = {
                -- Animate for 200 milliseconds with linear easing
                timing = animate.gen_timing.linear({ duration = 10, unit = 'total' }),

                -- Animate with shortest line for any cursor move
                path = animate.gen_path.line({
                    predicate = function() return true end,
                }),
            },
            open = {
                -- Animate for 400 milliseconds with linear easing
                timing = animate.gen_timing.linear({ duration = 20, unit = 'total' }),

                -- Animate with wiping from nearest edge instead of default static one
                winconfig = animate.gen_winconfig.wipe({ direction = 'from_edge' }),

                -- Make bigger windows more transparent
                winblend = animate.gen_winblend.linear({ from = 200, to = 10 }),
            },

            close = {
                -- Animate for 400 milliseconds with linear easing
                timing = animate.gen_timing.linear({ duration = 20, unit = 'total' }),

                -- Animate with wiping to nearest edge instead of default static one
                winconfig = animate.gen_winconfig.wipe({ direction = 'to_edge' }),

                -- Make bigger windows more transparent
                winblend = animate.gen_winblend.linear({ from = 200, to = 10 }),
            },
        })
    end
}
