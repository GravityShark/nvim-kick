-- return {
--     'f4z3r/gruvbox-material.nvim',
--     name = 'gruvbox-material',
--     lazy = false,
--     priority = 1000,
--     opts = {
--         customize = function()
--             local colors = require('gruvbox-material.colors').get(
--                 vim.o.background,
--                 'medium'
--             )
--             if g == 'Folded' then
--                 o.fg = colors.bg0 -- or use any color in "#rrggbb" hex format
--             end
--             if g == 'CursorLineNr' then
--                 o.fg = colors.fg0 -- or use any color in "#rrggbb" hex format
--             end
--             return o
--         end,
--     },
-- }

return { -- gruvvin
    'sainnhe/gruvbox-material',
    lazy = false,
    priority = 1000,
    config = function()
        vim.g.gruvbox_material_enable_italic = '1'
        vim.g.gruvbox_material_better_performance = '1'
        -- vim.g.gruvbox_material_diagnostic_text_highlight = true
        vim.cmd.colorscheme('gruvbox-material')

        vim.api.nvim_set_hl(0, 'Folded', { bg = 'NONE' })
    end,
}
