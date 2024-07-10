return { -- which-key.nvim Keymap hints for the slow
    'folke/which-key.nvim',
    event = 'VeryLazy',
    init = function()
        vim.opt.updatetime = 50
        vim.opt.timeoutlen = 0
        vim.opt.timeout = true
    end,
    opts = function()
        require('which-key').register({
            f = { name = 'ind...' },
            s = { name = 'ession...' },
            R = {
                name = 'un...',
                g = {
                    name = 'run cc...',
                },
            },
            g = {
                name = 'it...',
                a = {
                    name = 'dd...',
                },
                h = { name = 'unk' },
                t = { name = 'oggle' },
            },
            b = { name = 'deug...' },
            l = { name = 'sp...' },
        }, { prefix = '<leader>' })
        return {
            window = {
                border = 'single', -- none, single, double, shadow
                position = 'bottom', -- bottom, top
                margin = { 0, 0, 0, 0.5 }, -- extra window margin [top, right, bottom, left]. When between 0 and 1, will be treated as a percentage of the screen size.
                padding = { 0, 0, 0, 0 }, -- extra window padding [top, right, bottom, left]
                zindex = 1000, -- positive value to position WhichKey above other floating windows.
            },
            layout = {
                spacing = 1, -- spacing between columns
                align = 'center', -- align columns left, center or right
            },

            icons = {
                breadcrumb = '➜', -- symbol used in the command line area that shows your active key combo
                separator = '', -- symbol used between a key and it's label
                group = '', -- symbol prepended to a group
            },
        }
    end,
}
