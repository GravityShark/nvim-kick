-- which-key.nvim Keymap hints
return {
    'folke/which-key.nvim',
    event = 'VeryLazy',
    init = function()
        -- Decrease update time
        -- vim.opt.updatetime = 250 -- 50
        vim.opt.updatetime = 50
        vim.opt.timeoutlen = 0
        vim.opt.timeout = true
    end,
    opts = function()
        require('which-key').register({
            f = { name = '[f]ind...' },
            s = { name = '[s]ession...' },
            R = {
                name = '[R]un...',
                g = {
                    name = 'run [g]cc...',
                },
            },
            g = {
                name = '[g]it...',
                a = {
                    name = 'Git [a]dd...',
                },
                h = { name = 'Git [h]unk' },
                t = { name = 'Git [t]oggle' },
            },
            b = { name = 'de[b]ug...' },
            l = { name = '[l]sp...' },
        }, { prefix = '<leader>' })
        require('which-key').register({
            a = '[a]lias',
            o = '[o]rigin',
            d = '[d]alies',
        }, { prefix = '<C-\\>' })
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
                separator = '»', -- symbol used between a key and it's label
                group = '+', -- symbol prepended to a group
            },
        }
    end,
}
