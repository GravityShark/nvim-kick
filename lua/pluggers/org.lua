return {
    'nvim-orgmode/orgmode',
    ft = 'org',
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
            'akinsho/org-bullets.nvim',
            opts = {
                concealcursor = true,
                symbols = {
                    -- list symbol
                    list = '•',
                    -- headlines can be a list
                    headlines = {
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
                    -- or a function that receives the defaults and returns a list
                    -- headlines = function(default_list)
                    --     table.insert(default_list, '♥')
                    --     return default_list
                    -- end,
                    -- or false to disable the symbol. Works for all symbols
                    -- headlines = false,
                    checkboxes = false,
                },
            },
        },
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
