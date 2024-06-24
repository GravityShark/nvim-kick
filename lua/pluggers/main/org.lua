return {
    'nvim-orgmode/orgmode',
    ft = 'org',
    keys = {
        {
            '<leader>oc',
            '<Cmd>lua require("orgmode").action("capture.prompt")<CR>',
            desc = 'Org [c]reate note',
        },
        {
            '<leader>oa',
            '<Cmd>lua require("orgmode").action("agenda.prompt")<CR>',
            desc = 'Org [a]genda',
        },
    },
    dependencies = { -- {{{
        {
            'lukas-reineke/headlines.nvim',
            opts = {
                org = {
                    fat_headlines = false,
                    headline_highlights = {
                        'Headline1',
                        'Headline2',
                        'Headline3',
                        'Headline4',
                        'Headline5',
                        'Headline6',
                        'Headline7',
                        'Headline8',
                    },
                    bullets = {
                        '󰄰',
                        '󰪞',
                        '󰪟',
                        '󰪠',
                        '󰪡',
                        '󰪢',
                        '󰪣',
                        '󰪤',
                        '󰪥',
                    },
                },
            },
        },
    }, -- }}}

    opts = {
        org_agenda_files = '~/Notes/**/*',
        org_default_notes_file = '~/Notes/refile.org',
        org_todo_keywords = {
            'TODO',
            '|',
            'DONE',
            'CANCEL',
        },
        org_hide_emphasis_markers = true,
        org_agenda_start_on_weekday = false,
        org_agenda_skip_scheduled_if_done = true,
        org_agenda_skip_deadline_if_done = true,
        mappings = {
            global = {
                org_agenda = false,
                org_capture = false,
            },
            org = {
                org_open_at_point = '<CR>',
            },
        },
        org_capture_templates = {
            t = {
                description = 'Todo',
                template = '* TODO %?\nSCHEDULED: %t\n\tDEADLINE: %^{Deadline}t\n\t%u\n\t',
                target = '~/Notes/todo.org',
            },
            r = {
                description = 'Reminder',
                template = '* TODO %?\n\tSCHEDULED: %^{When happening?}t\n\t%u\n\t',
                target = '~/Notes/reminders.org',
            },
            n = { description = 'Note', template = '* %?\n  %u' },
        },
    },
}

-- Folds
