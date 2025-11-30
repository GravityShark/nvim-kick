return {
    'stevearc/oil.nvim',
    cmd = 'Oil',
    lazy = false,
    keys = {
        { '<leader>.', '<CMD>Oil --float<CR>', desc = 'float file manager' },
        { '<leader>-', '<CMD>Oil<CR>', desc = 'file manager' },
    },
    dependencies = {
        { 'nvim-mini/mini.icons', opts = {} },
        { 'JezerM/oil-lsp-diagnostics.nvim', opts = {} },
        { 'benomahony/oil-git.nvim', config = true },
        -- {
        --     '3rd/image.nvim',
        --     build = false, -- so that it doesn't build the rock https://github.com/3rd/image.nvim/issues/91#issuecomment-2453430239
        --     opts = {
        --         processor = 'magick_cli',
        --         window_overlap_clear_enabled = true, -- toggles images when windows are overlapped
        --         window_overlap_clear_ft_ignore = {
        --             'cmp_menu',
        --             'cmp_docs',
        --             'snacks_notif',
        --             'scrollview',
        --             'scrollview_sign',
        --             'TelescopePrompt',
        --         },
        --         editor_only_render_when_focused = true, -- auto show/hide images when the editor gains/looses focus
        --         tmux_show_only_in_active_window = true, -- auto show/hide images in the correct Tmux window (needs visual-activity off)
        --     },
        -- },
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
        keymaps = {
            ['<leader>.'] = { 'actions.close', mode = 'n' },
            ['<S-CR>'] = { 'actions.open_external', mode = 'n' },
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
            ["'"] = {
                'actions.open_cmdline',
                opts = {
                    shorten_path = true,
                    -- modify = ':h',
                },
            },
            ['"'] = {
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
