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
            desc = 'daily',
        },
    },
    opts = {
        daily_notes = { folder = '/0-inbox' },
        -- new_notes_location = 'Valuts/0-inbox',
        notes_subdir = '/0-inbox',
        new_notes_location = 'notes_subdir',
        note_id_func = function(id)
            return id
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
