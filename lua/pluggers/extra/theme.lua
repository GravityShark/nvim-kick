-- Plugins for things related to themes or anything visual
return {
    -- mini.statusline Statusline {{{
    {
        'echasnovski/mini.statusline',
        event = 'VeryLazy',
        dependencies = {
            'echasnovski/mini.icons',
            opts = {},
            init = function()
                package.preload['nvim-web-devicons'] = function()
                    require('mini.icons').mock_nvim_web_devicons()
                    return package.loaded['nvim-web-devicons']
                end
            end,
        },
        opts = { set_vim_settings = false },
    },
    -- }}}
    -- mini.indentscope Indent indicators{{{
    {
        'echasnovski/mini.indentscope',
        event = 'VeryLazy',
        opts = {
            -- symbol = '▎',
            -- symbol = "▏",
            symbol = '│',
            options = { try_as_border = true },
        },
    },
    -- }}}
    -- colorizer.nvim Visualize color codes in code {{{
    {
        'JosefLitos/colorizer.nvim',
        cmd = { 'ColorizerToggle' },
        keys = {
            {
                '<leader>h',
                '<CMD>ColorizerToggle<CR><CMD>ColorizerReloadAllBuffers<CR>',
                desc = '[h]ighlight colors',
            },
        },
        opts = {
            user_default_options = {
                names = 'tailwind',
            },
        },
    }, -- }}}
    -- todo-comments.nvim Highlighted todo comments {{{
    {
        'folke/todo-comments.nvim',
        event = 'VeryLazy',
        dependencies = { 'nvim-lua/plenary.nvim' },
        opts = {},
    }, -- }}}
}
-- vim:foldmethod=marker:
