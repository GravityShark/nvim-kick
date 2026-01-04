return {
    'obsidian-nvim/obsidian.nvim',
    ft = 'markdown',
    keys = {
        {
            '<leader>o',
            '',
            desc = '+obsidian',
        },
        {
            '<leader>od',
            '<CMD>Obsidian dailies<CR>',
            desc = 'daily picker',
        },
        {
            '<leader>on',
            '<CMD>Obsidian new<CR>',
            desc = 'new',
        },
        {
            '<leader>ot',
            '<CMD>Obsidian today<CR>',
            desc = 'today',
        },
        {
            '<leader>of',
            '<CMD>Obsidian quick_switch<CR>',
            desc = 'find notes',
        },
        {
            '<leader>of',
            '<CMD>Obsidian search<CR>',
            desc = 'Find text',
        },
        {
            '<leader>op',
            '<CMD>Obsidian paste_img<CR>',
            desc = 'paste image',
        },
        {
            '<leader>o/',
            '<CMD>Obsidian<CR>',
            desc = 'Obsidian',
        },
    },
    dependencies = {
        { 'bullets-vim/bullets.vim' },
        -- https://github.com/Myzel394/easytables.nvim
        -- https://github.com/HakonHarnes/img-clip.nvim
        -- https://github.com/Thiago4532/mdmath.nvim
        -- https://github.com/artempyanykh/marksman
        -- https://github.com/Myzel394/easytables.nvim
    },
    opts = {
        daily_notes = { folder = '/0-inbox' },
        legacy_commands = false, -- this will be removed in the next major release
        notes_subdir = '/0-inbox',
        new_notes_location = 'notes_subdir',
        note_id_func = function(id)
            return id and id or ''
        end,
        templates = { folder = '/templates' },
        workspaces = {
            {
                name = 'Notes',
                path = '~/Notes',
                new_notes_location = '/0-inbox',
            },
        },
    },
}
