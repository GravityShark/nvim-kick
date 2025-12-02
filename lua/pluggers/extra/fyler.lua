return {
    'A7Lavinraj/fyler.nvim',
    dependencies = { 'nvim-mini/mini.icons' },
    keys = {
        {
            '<leader>,',
            '<CMD>Fyler<CR>',
            desc = 'tree',
        },
    },
    branch = 'stable',
    -- lazy = false, -- Necessary for `default_explorer` to work properly
    opts = {
        views = {
            finder = {
                close_on_select = false,
                -- default_explorer = true,
                delete_to_trash = true,
                git_status = {
                    symbols = {
                        Added = '▎',
                        Modified = '▎',
                        Deleted = '󰐊',
                        topdelete = '󰐊',
                        Renamed = '▎',
                        Untracked = '┆',
                    },
                },
            },
            mappings = {
                ['q'] = 'CloseView',
                ['<CR>'] = 'Select',
                ['<C-t>'] = 'SelectTab',
                ['|'] = 'SelectVSplit',
                ['-'] = 'SelectSplit',
                ['^'] = 'GotoParent',
                ['='] = 'GotoCwd',
                ['.'] = 'GotoNode',
                ['#'] = 'CollapseAll',
                ['<BS>'] = 'CollapseNode',
            },
        },
    },
}
