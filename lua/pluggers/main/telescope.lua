return { -- telescope.nvim Fuzzy finding, but good
    'nvim-telescope/telescope.nvim',
    -- branch = '0.1.x',
    cmd = 'Telescope',
    keys = {
        { -- Find for a file
            '<leader>ff',
            '<CMD>Telescope find_files<CR>',
            desc = 'iles',
        },
        { -- Find for a file (with hidden files)
            '<leader>fa',
            '<CMD>Telescope find_files find_command=fd,--type=f,--color=never,--hidden,--no-ignore<CR>',
            desc = 'll files',
        },
        { -- Find for a file in git repository
            '<leader>fg',
            '<CMD>Telescope git_files<CR>',
            desc = 'it files',
        },
        { -- Find text through azlive prompt
            '<leader>fl',
            '<CMD>Telescope live_grep<CR>',
            desc = 'ive search',
        },
        { -- Show recent files
            '<leader>fr',
            '<CMD>Telescope oldfiles<CR>',
            desc = 'ecent',
        },
        { -- Show history (previous locations)
            '<leader>fh',
            '<CMD>Telescope jumplist<CR>',
            desc = 'istory of jumps',
        },
        { -- Show git branches
            '<leader>fb',
            '<CMD>Telescope buffers<CR>',
            desc = 'uffers',
        },
        { -- Show git branches
            '<leader>fc',
            '<CMD>Telescope git_branches<CR>',
            desc = 'heckout git branches',
        },
        { -- Show all commands
            '<leader>f?',
            '<CMD>Telescope<CR>',
            desc = 'Anything',
        },
        { -- Show diagnostics
            '<leader>fd',
            '<CMD>Telescope diagnostics<CR>',
            desc = 'iagnostics',
        },
        { -- Fuzzy search in the buffer
            '<leader>ft',
            '<CMD>Telescope current_buffer_fuzzy_find<CR>',
            desc = '[/] Fuzzily search in current buffer',
        },
    },
    dependencies = {
        'nvim-lua/plenary.nvim',
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    },
    config = function()
        local telescope = require('telescope')
        local actions = require('telescope.actions')

        local select_one_or_multi = function(prompt_bufnr)
            local picker =
                require('telescope.actions.state').get_current_picker(
                    prompt_bufnr
                )
            local multi = picker:get_multi_selection()
            if not vim.tbl_isempty(multi) then
                actions.close(prompt_bufnr)
                for _, j in pairs(multi) do
                    if j.path ~= nil then
                        vim.cmd(string.format('%s %s', 'edit', j.path))
                    end
                end
            else
                actions.select_default(prompt_bufnr)
            end
        end

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
                layout_strategy = 'bottom_pane',
                layout_config = {
                    bottom_pane = {
                        preview_width = 0.55,
                        results_width = 0.45,
                        prompt_position = 'bottom',
                    },
                },
            },
            pickers = {
                find_files = {
                    run_command = { 'fd', '--type', 'f', '--color', 'never' },
                },
            },
        })
        telescope.load_extension('fzf')
    end,
}
