return {
    'leath-dub/snipe.nvim',
    dependencies = {
        {
            'kungfusheep/snipe-lsp.nvim',
            dependencies = 'leath-dub/snipe.nvim',
            keys = {
                {
                    '<leader>cs',
                    '<CMD>SnipeLspSymbols<CR>',
                    desc = 'snipe menu',
                },
                {
                    '<leader>cS',
                    '<CMD>SnipeLspSymbolsVSplit<CR>',
                    desc = 'Snipe menu split',
                },
            },
            opts = {},
        },
    },
    event = { 'VeryLazy', 'LspAttach' }, -- Lsp Attach is for times when lsps open a menu when you just opened a file
    keys = {
        {
            'gb',
            function()
                require('snipe').open_buffer_menu()
            end,
            desc = 'Open Snipe buffer menu',
        },
    },
    config = function()
        local snipe = require('snipe')
        snipe.ui_select_menu =
            require('snipe.menu'):new({ position = 'center' })
        snipe.ui_select_menu:add_new_buffer_callback(function(m)
            vim.keymap.set('n', '<esc>', function()
                m:close()
            end, { nowait = true, buffer = m.buf })
        end)
        vim.ui.select = snipe.ui_select
        snipe.setup({
            position = 'center',
            hints = {
                dictionary = '1234567890!@#$%^&*()',
                -- Character used to disambiguate tags when 'persist_tags' option is set
                prefix_key = '.',
            },
            navigate = {
                -- Specifies the "leader" key
                -- This allows you to select a buffer but defer the action.
                -- NOTE: this does not override your actual leader key!
                -- leader = ",",

                -- Leader map defines keys that follow a selection prefixed by the
                -- leader key. For example (with tag "a"):
                -- ,ad -> run leader_map["d"](m, i)
                -- NOTE: the leader_map cannot specify multi character bindings.
                -- leader_map = {
                --     ['d'] = function(m, i)
                --         require('snipe').close_buf(m, i)
                --     end,
                --     ['v'] = function(m, i)
                --         require('snipe').open_vsplit(m, i)
                --     end,
                --     ['s'] = function(m, i)
                --         require('snipe').open_split(m, i)
                --     end,
                -- },

                -- When the list is too long it is split into pages
                -- `[next|prev]_page` options allow you to navigate
                -- this list
                -- next_page = 'J',
                -- prev_page = 'K',

                -- You can also just use normal navigation to go to the item you want
                -- this option just sets the keybind for selecting the item under the
                -- cursor
                ---@type string|string[]
                -- under_cursor = '<cr>',

                -- In case you changed your mind, provide a keybind that lets you
                -- cancel the snipe and close the window.
                ---@type string|string[]
                -- cancel_snipe = '<esc>',

                -- Close the buffer under the cursor
                -- Remove "j" and "k" from your dictionary to navigate easier to delete
                -- NOTE: Make sure you don't use the character below on your dictionary
                -- close_buffer = 'D',

                -- Open buffer in vertical split
                -- open_vsplit = 'V',

                -- Open buffer in split, based on `vim.opt.splitbelow`
                open_split = 'S',

                -- Change tag manually (note only works if `persist_tags` is not enabled)
                -- change_tag = "C",
            },
        })
    end,
}
