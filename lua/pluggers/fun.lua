
return {
    -- Fun stuff {{{
    -- StartupTime {{{
    {
        'dstein64/vim-startuptime',
        cmd = 'StartupTime',
        init = function()
            vim.g.startuptime_tries = 100
        end,
    }, -- }}}
    -- Funny floppin and plippin{{{
    {
        'Eandrju/cellular-automaton.nvim',
        cmd = 'CellularAutomaton',
    }, -- }}}
    -- Blazingly training??? {{{
    {
        'ThePrimeagen/vim-be-good',
        cmd = 'VimBeGood',
    }, -- }}}
    -- require('dragmove'),
    -- }}}
}
