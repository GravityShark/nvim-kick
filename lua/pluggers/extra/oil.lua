return {
    'stevearc/oil.nvim',
    cmd = 'Oil',
    lazy = false,
    keys = {
        { '<leader>.', '<CMD>Oil --float<CR>', desc = 'float file manager' },
        { '<leader>-', '<CMD>Oil<CR>', desc = 'file manager' },
    },
    init = function()
        vim.api.nvim_create_autocmd('User', {
            pattern = 'OilEnter',
            callback = vim.schedule_wrap(function(args)
                local oil = require('oil')
                if
                    vim.api.nvim_get_current_buf() == args.data.buf
                    and oil.get_cursor_entry()
                then
                    require('oil.actions').preview.callback()
                end
            end),
        })
    end,
    dependencies = {
        { 'nvim-mini/mini.icons', opts = {} },
        { 'JezerM/oil-lsp-diagnostics.nvim', opts = {} },
        { 'benomahony/oil-git.nvim', config = true },
        {
            '3rd/image.nvim',
            build = false, -- so that it doesn't build the rock https://github.com/3rd/image.nvim/issues/91#issuecomment-2453430239
            opts = {
                processor = 'magick_cli',
            },
        },
    },
    opts = {
        default_file_explorer = true,
        delete_to_trash = true,
        lsp_file_methods = { autosave_changes = true },
        watch_for_changes = true,
        sort = { { 'mtime', 'desc' } },
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
            [':'] = {
                'actions.open_cmdline',
                opts = {
                    shorten_path = true,
                    modify = ':h',
                },
            },
        },
        float = { border = 'rounded' },
    },
}
