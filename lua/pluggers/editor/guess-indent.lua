return { -- guess-indent.nvim Automatically guess the indent level
    'nmac427/guess-indent.nvim',
    cmd = 'GuessIndent',
    keys = { { '<Leader>cg', '<CMD>GuessIndent<CR>', desc = 'Guess Indent' } },
    opts = {},
    event = { 'BufReadPost', 'BufNewFile', 'BufWritePre' },
}
