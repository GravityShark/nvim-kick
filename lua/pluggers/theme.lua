-- Plugins for things related to themes or anything visual
return {
    -- Themes {{{
    -- go to the lua/colorscheme dir to see more
    -- require('color.rosepine'), -- New Favorite
    -- require('color.monokai'), -- Favorite
    -- require('color.catppuccin'),
    -- require('color.sonokai'),
    -- require('color.mini'),
    -- require('color.tokyonight'),
    -- }}}
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
        event = { 'BufAdd', 'BufDelete', 'UIEnter' },
        dependencies = 'nvim-tree/nvim-web-devicons',
        opts = { set_vim_settings = false },
    },
    -- }}}
    -- mini.cursorword Illuminate words that are the same {{{
    {
        'echasnovski/mini.cursorword',
        event = { 'BufReadPost', 'BufNewFile', 'BufWritePre', 'VeryLazy' },
        config = true,
    },
    -- }}}
    -- mini.indentscope Indent indicators{{{
    {
        'echasnovski/mini.indentscope',
        event = { 'BufReadPost', 'BufNewFile', 'BufWritePre', 'VeryLazy' },
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
                '<leader>C',
                '<CMD>ColorizerToggle<CR><CMD>ColorizerReloadAllBuffers<CR>',
                desc = '[C]olorize Colors',
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
        -- dependencies = 'folke/twilight.nvim',
        keys = {
            {
                '<leader>z',
                '<CMD>ZenMode<CR>',
                desc = '[z]enmode Toggle',
            },
        },
        opts = {
            window = {
                width = 120, -- width of the Zen window
                options = {
                    signcolumn = 'no', -- disable signcolumn
                    -- number = false, -- disable number column
                    -- relativenumber = false, -- disable relative numbers
                    -- cursorline = false, -- disable cursorline
                    -- cursorcolumn = 0', -- disable cursor column
                    colorcolumn = '0', -- disable cursor column
                    -- foldcolumn = "0", -- disable fold column
                    -- list = false, -- disable whitespace characters
                },
            },
            plugins = {
                options = {
                    enabled = true,
                    ruler = false, -- disables the ruler text in the cmd line area
                    showcmd = false, -- disables the command in the last line of the screen
                    laststatus = 0, -- turn off the statusline in zen mode
                },
                -- twilight = { enabled = true }, -- enable to start Twilight when zen mode opens
                gitsigns = { enabled = true },
                tmux = { enabled = true },
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
    -- nvim-ufo Better folds {{{
    {
        'kevinhwang91/nvim-ufo',
        event = { 'BufReadPost', 'BufNewFile', 'BufWritePre', 'VeryLazy' },
        dependencies = 'kevinhwang91/promise-async',
        opts = function()
            vim.opt.foldmethod = 'expr'
            vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
            vim.opt.foldenable = false
            vim.opt.foldlevel = 99
            vim.opt.foldlevelstart = 99

            local handler = function(virtText, lnum, endLnum, width, truncate)
                local newVirtText = {}
                local suffix = (' 󰁂 %d '):format(endLnum - lnum)
                local sufWidth = vim.fn.strdisplaywidth(suffix)
                local targetWidth = width - sufWidth
                local curWidth = 0
                for _, chunk in ipairs(virtText) do
                    local chunkText = chunk[1]
                    local chunkWidth = vim.fn.strdisplaywidth(chunkText)
                    if targetWidth > curWidth + chunkWidth then
                        table.insert(newVirtText, chunk)
                    else
                        chunkText = truncate(chunkText, targetWidth - curWidth)
                        local hlGroup = chunk[2]
                        table.insert(newVirtText, { chunkText, hlGroup })
                        chunkWidth = vim.fn.strdisplaywidth(chunkText)
                        -- str width returned from truncate() may less than 2nd argument, need padding
                        if curWidth + chunkWidth < targetWidth then
                            suffix = suffix
                                .. (' '):rep(
                                    targetWidth - curWidth - chunkWidth
                                )
                        end
                        break
                    end
                    curWidth = curWidth + chunkWidth
                end
                table.insert(newVirtText, { suffix, 'MoreMsg' })
                return newVirtText
            end

            return {
                provider_selector = function()
                    return { 'treesitter', 'indent' }
                end,

                fold_virt_text_handler = handler,
                open_fold_hl_timeout = 0,
            }
        end,
        --
    }, -- }}}
    -- wilder.nvim make wildmenus even wilder
    {
        'gelguy/wilder.nvim',
        event = 'CmdlineEnter',
        config = function()
            local wilder = require('wilder')
            wilder.setup({ modes = { ':' } })
            wilder.set_option(
                'renderer',
                wilder.popupmenu_renderer(wilder.popupmenu_border_theme({
                    highlighter = wilder.basic_highlighter(),
                    left = { ' ', wilder.popupmenu_devicons() },
                    right = { ' ', wilder.popupmenu_scrollbar() },
                    highlights = {
                        border = 'Normal', -- highlight to use for the border
                        accent = 'Special',
                    },

                    border = 'rounded',
                }))
            )
        end,
    },
    -- }}}
}
-- vim:foldmethod=marker:
