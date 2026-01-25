return {
    'leath-dub/snipe.nvim',
    dependencies = {
        {
            'kungfusheep/snipe-lsp.nvim',
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
    opts = {
        -- ui = {
        --     ---@type "topleft"|"bottomleft"|"topright"|"bottomright"|"center"|"cursor"
        --     position = 'center',
        --
        --     ---@type vim.api.keyset.win_config
        --     open_win_override = {
        --         border = 'rounded', -- use "rounded" for rounded border
        --     },
        --
        --     -- Preselect the currently open buffer
        --     preselect_current = true,
        --
        --     buffer_format = 'icon',
        -- },
        hints = { dictionary = '123456789!@#$%' },
        navigate = { open_split = 'S' },

        -- Can be any of:
        --  "last" - sort buffers by last accessed
        --  "default" - sort buffers by its number
        --  fun(bs:snipe.Buffer[]):snipe.Buffer[] - custom sort function, should accept a list of snipe.Buffer[] as an argument and return sorted list of snipe.Buffer[]
        ---@type "last"|"default"|fun(buffers:snipe.Buffer[]):snipe.Buffer[]
        -- sort = 'default',
    },
}
