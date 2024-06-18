local LazyFile = { 'BufReadPost', 'BufWritePre', 'BufNewFile' }
local VeryLazyFile = { 'BufReadPost', 'BufWritePre', 'BufNewFile', 'VeryLazy' }

-- Maybe read the README.md
return {
    -- Main{{{
    -- Language server
    require('pluggers.mason'),
    -- nvim-treesitter Text Highlighting and more
    -- {{{
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
    -- gitsigns.nvim Adds git related signs to the gutter, as well as utilities for managing changes {{{
    {
        'lewis6991/gitsigns.nvim',
        event = LazyFile,
        opts = require('pluggers.gitsigns'),
    }, -- }}}
    -- vim-fugitive Adds commands for doing git stuff {{{
    {
        'tpope/vim-fugitive',
        keys = {
            {
                '<leader>gs',
                '<CMD>Git<CR>',
                desc = 'Git [s]tatus',
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
                '<leader>gb',
                '<CMD>Git blame<CR>',
                { desc = 'Git [b]lame' },
            },
            -- {
            --     '<leader>gs',
            --     '<CMD>Git show<CR>',
            --     { desc = 'Git [s]how' },
            -- },
            {
                '<leader>gp',
                '<CMD>Git push<CR>',
                { desc = 'Git [p]ush' },
            },
            {
                'gl',
                '<CMD>diffget //2<CR>',
                { desc = 'diffget //2', noremap = true },
            },
            {
                'gh',
                '<CMD>diffget //3<CR>',
                { desc = 'diffget //3', noremap = true },
            },
        },
        cmd = { 'Git', 'GBrowse' },
        dependencies = 'tpope/vim-rhubarb',
    }, -- }}}
    -- persistence.nvim Session management {{{
    {
        'folke/persistence.nvim',
        event = 'BufReadPre', -- this will only start session saving when an actual file was opened
        keys = {
            {
                '<leader>sl',
                '<CMD>lua require("persistence").load()<CR>',
                desc = 'Session [l]oad',
            },
            {
                '<leader>sL',
                '<CMD>lua require("persistence").load({ last = true })<CR>',
                desc = 'Session [L]oad last session',
            },
            {
                '<leader>sp',
                '<CMD>lua require("persistence").stop()<CR>',
                desc = 'Session [p]ause',
            },
        },
        opts = {
            options = { 'buffers,curdir,folds,tabpages,winpos,winsize' },
        },
    }, -- }}}
    -- trouble.nvim Diagnostic Viewer {{{
    {
        'folke/trouble.nvim',
        cmd = 'Trouble',
        keys = {
            {
                '<leader>x',
                '<CMD>Trouble diagnostics toggle<CR>',
                desc = 'Trouble [x] Toggle',
            },
        },
        opts = {
            -- signs = {
            --     error = ' ',
            --     warn = ' ',
            --     hint = '󰌵 ',
            --     information = '󰋼 ',
            --     other = '',
            -- },
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
            },
            plugins = {
                options = {
                    colorcolumn = 0,
                    enabled = true,
                    ruler = true, -- disables the ruler text in the cmd line area
                    showcmd = true, -- disables the command in the last line of the screen
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
                        name = 'run [g]cc',
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
                l = { name = '[l]sp' },
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
    -- Auto pairs () {{{
    {
        'echasnovski/mini.pairs',
        event = 'InsertEnter',
        opts = {},
    }, -- }}}
    -- Better (a)round and (i)nside commands{{{
    { 'echasnovski/mini.ai', event = VeryLazyFile, opts = {} },
    -- }}}
    -- Better f/F and t/T{{{
    {
        'echasnovski/mini.jump',
        keys = { 'f', 'F', 't', 'T', ';' },
        opts = { highlight = 0 },
    },
    -- }}}
    -- Extra commands {{{
    {
        'echasnovski/mini.operators',
        keys = {
            { 'g=', mode = '', desc = 'Mini Evaluate operator' },
            { 'gx', mode = '', desc = 'Mini Exchange operator' },
            { 'gm', mode = '', desc = 'Mini Multiply operator' },
            { 'gr', mode = '', desc = 'Mini Replace operator' },
            { 'gs', mode = '', desc = 'Mini Sort operator' },
        },
        opts = {},
    }, -- }}}
    -- Fast bufferline{{{
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
    -- Surround text with any character{{{
    {
        'echasnovski/mini.surround',
        keys = {
            { 'sa', mode = 'v', desc = 'Add surrounding' },
            { 'sa', desc = 'Add surrounding' },
            { 'sd', desc = 'Delete surrounding' },
            { 'sr', desc = 'Surround replace' },
            { 'sf', desc = 'Find right surrounding' },
            { 'sF', desc = 'Find left surrounding' },
            { 'sh', desc = 'Highlight surrounding' },
            { 'sn', desc = 'Update `MiniSurround.config.n_lines`' },
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
    require('colorscheme.rosepine'),
    -- vim.cmd.colorscheme('habamax'),
    -- vim.cmd.colorscheme('habamax'),
    -- vim.cmd.colorscheme('default'),
    -- Enable and run :TransparentEnable to enable transparency on any theme
    -- require('colorscheme.transparent-plugin'),
    -- Look in settings.lua for the different transparentcy
    -- }}}
    -- Statusline {{{
    {
        'echasnovski/mini.statusline',
        lazy = false,
        opts = { set_vim_settings = false },
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
    -- }}}
    -- Development {{{
    -- neodev.nvim Helps in neovim development
    { 'folke/neodev.nvim', enabled = true, opts = {} },
    -- mini.doc When developing docs in mini.nvim plugins
    -- { 'echasnovski/mini.doc', enabled = false, opts = {} },
    -- }}}
    -- Fun stuff {{{
    -- StartupTime {{{
    {
        'dstein64/vim-startuptime',
        cmd = 'StartupTime',
        init = function()
            vim.g.startuptime_tries = 100
        end,
    }, -- }}}
    -- Funny floppin and plippin{{{
    {
        'Eandrju/cellular-automaton.nvim',
        cmd = 'CellularAutomaton',
    }, -- }}}
    -- Blazingly training??? {{{
    {
        'ThePrimeagen/vim-be-good',
        cmd = 'VimBeGood',
    }, -- }}}
    -- Animations on things{{{
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
    -- require('dragmove'),
    -- }}}
}
