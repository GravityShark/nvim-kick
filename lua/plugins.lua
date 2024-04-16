local LazyFile = { 'BufReadPost', 'BufWritePre', 'BufNewFile' }
local VeryLazyFile = { 'BufReadPost', 'BufWritePre', 'BufNewFile', 'VeryLazy' }

-- Maybe read the README.md
return {
    -- Main{{{
    -- LSP & Mason {{{
    {
        -- LSP Configuration & Plugins
        'neovim/nvim-lspconfig',
        event = LazyFile,
        config = function()
            require('pluggers.lspconfig')
        end,
        dependencies = {
            -- Easy installation of LSPs and more
            {
                'WhoIsSethDaniel/mason-tool-installer.nvim',
                dependencies = {
                    { 'williamboman/mason.nvim', cmd = 'Mason', opts = {} },
                },
            },
            -- Shows a little widget showing the status of LSP
            -- { 'j-hui/fidget.nvim', opts = {} },
        },
    },

    -- }}}

    -- Treesitter {{{
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

    -- Text Completion {{{
    {
        -- Autocompletion
        'hrsh7th/nvim-cmp',
        event = 'InsertEnter',
        dependencies = {
            -- Adds paths to sources
            'hrsh7th/cmp-path',

            -- Adds LSP completion capabilities
            'hrsh7th/cmp-nvim-lsp',

            -- Adds the built-in vim auto-complete
            'hrsh7th/cmp-buffer',

            -- Snippet Engine & its associated nvim-cmp source
            {
                'L3MON4D3/LuaSnip',
                version = 'v2.*', -- Replace <CurrentMajor> by the latest released major (first number of latest release)
                build = 'make install_jsregexp',
                dependencies = {
                    {
                        'rafamadriz/friendly-snippets',
                        config = function()
                            require('luasnip.loaders.from_vscode').lazy_load()
                        end,
                    },
                },
            },
            'saadparwaiz1/cmp_luasnip',
        },
        config = function()
            require('pluggers.cmp')
        end,
    }, -- }}}

    -- Formatting and Linting{{{
    require('pluggers.conform'),
    require('pluggers.lint'), -- }}}
    --}}}

    -- Other {{{
    -- Trouble Diagnostic Viewer {{{
    {
        'folke/trouble.nvim',
        cmd = { 'TroubleToggle' },
        keys = {
            {
                '<leader>x',
                '<CMD>TroubleToggle<CR>',
                desc = 'Trouble [x] Toggle',
            },
            {
                '<leader>xw',
                '<cmd>TroubleToggle workspace_diagnostics<cr>',
                desc = 'Trouble [w]orkspace Diagnostics',
            },
            {
                '<leader>xd',
                '<cmd>TroubleToggle document_diagnostics<cr>',
                desc = 'Trouble [d]ocument Diagnostics',
            },
            {
                '<leader>xq',
                '<cmd>TroubleToggle quickfix<cr>',
                desc = 'Trouble [q]uickfix',
            },
            {
                '<leader>xl',
                '<cmd>TroubleToggle loclist<cr>',
                desc = 'Trouble [l]OC/Diagnostic List',
            },
            {
                '<leader>xr',
                '<cmd>TroubleToggle lsp_references<cr>',
                desc = 'Trouble LSP [r]eferences',
            },
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
    -- Telescope / Fuzzy Finder {{{
    {
        'nvim-telescope/telescope.nvim',
        branch = '0.1.x',
        cmd = 'Telescope',
        dependencies = {
            'nvim-lua/plenary.nvim',
            {
                'nvim-telescope/telescope-fzf-native.nvim',
                build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build',
            },
        },
        config = function()
            local telescope = require('telescope')
            telescope.setup({
                defaults = {
                    layout_config = {
                        horizontal = {
                            preview_width = 0.55,
                            results_width = 0.5,
                        },
                        width = 0.95,
                        height = 0.90,
                        preview_cutoff = 120,
                    },
                },
            })
            pcall(telescope.load_extension('fzf'))
        end,
    },
    -- }}}
    -- Color the background of color codes {{{
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
    -- Harpoon {{{
    {
        'ThePrimeagen/harpoon',
        branch = 'harpoon2',
        dependencies = { 'nvim-lua/plenary.nvim' },
        keys = {
            { '<leader>`', desc = '[`] Open Harpoon Menu' },
            { '<leader>a', desc = '[a]ppend to Harpoon' },
            '<A-1>',
            '<A-2>',
            '<A-3>',
            '<A-4>',
            '<A-5>',
            '<A-6>',
            '<A-7>',
            '<A-8>',
            '<A-9>',
        },
        opts = function()
            local harpoon = require('harpoon')
            harpoon:setup()

            vim.keymap.set('n', '<leader>a', function()
                harpoon:list():add()
            end)
            vim.keymap.set('n', '<leader>`', function()
                harpoon.ui:toggle_quick_menu(harpoon:list())
            end)

            for i = 1, 9 do
                vim.keymap.set('n', '<A-' .. i .. '>', function()
                    harpoon:list():select(i)
                end, {
                    noremap = true,
                    -- desc = 'Harpoon open buffer ' .. i,
                })
            end
            -- vim.keymap.set('n', '<S-Tab>', function()
            --     harpoon:list():prev()
            -- end)
            -- vim.keymap.set('n', '<Tab>', function()
            --     harpoon:list():next()
            -- end)
        end,
    },

    {
        'ThePrimeagen/vim-be-good',
        cmd = { 'VimBeGood' },
    },
    -- }}}
    -- Undotree {{{
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
    -- Git related plugins {{{
    -- Git Signs{{{
    -- Adds git related signs to the gutter, as well as utilities for managing changes
    {
        'lewis6991/gitsigns.nvim',
        event = LazyFile,
        opts = require('pluggers.gitsigns'),
    }, -- }}}
    -- Fugitive {{{
    {
        'tpope/vim-fugitive',
        cmd = { 'Git', 'GBrowse' },
        dependencies = 'tpope/vim-rhubarb',
    }, -- }}}
    -- }}}
    -- vim-sleuth Detect tabstop and shiftwidth automatically {{{
    {
        'tpope/vim-sleuth',
        event = LazyFile,
    },
    --}}}
    -- ZenMode{{{
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
                options = {
                    colorcolumn = '0',
                },
            },
            plugins = {
                options = {
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
    -- which-key {{{
    {
        'folke/which-key.nvim',
        event = 'VeryLazy',
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
            require('which-key').setup({
                window = {
                    border = 'single', -- none, single, double, shadow
                    position = 'bottom', -- bottom, top
                    margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]. When between 0 and 1, will be treated as a percentage of the screen size.
                    padding = { 1, 2, 1, 2 }, -- extra window padding [top, right, bottom, left]
                    winblend = 0, -- value between 0-100 0 for fully opaque and 100 for fully transparent
                    zindex = 1000, -- positive value to position WhichKey above other floating windows.
                },
                layout = {
                    height = { min = 4, max = 25 }, -- min and max height of the columns
                    width = { min = 20, max = 50 }, -- min and max width of the columns
                    spacing = 3, -- spacing between columns
                    align = 'center', -- align columns left, center or right
                },

                icons = {
                    breadcrumb = '»', -- symbol used in the command line area that shows your active key combo
                    separator = '»', -- symbol used between a key and it's label
                    group = '+', -- symbol prepended to a group
                },
            })
        end,
        opts = function()
            local wk = require('which-key')
            wk.register({
                f = { name = '[f]ind' },
                r = {
                    name = '[r]un',
                    g = {
                        name = '[g]cc',
                    },
                },
                o = { name = '[o]rg' },
                g = { name = '[g]it' },
            }, { prefix = '<leader>' })
        end,
    }, -- }}}
    -- }}}

    -- mini.nvim improvements {{{
    -- better (a)round and (i)nside commands{{{
    { 'echasnovski/mini.ai', event = 'VeryLazy', opts = {} },
    -- }}}
    -- better f/F and t/T{{{
    {
        'echasnovski/mini.jump',
        keys = { 'f', 'F', 't', 'T', ';' },
        opts = { highlight = 0 },
    },
    -- }}}
    -- Auto pairs (){{{
    {
        'echasnovski/mini.pairs',
        event = 'InsertEnter',
        opts = {},
    }, -- }}}
    -- "gcc/gc" to comment visual regions/lines{{{
    {
        'echasnovski/mini.comment',
        keys = { 'gcc', { 'gc', mode = 'v' } },
        opts = {},
    },
    -- }}}
    -- Fast bufferline{{{
    {
        'GravityShark0/mini.tabline-select',
        -- event = { 'BufReadPost', 'BufNewFile' },
        event = LazyFile,
        dependencies = 'nvim-tree/nvim-web-devicons',
        opts = { set_vim_settings = false },
    },
    -- }}}
    -- Kill buffers and preserve window layout{{{
    { 'echasnovski/mini.bufremove' },
    -- }}}
    -- 's' to surround with '' or (){{{
    {
        'echasnovski/mini.surround',
        keys = {
            { 'sa', mode = 'v' },
            'sa',
            'sd',
            'sr',
            'sf',
            'sF',
            'sh',
            'sn',
        },
        opts = {},
    },
    -- }}}
    -- }}}

    -- Theme / Visual {{{
    -- Statusline {{{
    {
        'echasnovski/mini.statusline',
        opts = { set_vim_settings = false },
        lazy = false,
    },
    -- }}}
    -- Illuminate same words{{{
    {
        'echasnovski/mini.cursorword',
        event = VeryLazyFile,
        opts = {},
    },
    -- }}}
    -- Animations on things{{{
    {
        'echasnovski/mini.animate',
        -- enabled = false,
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
                        duration = 100,
                        unit = 'total',
                    }),
                },
                cursor = {
                    timing = animate.gen_timing.quadratic({
                        duration = 100,
                        unit = 'total',
                    }),
                },
            }
        end,
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
    -- go to the lua/colorscheme dir to see more
    require('colorscheme.monokai'),
    -- vim.cmd.colorscheme('habamax'),
    -- require('colorscheme.transparent'),
    -- }}}

    -- Filetype specific plugins{{{
    -- X go.nvim{{{
    -- {
    --     'ray-x/go.nvim',
    --     dependencies = { -- optional packages
    --         'ray-x/guihua.lua',
    --         'neovim/nvim-lspconfig',
    --         'nvim-treesitter/nvim-treesitter',
    --     },
    --     config = function()
    --         require('go').setup()
    --     end,
    --     ft = { 'go', 'gomod' },
    --     build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
    -- }, -- }}}
    -- X neodev.nvim When developing in neovim config files{{{
    { 'folke/neodev.nvim', opts = {} }, -- }}}
    -- }}}

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
    -- }}}

    -- I might not want all the time{{{
    require('pluggers.debug'),
    require('pluggers.org'),
    -- }}}
}
