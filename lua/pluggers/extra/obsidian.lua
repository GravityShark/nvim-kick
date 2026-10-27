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
            '<leader>ol',
            '<CMD>Obsidian links<CR>',
            desc = 'links',
        },
        {
            '<leader>ob',
            '<CMD>Obsidian backlinks<CR>',
            desc = 'backlinks',
        },
        {
            '<leader>ot',
            '<CMD>Obsidian toc<CR>',
            desc = 'table of contents',
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
        {
            '<leader>o?',
            '<CMD>Obsidian helpgrep<CR>',
            desc = 'Help',
        },
    },
    dependencies = {
        { 'antonk52/markdowny.nvim', opts = {} },
        { 'bullets-vim/bullets.nvim', opts = {} },
        { 'HakonHarnes/img-clip.nvim', opts = {} },
        { 'marcocofano/excalidraw.nvim', cmd = 'Excalidraw', opts = {} },
        { 'SCJangra/table-nvim', opts = {} },
        { 'techwizrd/render-latex.nvim', opts = {} },
        -- https://github.com/artempyanykh/marksman
        -- otter.nvim get LSP functionality in code blocks
        -- hamidi-dev/org-list.nvim orgmode-inspired, cycle through list states, make child parent checkboxes share states.
    },
    opts = {
        attachments = { folder = 'assets/attachments' },
        checkbox = { order = { ' ', 'x' } },
        daily_notes = { folder = '0-inbox' },
        frontmatter = { enabled = false },
        legacy_commands = false, -- this will be removed in the next major release
        new_notes_location = 'notes_subdir',
        note_id_func = function(id)
            return id
        end,
        notes_subdir = '0-inbox',
        picker = { name = 'snacks.picker' },
        -- templates = { folder = 'assets/templates' },
        -- ui = { enable = false },
        workspaces = {
            {
                name = 'Vault',
                path = '~/Notes/Vault',
            },
        },
    },
}
