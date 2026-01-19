local visualler = function(impl)
    -- https://github.com/asdf8601/kickstart.nvim/blob/687d4da63f4befcdd3c6c1e1e0f375b449984f18/lua/kickstart/plugins/oil-file-manager.lua#L1-L41
    -- Open cmdline with visually selected entries as argument
    -- : <file1> <file2> <file..>
    local oil = require('oil')
    local mode = string.lower(vim.api.nvim_get_mode().mode)
    local bufnr = vim.api.nvim_get_current_buf()
    local name
    local cwd = oil.get_current_dir()
    local items = {}

    if mode == 'n' then
        local lnum = vim.fn.getpos('.')[2]
        name = oil.get_entry_on_line(bufnr, lnum).name
        table.insert(items, cwd .. name)
    elseif mode == 'v' then
        local start = vim.fn.getpos('v')
        local end_ = vim.fn.getpos('.')
        local lnum0 = start[2]
        local lnum1 = end_[2]
        print(lnum0, lnum1)
        for lnum = lnum0, lnum1 do
            _ = oil.get_entry_on_line(bufnr, lnum)
            name = oil.get_entry_on_line(bufnr, lnum).name
            table.insert(items, cwd .. name)
        end
    end
    impl(items, mode)
end

local function open_cmdline_with_path(paths, m)
    local rm = ''
    local args = ''
    for _, path in ipairs(paths) do
        args = args .. ' ' .. vim.fn.fnameescape(path)
    end
    if m == 'v' then
        rm = '<Del><Del><Del><Del><Del>'
    end
    local escaped = vim.api.nvim_replace_termcodes(
        ':! ' .. args .. '<Home>' .. rm .. '<Right>',
        true,
        false,
        true
    )
    vim.api.nvim_feedkeys(escaped, m, true)
end

local function open_file_with_path(paths, _)
    for _, path in ipairs(paths) do
        vim.ui.open(path)
    end
end

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
            'benomahony/oil-git.nvim',
            init = function()
                vim.cmd('hi! link OilGitAdded GreenSign')
                vim.cmd('hi! link OilGitModified BlueSign')
                vim.cmd('hi! link OilGitRenamed PurpleSign')
                vim.cmd('hi! link OilGitUntracked GreenSign')
                vim.cmd('hi! link OilGitIgnored Grey')
            end,
        },
    },

    opts = {
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
            ['<S-CR>'] = { 'actions.open_external', mode = 'n' },
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
                visualler(open_cmdline_with_path),
                desc = 'Open selected item on cmdline',
            },
            ['gX'] = {
                visualler(open_file_with_path),
                desc = 'Open selected item on external program',
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
    },
}
