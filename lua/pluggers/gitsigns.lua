return {
    signs = {
        add = {
            hl = 'gitsignsadd',
            text = '▎',
            numhl = 'gitsignsaddnr',
            linehl = 'gitsignsaddln',
        },
        change = {
            hl = 'gitsignschange',
            text = '▎',
            numhl = 'gitsignschangenr',
            linehl = 'gitsignschangeln',
        },
        delete = {
            hl = 'gitsignsdelete',
            text = '󰐊',
            numhl = 'gitsignsdeletenr',
            linehl = 'gitsignsdeleteln',
        },
        topdelete = {
            hl = 'gitsignsdelete',
            text = '󰐊',
            numhl = 'gitsignsdeletenr',
            linehl = 'gitsignsdeleteln',
        },
        changedelete = {
            hl = 'gitsignschange',
            text = '▎',
            numhl = 'gitsignschangenr',
            linehl = 'gitsignschangeln',
        },
    },
    on_attach = function(bufnr)
        vim.keymap.set(
            'n',
            '<leader>gh',
            require('gitsigns').preview_hunk,
            { buffer = bufnr, desc = 'Preview git [h]unk' }
        )
        vim.keymap.set(
            'n',
            '<leader>gl',
            require('gitsigns').toggle_current_line_blame,
            { buffer = bufnr, desc = 'Git [l]ine blame' }
        )

        -- don't override the built-in and fugitive keymaps
        -- local gs = package.loaded.gitsigns
        -- vim.keymap.set({ 'n', 'v' }, ']c', function()
        -- 	if vim.wo.diff then
        -- 		return ']c'
        -- 	end
        -- 	vim.schedule(function()
        -- 		gs.next_hunk()
        -- 	end)
        -- 	return '<Ignore>'
        -- end, { expr = true, buffer = bufnr, desc = 'Jump to next hunk' })
        -- vim.keymap.set({ 'n', 'v' }, '[c', function()
        -- 	if vim.wo.diff then
        -- 		return '[c'
        -- 	end
        -- 	vim.schedule(function()
        -- 		gs.prev_hunk()
        -- 	end)
        -- 	return '<Ignore>'
        -- end, {
        -- 	expr = true,
        -- 	buffer = bufnr,
        -- 	desc = 'Jump to previous hunk',
        -- })
    end,
}
