return {
    'stevearc/oil.nvim',
    cmd = 'Oil',
    lazy = false,
    keys = {
        { '<leader>.', '<CMD>Oil --float<CR>', desc = 'float file manager' },
        { '<leader>-', '<CMD>Oil<CR>', desc = 'file manager' },
    },
    init = function()
        local augroup =
            vim.api.nvim_create_augroup('OilOpenPreview', { clear = true })
        local is_previewing = false
        -- Autocommand for trigering preview when entering neovim with `nvim .`
        vim.api.nvim_create_autocmd('User', {
            pattern = 'OilEnter',
            group = augroup,
            callback = function()
                if is_previewing then
                    return
                end
                is_previewing = true
                require('oil').open_preview()
            end,
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
                window_overlap_clear_enabled = false, -- toggles images when windows are overlapped
                window_overlap_clear_ft_ignore = {
                    'cmp_menu',
                    'cmp_docs',
                    'snacks_notif',
                    'scrollview',
                    'scrollview_sign',
                    'TelescopePrompt',
                },
                editor_only_render_when_focused = false, -- auto show/hide images when the editor gains/looses focus
                tmux_show_only_in_active_window = false, -- auto show/hide images in the correct Tmux window (needs visual-activity off)
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
