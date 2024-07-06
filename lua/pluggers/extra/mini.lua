-- As in mini improvements that I really like
-- Mainly from echasnovski/mini.nvim
return {
    { -- mini.surround Surround text with any character
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
    { -- mini.pairs Auto pairs ()[]{}
        'echasnovski/mini.pairs',
        event = 'InsertEnter',
        config = true,
    },
    { -- mini.jump Better f/F and t/T
        'echasnovski/mini.jump',
        keys = { 'f', 'F', 't', 'T', ';' },
        opts = { highlight = 0 },
    },
    { -- sleuth.vim: Heuristically set buffer options
        'tpope/vim-sleuth',
        event = { 'BufReadPost', 'BufNewFile', 'BufWritePre' },
    },
    -- mini.ai Better (a)round and (i)nside commands
    { 'echasnovski/mini.ai', event = 'VeryLazy', config = true },
    -- mini.bufremove Kill buffers and preserve window layout
    { 'echasnovski/mini.bufremove' },
}
