return {
    'otavioschwanck/arrow.nvim',
    event = 'VeryLazy',
    dependencies = { 'echasnovski/mini.icons' },
    opts = {
        show_icons = true,
        always_show_path = true,
        -- hide_handbook = true,
        -- hide_buffer_handbook = true,
        leader_key = 'm',
        buffer_leader_key = ',',
        index_keys = 'tsradcxzbpfw',
        save_key = 'git_root',
        mappings = {
            toggle = ' ', -- <- this is a space btw
            delete_mode = 'k',
        },
    },
}
