return {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    cmd = 'Telescope',
    keys = {
        {
            '<leader>fr',
            '<CMD>Telescope oldfiles<CR>',
            desc = 'Find [r]ecent',
        }, -- Show recent files
        {
            '<leader>fg',
            '<CMD>Telescope git_files<CR>',
            desc = 'Find [g]it Files',
        }, -- Search for a file in project
        {
            '<leader>ff',
            '<CMD>Telescope find_files<CR>',
            desc = 'Find [f]iles',
        }, -- Search for a file (ignoring dotfiles)
        {
            '<leader>fa',
            '<CMD>Telescope find_files find_command=fd, hidden=true no_ignore=true<CR>',
            desc = 'Find [a]ll Files',
        }, -- Search for a file (with dotfiles)
        -- vim.api.nvim_set_keymap(
        -- 	'n',
        -- 	'<leader>fp',
        -- 	'<CMD>Telescope jumplist<CR>',
        -- 	{ noremap = true }
        -- ) -- Show jumplist (previous locations)
        {
            '<leader>fb',
            '<CMD>Telescope git_branches<CR>',
            desc = 'Find git [b]ranches',
        },
        -- Show git branches
        {
            '<leader>fl',
            '<CMD>Telescope live_grep<CR>',
            desc = 'Find text using [l]ive grep',
        }, -- Find a string in project
        -- vim.api.nvim_set_keymap(
        --     'n',
        --     '<leader>fb',
        --     '<CMD>Telescope buffers<CR>',
        --     { desc = 'Find [b]uffers' }
        -- ) -- Show all buffers
        {
            '<leader>f?',
            '<CMD>Telescope<CR>',
            desc = 'Find ?',
        }, -- Show all commands
        -- vim.api.nvim_set_keymap(
        --     'n',
        --     '<leader>fs',
        --     '<CMD>Telescope lsp_dynamic_workspace_symbols<CR>',
        --     { desc = 'Find [s]ymbls' }
        -- ) -- Search for dynamic symbols
        -- vim.api.nvim_set_keymap(
        -- 	'n',
        -- 	'<leader>fn',
        -- 	'<CMD>Telescope notify<CR>',
        -- 	{ noremap = true , desc = 'Find [N]otification History' }
        -- ) -- Show nvim-notify history
        -- vim.api.nvim_set_keymap(
        --     'n',
        --     '<leader>fp',
        --     '<CMD>Telescope project<CR>',
        --     { desc = 'Find [p]rojects' }
        -- ) -- Show projects
        {
            '<leader>fd',
            '<CMD>Telescope diagnostics<CR>',
            desc = 'Find [d]iagnostics',
        },
        -- Show diagnostics
        {
            '<leader>f/',
            '<CMD>Telescope current_buffer_fuzzy_find<CR>',
            desc = '[/] Fuzzily search in current buffer',
        },
        -- Show diagnostics
        -- vim.keymap.set('n', '<leader>f/', function()
        --     -- You can pass additional configuration to telescope to change theme, layout, etc.
        --     require('telescope.builtin').current_buffer_fuzzy_find(
        --         require('telescope.themes').get_dropdown({})
        --     )
        -- end, { desc = '[/] Fuzzily search in current buffer' })

        -- }}}
        {
            'n',
            '<leader>fo',
            '<CMD>Telescope find_files find_command=fd,--type=f,--extension=org<CR>',
            desc = 'Find [o]rg files',
        },
    },
    dependencies = {
        'nvim-lua/plenary.nvim',
        {
            'nvim-telescope/telescope-fzf-native.nvim',
            build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build',
        },
        {
            'prochri/telescope-all-recent.nvim',
            dependencies = {
                'kkharji/sqlite.lua',
            },
            config = true,
        },
    },
    config = function()
        local select_one_or_multi = function(prompt_bufnr)
            local picker =
                require('telescope.actions.state').get_current_picker(
                    prompt_bufnr
                )
            local multi = picker:get_multi_selection()
            if not vim.tbl_isempty(multi) then
                require('telescope.actions').close(prompt_bufnr)
                for _, j in pairs(multi) do
                    if j.path ~= nil then
                        vim.cmd(string.format('%s %s', 'edit', j.path))
                    end
                end
            else
                require('telescope.actions').select_default(prompt_bufnr)
            end
        end
        local telescope = require('telescope')
        local actions = require('telescope.actions')
        telescope.setup({
            defaults = {
                mappings = {
                    i = {
                        ['<CR>'] = select_one_or_multi,
                        ['<Tab>'] = actions.toggle_selection
                            + actions.move_selection_better,
                        ['<S-Tab>'] = actions.toggle_selection
                            + actions.move_selection_worse,
                        ['<ESC>'] = actions.close,
                    },
                },
                layout_config = {
                    horizontal = {
                        preview_width = 0.55,
                        results_width = 0.5,
                    },
                    width = 0.95,
                    height = 0.90,
                    preview_cutoff = 120,
                },
            },
            pickers = {
                find_org_files = {
                    find_command = { 'fd', '-e', 'org' },
                },
                find_files = {
                    run_command = 'fd',
                },
                find_all = {
                    -- Use fd instead of the default find command
                    find_command = { 'fd', '--hidden', '--no-ignore' },
                },
            },
        })
        pcall(telescope.load_extension, 'fzf')
    end,
}
