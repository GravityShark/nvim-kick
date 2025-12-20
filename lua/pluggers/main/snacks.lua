return {
    'folke/snacks.nvim',
    priority = 1000,
    lazy = false,
    opts = {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
        bigfile = { enabled = true },
        bufdelete = { enabled = true },
        image = { enabled = true },
        quickfile = { enabled = true },
        rename = { enabled = true },
    },
    keys = {
        {
            '<leader>b',
            function()
                require('snacks').bufdelete.delete()
            end,
            desc = 'zen mode',
        },
    },
    init = function()
        vim.api.nvim_create_autocmd('User', {
            pattern = 'OilActionsPost',
            callback = function(event)
                if event.data.actions[1].type == 'move' then
                    Snacks.rename.on_rename_file(
                        event.data.actions[1].src_url,
                        event.data.actions[1].dest_url
                    )
                end
            end,
        })
    end,
}
