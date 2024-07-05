return {
    {
        'nvim-orgmode/orgmode',
        ft = 'org',
        keys = {
            {
                '<localleader>c',
                '<Cmd>lua require("orgmode").action("capture.prompt")<CR>',
                desc = 'Org [c]reate note',
            },
            {
                '<localleader>a',
                '<Cmd>lua require("orgmode").action("agenda.prompt")<CR>',
                desc = 'Org [a]genda',
            },
        },
        dependencies = {
            {
                'chipsenkbeil/org-roam.nvim',
                keys = {
                    {
                        '<C-\\>c',
                        "<Cmd> lua require('org-roam').api.capture_node()<CR>",
                        desc = 'Roam [c]apture',
                    },
                },
                opts = {
                    directory = '~/Notes/wiki',
                    bindings = {
                        prefix = '<C-\\>',
                    },
                    immediate = {
                        target = '%[slug].org',
                        template = 'AAAnatoarnotraintar ==',
                    },
                    templates = {
                        n = {
                            description = 'Main Note',
                            template = 'Created %U\n\n* %?\n\n\n\n\n* References\n',
                            target = '%[slug].org',
                        },
                    },
                },
            },
            {
                'nvim-orgmode/telescope-orgmode.nvim',
                dependencies = {
                    'nvim-telescope/telescope.nvim',
                },
                config = function()
                    require('telescope').load_extension('orgmode')

                    vim.keymap.set(
                        'n',
                        '<localleader>R',
                        require('telescope').extensions.orgmode.refile_heading,
                        { desc = 'org refile to headline' }
                    )
                    vim.keymap.set(
                        'n',
                        '<localleader>f',
                        require('telescope').extensions.orgmode.search_headings,
                        { desc = 'org find headings' }
                    )
                    vim.keymap.set(
                        'n',
                        '<localleader>lf',
                        require('telescope').extensions.orgmode.insert_link,
                        { desc = 'org link refile fuzzy' }
                    )
                end,
            },
            { 'danilshvalov/org-modern.nvim' },
        },
        opts = {
            ui = {
                menu = {
                    handler = function(data)
                        require('org-modern.menu')
                            :new({
                                window = {
                                    margin = { 1, 0, 1, 0 },
                                    padding = { 0, 1, 0, 1 },
                                    title_pos = 'center',
                                    border = 'single',
                                    zindex = 1000,
                                },
                                icons = {
                                    separator = '➜',
                                },
                            })
                            :open(data)
                    end,
                },
            },
            org_agenda_files = '~/Notes/**/*',
            org_archive_location = '~/Notes/.archive/%s_archive',
            org_default_notes_file = '~/Notes/refile.org',
            org_todo_keywords = {
                'TODO',
                '|',
                'DONE',
                'CANCEL',
            },
            org_hide_emphasis_markers = true,
            org_hide_leading_stars = true,
            org_agenda_start_on_weekday = false,
            org_agenda_skip_scheduled_if_done = true,
            org_agenda_skip_deadline_if_done = true,
            org_id_link_to_org_use_id = true,
            mappings = {
                prefix = '<localleader>',
                org = {
                    org_open_at_point = { '<CR>', '<prefix>o' },
                    org_meta_return = '<prefix><CR>',
                    org_cycle = 'za',
                    org_global_cycle = 'zA',
                },
            },

            org_capture_templates = {
                t = {
                    description = 'Todo',

                    template = '* TODO %?\nSCHEDULED: %t\n  DEADLINE: %^{Deadline}t\n  %U\n  ',
                    target = '~/Notes/todo.org',
                },
                r = {
                    description = 'Reminder',
                    template = '* TODO %?\n  SCHEDULED: %^{When happening?}t\n  %U\n  ',
                    target = '~/Notes/reminders.org',
                },
                n = { description = 'Note', template = '* %?\n  %U' },
            },
        },
    },
}
-- Folds
