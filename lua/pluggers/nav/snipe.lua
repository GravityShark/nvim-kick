return {
    'leath-dub/snipe.nvim',
    dependencies = {
        { 'nvim-mini/mini.icons', opts = {} },
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
        -- https://github.com/kungfusheep/snipe-spell.nvim
        -- https://github.com/nicholasxjy/snipe-marks.nvim
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
    config = function(_, opts)
        local snipe = require('snipe')
        snipe.setup(opts)
        snipe.ui_select_menu = require('snipe.menu'):new({})
        -- snipe.ui_select_menu:add_new_buffer_callback(function(m)
        --     vim.keymap.set('n', '<esc>', function()
        --         m:close()
        --     end, { nowait = true, buffer = m.buf })
        -- end)
        vim.ui.select = snipe.ui_select
    end,
    opts = {
        hints = { dictionary = '1234567890!@#$%^&*()' },
        navigate = { open_split = 'S' },
        ---@type "last"|"default"|fun(buffers:snipe.Buffer[]):snipe.Buffer[]
        sort = 'default',
        ui = {
            -- buffer_format = 'icon',
            ---@type vim.api.keyset.win_config
            open_win_override = { border = 'rounded' },
            persist_tags = false,
            ---@type "topleft"|"bottomleft"|"topright"|"bottomright"|"center"|"cursor"
            position = 'center',
            preselect_current = true,
        },
    },
}
