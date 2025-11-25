return {
    'stevearc/oil.nvim',
    cmd = 'Oil',
    keys = {
        { '<leader>.', '<CMD>Oil --float<CR>', desc = 'file manager' },
    },
    dependencies = { { 'nvim-mini/mini.icons', opts = {} } },
    event = {
        {
            { 'OilEnter' },
            callback = vim.schedule_wrap(function(args)
                local oil = require('oil')
                if
                    vim.api.nvim_get_current_buf() == args.data.buf
                    and oil.get_cursor_entry()
                then
                    oil.select({ preview = true })
                end
            end),
        },
    },
    opts = {
        default_file_explorer = true,
        delete_to_trash = true,
        columns = { 'icon', 'mtime' },
        skip_confirm_for_simple_edits = true,
        lsp_file_methods = { autosave_changes = true },
        watch_for_changes = true,
        keymaps = {
            ['<leader>.'] = { 'actions.close', mode = 'n' },
            ['<S-CR>'] = function()
                local oil = require('oil')
                local actions = require('oil.actions')

                local entry = oil.get_cursor_entry()
                if not entry then
                    return
                end

                local name = entry.name
                local path = oil.get_current_dir() .. name

                -- handle directories
                local fs = vim.loop.fs_stat(path)
                if fs and fs.type == 'directory' then
                    return oil.select({ vertical = false })
                end

                actions.open_external.callback()
            end,
        },
        float = { border = 'rounded' },
    },
}
