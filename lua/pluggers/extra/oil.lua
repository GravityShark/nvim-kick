return {
    'stevearc/oil.nvim',
    cmd = 'Oil',
    keys = {
        { '<leader>.', '<CMD>Oil --float<CR>', desc = 'file manager' },
    },
    dependencies = {
        { 'nvim-mini/mini.icons', opts = {} },
        { 'JezerM/oil-lsp-diagnostics.nvim', opts = {} },
        { 'JezerM/oil-lsp-diagnostics.nvim', opts = {} },
        {
            '3rd/image.nvim',
            build = false, -- so that it doesn't build the rock https://github.com/3rd/image.nvim/issues/91#issuecomment-2453430239
            opts = {
                processor = 'magick_cli',
            },
        },
    },
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
        skip_confirm_for_simple_edits = true,
        lsp_file_methods = { autosave_changes = true },
        watch_for_changes = true,
        keymaps = {
            ['<leader>.'] = { 'actions.close', mode = 'n' },
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
        },
        float = { border = 'rounded' },
    },
}
