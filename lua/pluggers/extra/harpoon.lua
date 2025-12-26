return {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = {
        settings = { save_on_toggle = true },
        get_root_dir = function()
            local git_root = vim.fn.system('git rev-parse --show-toplevel 2>&1')

            if vim.v.shell_error == 0 then
                return git_root:gsub('\n$', '')
            end

            return vim.loop.cwd()
        end,
    },
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
                -- '<leader>' .. i,
                function()
                    require('harpoon'):list():select(i)
                end,
                desc = 'Harpoon to File ' .. i,
            })
        end
        return keys
    end,
}
