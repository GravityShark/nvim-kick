return {
    'otavioschwanck/arrow.nvim',
    event = 'VeryLazy',
    dependencies = { 'echasnovski/mini.icons' },
    opts = {
        show_icons = true,
        leader_key = 'm', -- Recommended to be a single key
        buffer_leader_key = ',', -- Per Buffer Mappings
        -- index_keys = '123456789zxcbnmZXVBNM,afghjklAFGHJKLwrtyuiopWRTYUIOP', -- keys mapped to bookmark index, i.e. 1st bookmark will be accessible by 1, and 12th - by c
        -- index_keys = 'tnseriaoplfuwydhvmck',
        index_keys = 'tsradfw',
        save_key = 'git_root',
        mappings = {
            edit = 'c',
            delete_mode = 'x',
            clear_all_items = 'C',
            toggle = 'n', -- used as save if separate_save_and_remove is true
            open_vertical = 'v',
            open_horizontal = '-',
            -- quit = 'q',
            -- remove = 'x', -- only used if separate_save_and_remove is true
            next_item = ']',
            prev_item = '[',
        },
    },
}
