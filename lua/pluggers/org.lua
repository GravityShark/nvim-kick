return {
    'nvim-orgmode/orgmode',
    dependencies = {
        { 'nvim-treesitter/nvim-treesitter', lazy = true },
        -- { 'akinsho/org-bullets.nvim', opts = {} },
    },
    ft = 'org',
    keys = '<leader>o',
    config = function()
        -- Load treesitter grammar for org
        require('orgmode').setup_ts_grammar()

        -- Setup treesitter
        require('nvim-treesitter.configs').setup({
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = { 'org' },
            },
            ensure_installed = { 'org' },
        })

        -- Setup orgmode
        local agenda_files = '~/Notes/**/*'
        local default_notes_file = '~/Notes/refile.org'
        -- if vim.g.is_termux then
        --     local agenda_files = '/storage/self/primary/**/*'
        --     local default_notes_file = '/storage/self/primary/refile.org'
        -- end
        require('orgmode').setup({
            org_agenda_files = agenda_files,
            org_default_notes_file = default_notes_file,
            org_todo_keywords = {
                'TODO',
                'NEXT',
                'HOLD',
                'WAIT',
                'INC',
                '|',
                'DONE',
                'CANCEL',
            },
        })
    end,
}
