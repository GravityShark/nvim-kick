return {
    'otavioschwanck/arrow.nvim',
    event = 'VeryLazy',
    dependencies = { 'echasnovski/mini.icons' },
    opts = {
        show_icons = true,
        leader_key = 'm', -- Recommended to be a single key
        buffer_leader_key = ',', -- Per Buffer Mappings
        -- index_keys = '123456789zxcbnmZXVBNM,afghjklAFGHJKLwrtyuiopWRTYUIOP', -- keys mapped to bookmark index, i.e. 1st bookmark will be accessible by 1, and 12th - by c
        index_keys = 'tnseriaoplfuwydhvmck', -- keys mapped to bookmark index, i.e. 1st bookmark will be accessible by 1, and 12th - by c
    },
}
