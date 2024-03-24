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
            org_agenda_start_on_weekday = false,
            org_agenda_min_height = 32,
            org_agenda_skip_scheduled_if_done = true,
            org_agenda_skip_deadline_if_done = true,
            mappings = {
                org = {
                    org_cycle = false,
                    org_global_cycle = false,
                },
            },
        })
    end,
}
