return {
    '3rd/image.nvim',
    build = false, -- so that it doesn't build the rock https://github.com/3rd/image.nvim/issues/91#issuecomment-2453430239
    event = 'VeryLazy',
    opts = {
        processor = 'magick_cli',
        window_overlap_clear_enabled = true, -- toggles images when windows are overlapped
        window_overlap_clear_ft_ignore = {
            'cmp_menu',
            'cmp_docs',
            'snacks_notif',
            'scrollview',
            'scrollview_sign',
            'TelescopePrompt',
        },
        editor_only_render_when_focused = true, -- auto show/hide images when the editor gains/looses focus
        tmux_show_only_in_active_window = true, -- auto show/hide images in the correct Tmux window (needs visual-activity off)
    },
    hijack_file_patterns = {
        '*.png',
        '*.jpg',
        '*.jpeg',
        '*.gif',
        '*.bmp',
        '*.heic',
        '*.xpm',
        '*.ico',
        '*.svg',
        '*.webp',
        '*.avif',
        '*.pdf',
    },
}
