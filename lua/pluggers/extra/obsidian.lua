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
        new_notes_location = '/0-inbox',
        note_id_func = function(id)
            return id:gsub(' ', '_')
        end,
        templates = { folder = '/templates' },
        workspaces = {
            {
                name = 'Notes',
                path = '~/Notes',
            },
        },
    },
}
