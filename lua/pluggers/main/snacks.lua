return {
    'folke/snacks.nvim',
    priority = 1000,
    lazy = false,
    init = function()
        vim.api.nvim_create_autocmd('User', {
            pattern = 'OilActionsPost',
            callback = function(event)
                if event.data.actions[1].type == 'move' then
                    Snacks.rename.on_rename_file(
                        event.data.actions[1].src_url,
                        event.data.actions[1].dest_url
                    )
                end
            end,
        })
    end,
    opts = {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
        bigfile = { enabled = true },
        bufdelete = { enabled = true },
        indent = { enabled = true },
        input = { enabled = true }, -- testing it out2
        picker = { enabled = true }, -- testing it out3
        image = { enabled = true },
        quickfile = { enabled = true },
        rename = { enabled = true },
        statuscolumn = {
            enabled = true,
            folds = {
                git_hl = true,
            },
        }, -- testing it out4
        -- words = { enabled = true },
    },
    keys = {
        {
            '<leader>b',
            function()
                require('snacks').bufdelete.delete()
            end,
            desc = 'buffer delete',
        },
        -- Top Pickers & Explorer
        {
            '<leader>s',
            '',
            desc = '+search',
        },
        {
            '<leader>f',
            function()
                Snacks.picker.smart({
                    multi = { 'buffers', 'recent', 'git_files' },
                })
            end,
            desc = 'smart find files',
        },
        {
            '<leader>,',
            function()
                Snacks.picker.buffers()
            end,
            desc = 'buffers',
        },
        {
            '<leader>:',
            function()
                Snacks.picker.command_history()
            end,
            desc = 'command History',
        },
        {
            '<leader>n',
            function()
                Snacks.picker.notifications()
            end,
            desc = 'notification History',
        },
        {
            '<leader>e',
            function()
                Snacks.explorer()
            end,
            desc = 'file Explorer',
        },
        -- find
        {
            '<leader>sb',
            function()
                Snacks.picker.buffers()
            end,
            desc = 'buffers',
        },
        -- {
        --     '<leader>fc',
        --     function()
        --         Snacks.picker.files({ cwd = vim.fn.stdpath('config') })
        --     end,
        --     desc = 'find Config File',
        -- },
        {
            '<leader>sf',
            function()
                Snacks.picker.files()
            end,
            desc = 'find Files',
        },
        {
            '<leader>sg',
            function()
                Snacks.picker.git_files()
            end,
            desc = 'find Git Files',
        },
        -- {
        --     '<leader>fp',
        --     function()
        --         Snacks.picker.projects()
        --     end,
        --     desc = 'projects',
        -- },
        {
            '<leader>sr',
            function()
                Snacks.picker.recent()
            end,
            desc = 'recent',
        },
        -- git
        {
            '<leader>gb',
            function()
                Snacks.picker.git_branches()
            end,
            desc = 'git Branches',
        },
        {
            '<leader>gl',
            function()
                Snacks.picker.git_log()
            end,
            desc = 'git Log',
        },
        {
            '<leader>gL',
            function()
                Snacks.picker.git_log_line()
            end,
            desc = 'git Log Line',
        },
        {
            '<leader>gs',
            function()
                Snacks.picker.git_status()
            end,
            desc = 'git Status',
        },
        {
            '<leader>gS',
            function()
                Snacks.picker.git_stash()
            end,
            desc = 'git Stash',
        },
        {
            '<leader>gd',
            function()
                Snacks.picker.git_diff()
            end,
            desc = 'git Diff (Hunks)',
        },
        {
            '<leader>gf',
            function()
                Snacks.picker.git_log_file()
            end,
            desc = 'git Log File',
        },
        -- gh
        {
            '<leader>gi',
            function()
                Snacks.picker.gh_issue()
            end,
            desc = 'gitHub Issues (open)',
        },
        {
            '<leader>gI',
            function()
                Snacks.picker.gh_issue({ state = 'all' })
            end,
            desc = 'gitHub Issues (all)',
        },
        {
            '<leader>gp',
            function()
                Snacks.picker.gh_pr()
            end,
            desc = 'gitHub Pull Requests (open)',
        },
        {
            '<leader>gP',
            function()
                Snacks.picker.gh_pr({ state = 'all' })
            end,
            desc = 'gitHub Pull Requests (all)',
        },
        -- rep
        {
            '<leader>sB',
            function()
                Snacks.picker.lines()
            end,
            desc = 'buffer Lines',
        },
        -- {
        --     '<leader>sB',
        --     function()
        --         Snacks.picker.grep_buffers()
        --     end,
        --     desc = 'grep Open Buffers',
        -- },
        {
            '<leader>sl',
            function()
                Snacks.picker.grep()
            end,
            desc = 'live grep',
        },
        {
            '<leader>sw',
            function()
                Snacks.picker.grep_word()
            end,
            desc = 'Visual selection or word',
            mode = { 'n', 'x' },
        },
        -- search
        {
            '<leader>s"',
            function()
                Snacks.picker.registers()
            end,
            desc = 'Registers',
        },
        {
            '<leader>s/',
            function()
                Snacks.picker.search_history()
            end,
            desc = 'Search History',
        },
        {
            '<leader>sa',
            function()
                Snacks.picker.autocmds()
            end,
            desc = 'Autocmds',
        },
        {
            '<leader>sb',
            function()
                Snacks.picker.lines()
            end,
            desc = 'Buffer Lines',
        },
        {
            '<leader>sc',
            function()
                Snacks.picker.command_history()
            end,
            desc = 'Command History',
        },
        {
            '<leader>sC',
            function()
                Snacks.picker.commands()
            end,
            desc = 'Commands',
        },
        {
            '<leader>sd',
            function()
                Snacks.picker.diagnostics()
            end,
            desc = 'Diagnostics',
        },
        {
            '<leader>sD',
            function()
                Snacks.picker.diagnostics_buffer()
            end,
            desc = 'Buffer Diagnostics',
        },
        {
            '<leader>sh',
            function()
                Snacks.picker.help()
            end,
            desc = 'Help Pages',
        },
        {
            '<leader>sH',
            function()
                Snacks.picker.highlights()
            end,
            desc = 'Highlights',
        },
        {
            '<leader>si',
            function()
                Snacks.picker.icons()
            end,
            desc = 'Icons',
        },
        {
            '<leader>sj',
            function()
                Snacks.picker.jumps()
            end,
            desc = 'Jumps',
        },
        {
            '<leader>sk',
            function()
                Snacks.picker.keymaps()
            end,
            desc = 'Keymaps',
        },
        {
            '<leader>sl',
            function()
                Snacks.picker.loclist()
            end,
            desc = 'Location List',
        },
        {
            '<leader>sm',
            function()
                Snacks.picker.marks()
            end,
            desc = 'Marks',
        },
        {
            '<leader>sM',
            function()
                Snacks.picker.man()
            end,
            desc = 'Man Pages',
        },
        {
            '<leader>sp',
            function()
                Snacks.picker.lazy()
            end,
            desc = 'Search for Plugin Spec',
        },
        {
            '<leader>sq',
            function()
                Snacks.picker.qflist()
            end,
            desc = 'Quickfix List',
        },
        {
            '<leader>sR',
            function()
                Snacks.picker.resume()
            end,
            desc = 'Resume',
        },
        {
            '<leader>su',
            function()
                Snacks.picker.undo()
            end,
            desc = 'Undo History',
        },
        {
            '<leader>uC',
            function()
                Snacks.picker.colorschemes()
            end,
            desc = 'Colorschemes',
        },
        -- LSP
        {
            'gd',
            function()
                Snacks.picker.lsp_definitions()
            end,
            desc = 'Goto Definition',
        },
        {
            'gD',
            function()
                Snacks.picker.lsp_declarations()
            end,
            desc = 'Goto Declaration',
        },
        {
            'gr',
            function()
                Snacks.picker.lsp_references()
            end,
            nowait = true,
            desc = 'References',
        },
        {
            'gI',
            function()
                Snacks.picker.lsp_implementations()
            end,
            desc = 'Goto Implementation',
        },
        {
            'gy',
            function()
                Snacks.picker.lsp_type_definitions()
            end,
            desc = 'Goto T[y]pe Definition',
        },
        {
            'gai',
            function()
                Snacks.picker.lsp_incoming_calls()
            end,
            desc = 'C[a]lls Incoming',
        },
        {
            'gao',
            function()
                Snacks.picker.lsp_outgoing_calls()
            end,
            desc = 'C[a]lls Outgoing',
        },
        {
            '<leader>ss',
            function()
                Snacks.picker.lsp_symbols()
            end,
            desc = 'LSP Symbols',
        },
        {
            '<leader>sS',
            function()
                Snacks.picker.lsp_workspace_symbols()
            end,
            desc = 'LSP Workspace Symbols',
        },
    },
}
