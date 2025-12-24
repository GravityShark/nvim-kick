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
        -- vim.g.gruvbox_material_better_performance = '1'
        vim.api.nvim_create_autocmd('ColorScheme', {
            group = vim.api.nvim_create_augroup(
                'custom_highlights_gruvboxmaterial',
                {}
            ),
            pattern = 'gruvbox-material',
            callback = function()
                local config = vim.fn['gruvbox_material#get_configuration']()
                local palette = vim.fn['gruvbox_material#get_palette'](
                    config.background,
                    config.foreground,
                    config.colors_override
                )
                local set_hl = vim.fn['gruvbox_material#highlight']

                set_hl('Search', palette.none, {})
            end,
        })
        vim.cmd.colorscheme('gruvbox-material')
    end,
}
