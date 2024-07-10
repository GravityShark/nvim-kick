return {
    'ibhagwan/fzf-lua',
    -- optional for icon support
    keys = {
        { -- Find for a file
            '<leader>ff',
            '<CMD>FzfLua files<CR>',
            desc = 'iles',
        },
        { -- Find for a file (with hidden files)
            '<leader>fa',
            '<CMD>FzfLua find_files find_command=fd,--type=f,--color=never,--hidden,--no-ignore<CR>',
            desc = 'll files',
        },
        { -- Find for a file in git repository
            '<leader>fg',
            '<CMD>FzfLua git_files<CR>',
            desc = 'it files',
        },
        { -- Find text through azlive prompt
            '<leader>fl',
            '<CMD>FzfLua live_grep_native<CR>',
            desc = 'ive search',
        },
        { -- Show recent files
            '<leader>fr',
            '<CMD>FzfLua oldfiles<CR>',
            desc = 'ecent',
        },
        { -- Show history (previous locations)
            '<leader>fh',
            '<CMD>FzfLua jumplist<CR>',
            desc = 'istory of jumps',
        },
        { -- Show git branches
            '<leader>fb',
            '<CMD>FzfLua buffers<CR>',
            desc = 'uffers',
        },
        { -- Show git branches
            '<leader>fc',
            '<CMD>FzfLua git_branches<CR>',
            desc = 'heckout git branches',
        },
        { -- Show all commands
            '<leader>f?',
            '<CMD>FzfLua builtin<CR>',
            desc = 'Anything',
        },
        { -- Show diagnostics
            '<leader>fd',
            '<CMD>FzfLua diagnostics_workspace<CR>',
            desc = 'iagnostics',
        },
        { -- Fuzzy search in the buffer
            '<leader>ft',
            '<CMD>FzfLua current_buffer_fuzzy_find<CR>',
            desc = '[/] Fuzzily search in current buffer',
        },
    },
    opts = {
        -- { 'fzf-native' },
        preview = { delay = 0},
        winopts = {
            fullscreen = true,
        },
    },
}
