return {
    -- mini.pairs Auto pairs ()[]{}
    {
        'echasnovski/mini.pairs',
        event = 'InsertEnter',
        config = true,
    },
    -- mini.ai Better (a)round and (i)nside commands
    { 'echasnovski/mini.ai', event = 'VeryLazy', config = true },
    -- mini.jump Better f/F and t/T
    {
        'echasnovski/mini.jump',
        keys = { 'f', 'F', 't', 'T', ';' },
        opts = { highlight = 0 },
    },
    -- mini.bufremove Kill buffers and preserve window layout
    { 'echasnovski/mini.bufremove' },
    -- mini.surround Surround text with any character
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
        config = true,
    },
    -- sleuth.vim: Heuristically set buffer options
    {
        'tpope/vim-sleuth',
        event = { 'BufReadPost', 'BufNewFile', 'BufWritePre' },
        -- event = { 'VeryLazy' },
    },
}
