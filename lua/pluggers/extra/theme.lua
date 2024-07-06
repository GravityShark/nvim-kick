-- Plugins for things related to themes or anything visual
return {
    -- mini.statusline Statusline {{{
    {
        'echasnovski/mini.statusline',
        lazy = false,
        opts = { set_vim_settings = false },
    },
    -- }}}
    -- mini.tabline Fast bufferline{{{
    {
        'GravityShark0/mini.tabline',
        event = 'VeryLazy',
        dependencies = {
            'echasnovski/mini.icons',
            config = true,
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
    -- zen-mode.nvim Stay in the zenmode with <leader>z {{{
    {
        'folke/zen-mode.nvim',
        cmd = { 'ZenMode' },
        keys = {
            {
                '<leader>z',
                function()
                    require('zen-mode').setup({

                        window = {
                            width = 90, -- width of the Zen window
                            options = {},
                        },
                        plugins = {
                            options = {
                                enabled = true,
                                ruler = false, -- disables the ruler text in the cmd line area
                                showcmd = false, -- disables the command in the last line of the screen
                                laststatus = 0, -- turn off the statusline in zen mode
                            },
                            gitsigns = { enabled = true },
                            tmux = { enabled = true },
                        },
                    })
                    require('zen-mode').toggle()
                end,
                '<CMD>ZenMode<CR>',
                desc = '[z]enmode Toggle',
            },
            {
                '<leader>Z',
                function()
                    require('zen-mode').setup({
                        window = {
                            width = 80,
                            options = {
                                number = false, -- disable number column
                                relativenumber = false, -- disable relative numbers
                                colorcolumn = '0', -- disable cursor column
                            },
                        },

                        plugins = {
                            options = {
                                enabled = true,
                                ruler = false, -- disables the ruler text in the cmd line area
                                showcmd = false, -- disables the command in the last line of the screen
                                laststatus = 0, -- turn off the statusline in zen mode
                            },
                            gitsigns = { enabled = true },
                            tmux = { enabled = true },
                        },
                    })
                    require('zen-mode').toggle()
                end,
                desc = '[Z]enmode Toggle Clean',
            },
        },
    },
    -- }}}
    -- todo-comments.nvim Highlighted todo comments {{{
    {
        'folke/todo-comments.nvim',
        event = 'VeryLazy',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = true,
    }, -- }}}
    -- }}}
}
-- vim:foldmethod=marker:
