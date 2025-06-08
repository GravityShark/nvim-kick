return { -- guess-indent.nvim Automatically guess the indent level
    'nmac427/guess-indent.nvim',
    keys = { '<Leader>cg', '<CMD>GuessIndent<CR>', desc = 'Guess Indent' },
    cmd = 'GuessIndent',
    opts = {},
    event = { 'BufReadPost', 'BufNewFile', 'BufWritePre' },
}
