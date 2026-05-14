return {
    'obsidian-nvim/obsidian.nvim',
    ft = 'markdown',
    cmd = 'Obsidian',
    keys = {
        -- https://github.com/obsidian-nvim/obsidian.nvim?tab=readme-ov-file#commands
        -- other commands
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
            '<leader>oF',
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
        -- https://github.com/HakonHarnes/img-clip.nvim
        -- https://github.com/Thiago4532/mdmath.nvim
        -- https://github.com/artempyanykh/marksman
        -- https://github.com/Myzel394/easytables.nvim
    },
    opts = {
        attachments = { folder = '/assets/attachments' },
        checkbox = { order = { ' ', 'x' } },
        daily_notes = { folder = '/0-inbox' },
        frontmatter = { enabled = false },
        legacy_commands = false, -- this will be removed in the next major release
        new_notes_location = 'notes_subdir',
        note_id_func = function(id)
            return id
        end,
        notes_subdir = '/0-inbox',
        templates = { folder = '/assets/templates' },
        ui = { enable = false },
        workspaces = {
            {
                name = 'Notes',
                path = '~/Notes',
                new_notes_location = '/0-inbox',
            },
        },
    },
}
