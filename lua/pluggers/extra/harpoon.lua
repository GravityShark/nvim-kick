return {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    opts = { settings = { save_on_toggle = true } },
    keys = function()
        local keys = {
            { '<leader>h', '', desc = '+harpoon' },
            {
                '<leader>ha',
                function()
                    require('harpoon'):list():add()
                end,
                desc = 'add file',
            },
            {
                '<leader>hm',
                function()
                    local harpoon = require('harpoon')
                    harpoon.ui:toggle_quick_menu(harpoon:list())
                end,
                desc = 'menu',
            },
        }
        for i = 1, 9 do
            table.insert(keys, {
                '<C-' .. i .. '>',
                function()
                    require('harpoon'):list():select(i)
                end,
                desc = 'Harpoon to File ' .. i,
            })
        end
        return keys
    end,
}
