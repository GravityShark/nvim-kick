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
    dependencies = {
        {
            'kevinhwang91/nvim-ufo',
            dependencies = 'kevinhwang91/promise-async',
            opts = function()
                -- vim.opt.foldcolumn = '1'
                vim.opt.foldlevel = 99
                vim.opt.foldlevelstart = 99
                vim.opt.foldenable = true
                require('ufo').setup({
                    provider_selector = function()
                        return ''
                    end,
                    open_fold_hl_timeout = 0,
                })
            end,
            --
        },
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
        -- {
        --     'chipsenkbeil/org-roam.nvim',
        --     opts = {
        --         directory = '~/Notes',
        --         database = {
        --             path = '~/Notes/.db',
        --         },
        --         templates = {
        --             d = {
        --                 description = 'default',
        --                 template = '*',
        --                 target = '%<%Y%m%d%H%M%S>-%[slug].org',
        --             },
        --         },
        --     },
        -- },
        -- {
        --     'akinsho/org-bullets.nvim',
        --     opts = {
        --         concealcursor = true,
        --         symbols = {
        --             -- list symbol
        --             list = '•',
        --             -- headlines can be a list
        --             headlines = {
        --                 '󰄰',
        --                 '󰪞',
        --                 '󰪟',
        --                 '󰪠',
        --                 '󰪡',
        --                 '󰪢',
        --                 '󰪣',
        --                 '󰪤',
        --                 '󰪥',
        --             },
        --             -- or a function that receives the defaults and returns a list
        --             -- headlines = function(default_list)
        --             --     table.insert(default_list, '♥')
        --             --     return default_list
        --             -- end,
        --             -- or false to disable the symbol. Works for all symbols
        --             -- headlines = false,
        --             checkboxes = false,
        --         },
        --     },
        -- },
    },

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
    },
}

-- Folds
