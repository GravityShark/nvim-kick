return {
    'stevearc/oil.nvim',
    cmd = 'Oil',
    lazy = false,
    -- event = { 'VeryLazy', 'BufNewFile' },
    keys = {
        { '<leader>,', '<CMD>Oil --float<CR>', desc = 'floating file manager' },
    },
    dependencies = {
        { 'nvim-mini/mini.icons', opts = {} },
        { 'JezerM/oil-lsp-diagnostics.nvim', opts = {} },
        {
            'malewicz1337/oil-git.nvim',
            init = function()
                vim.cmd('hi! link OilGitAdded GreenSign')
                vim.cmd('hi! link OilGitModified BlueSign')
                vim.cmd('hi! link OilGitRenamed PurpleSign')
                vim.cmd('hi! link OilGitUntracked GreenSign')
                vim.cmd('hi! link OilGitIgnored Grey')
            end,
        },
    },

    config = function()
        local oil = require('oil')
        local fs = require('oil.fs')
        local get_oil_selection = function()
            -- https://github.com/asdf8601/kickstart.nvim/blob/687d4da63f4befcdd3c6c1e1e0f375b449984f18/lua/kickstart/plugins/oil-file-manager.lua#L1-L41
            -- https://github.com/stevearc/conform.nvim/blob/62d5accad8b29d6ba9b58d3dff90c43a55621c60/lua/conform/init.lua#L324-L353
            local mode = vim.api.nvim_get_mode().mode
            local bufnr = vim.api.nvim_get_current_buf()
            local start = vim.fn.getpos('v')
            local end_ = vim.fn.getpos('.')
            local start_row = start[2]
            local start_col = start[3]
            local end_row = end_[2]
            local end_col = end_[3]

            -- A user can start visual selection at the end and move backwards
            -- Normalize the range to start < end
            if start_row == end_row and end_col < start_col then
                end_col, start_col = start_col, end_col
            elseif end_row < start_row then
                start_row, end_row = end_row, start_row
                start_col, end_col = end_col, start_col
            end
            if mode == 'V' then
                start_col = 1
                local lines = vim.api.nvim_buf_get_lines(
                    bufnr,
                    end_row - 1,
                    end_row,
                    true
                )
                end_col = #lines[1]
            end

            local items = {}

            for lnum = start_row, end_row do
                table.insert(
                    items,
                    oil.get_current_dir()
                        .. oil.get_entry_on_line(bufnr, lnum).name
                )
            end

            return items
        end

        local function cd(dir)
            if dir then
                vim.cmd({ cmd = 'cd', args = { dir } })
                vim.notify(string.format('CWD: %s', dir), vim.log.levels.INFO)
            else
                vim.notify(
                    'Cannot :cd; not in a directory',
                    vim.log.levels.WARN
                )
            end
        end
        local function open_cmdline_with_path()
            -- Copied from oil.actions.cd
            local past_dir = vim.fn.getcwd()
            local cur_dir = oil.get_current_dir()
            cd(cur_dir)

            local args = ''
            local mode = vim.api.nvim_get_mode().mode
            local rm = ''
            if mode == 'v' or mode == 'V' then
                rm = '<Del><Del><Del><Del><Del>'
                for _, path in ipairs(get_oil_selection()) do
                    args = args
                        .. ' '
                        .. vim.fn.fnameescape(fs.shorten_path(path))
                end
            else
                args = ' '
                    .. vim.fn.fnameescape(
                        fs.shorten_path(
                            oil.get_current_dir() .. oil.get_cursor_entry().name
                        )
                    )
            end
            --
            -- -- local pre = "!" -- NOTE: Because noice.nvim currently doesn't allow for continuous output https://github.com/folke/noice.nvim/issues/1097
            local pre = 'vert te '

            local escaped = vim.api.nvim_replace_termcodes(
                ':' .. args .. '<Home>' .. rm .. pre,
                true,
                false,
                true
            )
            vim.api.nvim_feedkeys(escaped, mode, true)

            cd(past_dir)
        end

        local function open_external()
            local mode = vim.api.nvim_get_mode().mode
            if not (mode == 'v' or mode == 'V') then
                require('oil.actions').open_external.callback()
                return
            end

            for _, path in ipairs(get_oil_selection()) do
                vim.ui.open(path)
            end
            vim.api.nvim_input('<Esc>')
        end

        oil.setup({
            default_file_explorer = true,
            delete_to_trash = true,
            lsp_file_methods = { autosave_changes = true },
            watch_for_changes = true,
            view_options = {
                sort = {
                    { 'type', 'desc' },
                    { 'mtime', 'desc' },
                },
            },
            preview_win = { preview_method = 'scratch' },
            keymaps = {
                ['<ESC>'] = { 'actions.close', mode = 'n' },
                ['gp'] = { 'actions.preview', mode = 'n' },
                ['gd'] = {
                    desc = 'Toggle file detail view',
                    callback = function()
                        detail = not detail
                        if detail then
                            require('oil').set_columns({
                                'icon',
                                'permissions',
                                'size',
                                'mtime',
                            })
                        else
                            require('oil').set_columns({ 'icon' })
                        end
                    end,
                },
                ['g!'] = {
                    open_cmdline_with_path,
                    desc = 'Open selected item on cmdline',
                },
                ['gx'] = {
                    open_external,
                    desc = 'Open selected item on external program',
                },
                ['gt'] = {
                    -- 'actions.open_terminal',
                    desc = 'Open current working directory in a terminal',
                    callback = function()
                        vim.cmd('vsplit')

                        vim.cmd(
                            'lcd ' .. vim.fn.fnameescape(oil.get_current_dir())
                        )
                        vim.cmd('terminal $SHELL')
                        vim.wo.nu = false
                        vim.wo.rnu = false
                        vim.cmd('startinsert')
                    end,
                },
                ['g1'] = {
                    'actions.open_cmdline',
                    opts = {
                        shorten_path = true,
                        modify = ':h',
                    },
                    desc = 'Open the command line with the current directory as argument',
                },
            },
            float = { border = 'rounded' },
        })
    end,
}
