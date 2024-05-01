return {
    'nvim-orgmode/orgmode',
    ft = 'org',
    dependencies = {
        'kevinhwang91/nvim-ufo',
        ft = 'org',
        dependencies = 'kevinhwang91/promise-async',
        opts = function()
            vim.opt.foldcolumn = '1'
            vim.opt.foldlevel = 99
            vim.opt.foldlevelstart = 99
            require('ufo').setup({
                provider_selector = function(bufnr, filetype, buftype)
                    return { 'treesitter', 'indent' }
                end,
                open_fold_hl_timeout = 0,
            })
        end,
        --
    },

    config = {
        org_agenda_files = '~/Notes/**/*',
        org_default_notes_file = '~/Notes/refile.org',
        org_todo_keywords = {
            'TODO',
            '|',
            'DONE',
            'CANCEL',
        },
        org_agenda_start_on_weekday = false,
        org_agenda_skip_scheduled_if_done = true,
        org_agenda_skip_deadline_if_done = true,
        org_startup_folded = 'showeverything',
        mappings = {
            global = {
                org_agenda = false,
                org_capture = false,
            },
            org = {
                org_open_at_point = '<CR>',
            },
        },
    },
}

-- Folds
