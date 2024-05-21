local LazyFile = { 'BufReadPost', 'BufWritePre', 'BufNewFile' }
local VeryLazyFile = { 'BufReadPost', 'BufWritePre', 'BufNewFile', 'VeryLazy' }

-- Maybe read the README.md
return {
    -- Main{{{
    -- Language server
    require('pluggers.mason'),
    -- nvim-treesitter Text Highlighting and more {{{
    {
        -- Highlight, edit, and navigate code
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        event = VeryLazyFile,
        -- dependencies = {
        --     'nvim-treesitter/nvim-treesitter-textobjects',
        -- },
        config = function()
            require('pluggers.treesitter')
        end,
    },
    { -- I should use emmet instead of this tbh but might aswell have it
        'windwp/nvim-ts-autotag',
        ft = { 'html', 'javascript', 'markdown' },
        opts = {},
    },
    -- }}}
    -- nvim-cmp Text Completion
    require('pluggers.cmp'),
    -- confomrm.nvim Formatting
    require('pluggers.conform'),
    -- nvim-lint Linting
    require('pluggers.lint'),
    -- Debugging (not really finished)
    ---require('pluggers.debug'),
    -- Orgmode is lazy loaded and this would never trigger if you just never use it
    require('pluggers.org'),
    -- telescope.nvim Fuzzy Finder
    require('pluggers.telescope'),
    -- }}}
    -- Other {{{
    -- coloizer.nvim Visualize color codes in code {{{
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
    -- Git related plugins {{{
    -- gitsigns.nvim Adds git related signs to the gutter, as well as utilities for managing changes {{{
    {
        'lewis6991/gitsigns.nvim',
        event = LazyFile,
        opts = require('pluggers.gitsigns'),
    }, -- }}}
    -- Fugitive adds commands for doing git stuff{{{
    {
        'tpope/vim-fugitive',
        keys = {
            {
                '<leader>gg',
                '<CMD>Git<CR>',
                desc = 'Git [g]it',
            },
            {
                '<leader>gd',
                '<CMD>Git diff<CR>',
                desc = 'Git [d]iff',
            },
            {
                '<leader>gc',
                '<CMD>Git commit<CR>',
                { desc = 'Git [c]ommit' },
            },
            {
                '<leader>gaa',
                '<CMD>Git add .<CR>',
                { desc = 'Git Add [a]ll' },
            },
            {
                '<leader>gac',
                '<CMD>Git add %<CR>',
                { desc = 'Git Add [c]urrent buffer' },
            },
            {
                '<leader>gs',
                '<CMD>Git show<CR>',
                { desc = 'Git [s]how' },
            },
            {
                '<leader>gp',
                '<CMD>Git push<CR>',
                { desc = 'Git [p]ush' },
            },
            {
                'gu',
                '<CMD>diffget //2<CR>',
                { noremap = true },
            },
            {
                'gh',
                '<CMD>diffget //3<CR>',
                { noremap = true },
            },
        },
        cmd = { 'Git', 'GBrowse' },
        dependencies = 'tpope/vim-rhubarb',
    }, -- }}}
    -- }}}
    -- persisted.nvim Session management{{{
    {
        'olimorris/persisted.nvim',
        lazy = false, -- make sure the plugin is always loaded at startup
        keys = {
            {
                '<leader>sd',
                '<CMD>SessionDelete<CR>',
                desc = 'Session [d]elete',
            },
            {
                '<leader>st',
                '<CMD>SessionToggle<CR>',
                desc = 'Session [t]oggle',
            },
            {

                '<leader>sl',
                '<CMD>SessionLoad<CR>',
                desc = 'Session [l]oad',
            },
            {

                '<leader>sL',
                '<CMD>SessionLoadLast<CR>',
                desc = 'Session [L]oad last session',
            },
            {
                '<leader>sp',
                '<CMD>SessionStop<CR>',
                desc = 'Session [p]ause',
            },
            {
                '<leader>sr',
                '<CMD>SessionStart<CR>',
                desc = 'Session [r]ecord',
            },
            {
                '<leader>ss',
                '<CMD>SessionSave<CR>',
                desc = 'Session [s]ave',
            },
        },
        opts = {
            silent = true,
            allowed_dirs = {
                '~/Other/pumpndump/',
                '~/Code',
            },
        },
    }, -- }}}
    -- trouble.nvim Diagnostic Viewer {{{
    {
        'folke/trouble.nvim',
        cmd = { 'TroubleToggle' },
        keys = {
            {
                '<leader>x',
                '<CMD>TroubleToggle<CR>',
                desc = 'Trouble [x] Toggle',
            },
            -- {
            --     '<leader>xx',
            --     '<CMD>TroubleToggle<CR>',
            --     desc = 'Trouble [x] Toggle',
            -- },
            -- {
            --     '<leader>xw',
            --     '<cmd>TroubleToggle workspace_diagnostics<cr>',
            --     desc = 'Trouble [w]orkspace Diagnostics',
            -- },
            -- {
            --     '<leader>xd',
            --     '<cmd>TroubleToggle document_diagnostics<cr>',
            --     desc = 'Trouble [d]ocument Diagnostics',
            -- },
            -- {
            --     '<leader>xq',
            --     '<cmd>TroubleToggle quickfix<cr>',
            --     desc = 'Trouble [q]uickfix',
            -- },
            -- {
            --     '<leader>xl',
            --     '<cmd>TroubleToggle loclist<cr>',
            --     desc = 'Trouble [l]OC/Diagnostic List',
            -- },
            -- {
            --     '<leader>xr',
            --     '<cmd>TroubleToggle lsp_references<cr>',
            --     desc = 'Trouble LSP [r]eferences',
            -- },
        },
        opts = {
            signs = {
                error = ' ',
                warn = ' ',
                hint = '󰌵 ',
                information = '󰋼 ',
                other = '',
            },
        },
    },
    -- }}}
    -- undotree Shows a tree, of your undos {{{
    {
        'mbbill/undotree',
        cmd = { 'UndotreeToggle', 'UndotreeFocus' },
        keys = {
            {
                '<leader>u',
                '<cmd>UndotreeToggle<cr><cmd>UndotreeFocus<CR>',
                desc = '[u]ndotree Toggle',
            },
        },
    },
    -- }}}
    -- vim-sleuth Detect tabstop and shiftwidth automatically {{{
    {
        'tpope/vim-sleuth',
        event = LazyFile,
    },
    --}}}
    -- zen-mode.nvim {{{
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
                width = 85, -- width of the Zen window
            },
            plugins = {
                options = {
                    colorcolumn = 0,
                    enabled = true,
                    ruler = false, -- disables the ruler text in the cmd line area
                    showcmd = false, -- disables the command in the last line of the screen
                    laststatus = 0, -- turn off the statusline in zen mode
                    showmode = true,
                },
                -- twilight = { enabled = true }, -- enable to start Twilight when zen mode opens
                gitsigns = { enabled = true },
                tmux = { enabled = true },
            },
        },
    },
    -- }}}
    -- which-key.nvim Keymap hints {{{
    {
        'folke/which-key.nvim',
        event = 'VeryLazy',
        opts = function()
            require('which-key').register({
                f = { name = '[f]ind' },
                s = { name = '[s]ession' },
                r = {
                    name = '[r]un',
                    g = {
                        name = '[g]cc',
                    },
                },
                o = { name = '[o]rg' },
                g = {
                    name = '[g]it',
                    a = {
                        name = 'Git [a]dd',
                    },
                },
                b = { name = 'de[b]ug' },
            }, { prefix = '<leader>' })
            return {
                window = {
                    border = 'single', -- none, single, double, shadow
                    position = 'bottom', -- bottom, top
                    margin = { 0, 0, 0, 0.5 }, -- extra window margin [top, right, bottom, left]. When between 0 and 1, will be treated as a percentage of the screen size.
                    padding = { 0, 0, 0, 0 }, -- extra window padding [top, right, bottom, left]
                    zindex = 1000, -- positive value to position WhichKey above other floating windows.
                },
                layout = {
                    spacing = 1, -- spacing between columns
                    align = 'center', -- align columns left, center or right
                },

                icons = {
                    breadcrumb = '➜', -- symbol used in the command line area that shows your active key combo
                    separator = '»', -- symbol used between a key and it's label
                    group = '+', -- symbol prepended to a group
                },
            }
        end,
    }, -- }}}
    -- mini.nvim improvements {{{
    -- better (a)round and (i)nside commands{{{
    { 'echasnovski/mini.ai', event = VeryLazyFile, opts = {} },
    -- }}}
    -- better f/F and t/T{{{
    {
        'echasnovski/mini.jump',
        keys = { 'f', 'F', 't', 'T', ';' },
        opts = { highlight = 0 },
    },
    -- }}}
    -- Auto pairs () {{{
    {
        'echasnovski/mini.pairs',
        event = 'InsertEnter',
        opts = {},
    }, -- }}}
    -- Fast bufferline{{{
    -- r
    {
        'GravityShark0/mini.tabline',
        event = { 'BufAdd', 'BufDelete', 'UIEnter' },
        dependencies = 'nvim-tree/nvim-web-devicons',
        opts = { set_vim_settings = false },
    },
    -- }}}
    -- Kill buffers and preserve window layout{{{
    { 'echasnovski/mini.bufremove' },
    -- }}}
    -- 's' to surround text with any character {{{
    {
        'echasnovski/mini.surround',
        keys = {
            { 'sa', mode = 'v' },
            { 'sa', description = 'Add surrounding' },
            { 'sd', description = 'Delete surrounding' },
            { 'sr', description = 'Surround replace' },
            { 'sf', description = 'Find right surrounding' },
            { 'sF', description = 'Find left surrounding' },
            { 'sh', description = 'Highlight surrounding' },
            { 'sn', description = 'Update `MiniSurround.config.n_lines`' },
        },
        opts = {},
    },

    -- }}}
    -- }}}
    -- }}}
    -- Theme / Visual {{{
    -- Themes {{{
    -- go to the lua/colorscheme dir to see more
    -- require('colorscheme.monokai'), -- Favorite
    -- require('colorscheme.catppuccin'),
    -- require('colorscheme.sonokai'),
    -- require('colorscheme.mini'),
    -- require('colorscheme.tokyonight'),
    -- require('colorscheme.rosepine'),
    -- vim.cmd.colorscheme('habamax'),
    -- vim.cmd.colorscheme('habamax'),
    vim.cmd.colorscheme('default'),
    -- Enable and run :TransparentEnable to enable transparency on any theme
    -- require('colorscheme.transparent-plugin'),
    -- Look in settings.lua for the different transparentcy
    -- }}}
    -- Statusline {{{
    {
        'echasnovski/mini.statusline',
        opts = { set_vim_settings = false },
        lazy = false,
    },
    -- }}}
    -- Illuminate words that are the same {{{
    {
        'echasnovski/mini.cursorword',
        event = VeryLazyFile,
        opts = {},
    },
    -- }}}
    -- Indent indicators{{{
    {
        'echasnovski/mini.indentscope',
        event = LazyFile,
        opts = {
            -- symbol = '▎',
            -- symbol = "▏",
            symbol = '│',
            options = { try_as_border = true },
        },
    },
    -- }}}
    -- X Animations on things{{{
    {
        'echasnovski/mini.animate',
        enabled = false,
        event = 'VeryLazy',
        opts = function()
            local animate = require('mini.animate')
            vim.api.nvim_set_keymap(
                'n',
                '<C-d>',
                '<CMD>lua MiniAnimate.execute_after("scroll", "normal! <C-d>zz")<CR>',
                { noremap = true, silent = true }
            )
            vim.api.nvim_set_keymap(
                'n',
                '<C-u>',
                '<CMD>lua MiniAnimate.execute_after("scroll", "normal! <C-u>zz")<CR>',
                { noremap = true, silent = true }
            )
            return {
                scroll = {
                    timing = animate.gen_timing.quadratic({
                        duration = 50,
                        unit = 'total',
                    }),
                },
                cursor = {
                    timing = animate.gen_timing.quadratic({
                        duration = 50,
                        unit = 'total',
                    }),
                },
            }
        end,
    },

    -- }}}
    -- }}}
    -- Filetype specific plugins -- {{{
    -- neodev.nvim
    { 'folke/neodev.nvim', enabled = false, opts = {} }, -- }}}
    -- Fun stuff {{{
    { -- StartupTime{{{
        'dstein64/vim-startuptime',
        cmd = 'StartupTime',
        init = function()
            vim.g.startuptime_tries = 100
        end,
    }, -- }}}
    { -- Funny floppin and plippin{{{
        'Eandrju/cellular-automaton.nvim',
        cmd = 'CellularAutomaton',
    }, -- }}}
    { -- Blazingly training???{{{
        'ThePrimeagen/vim-be-good',
        cmd = 'VimBeGood',
    }, -- }}}
    -- require('dragmove'),
    -- }}}
}
