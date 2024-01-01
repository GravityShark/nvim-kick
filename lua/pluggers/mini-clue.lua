local miniclue = require('mini.clue')
miniclue.setup({
    triggers = {
        -- Leader triggers
        { mode = 'n', keys = '<Leader>' },
        { mode = 'x', keys = '<Leader>' },

        -- Built-in completion
        { mode = 'i', keys = '<C-x>' },

        -- `g` key
        { mode = 'n', keys = 'g' },
        { mode = 'x', keys = 'g' },

        -- Marks
        { mode = 'n', keys = "'" },
        { mode = 'n', keys = '`' },
        { mode = 'x', keys = "'" },
        { mode = 'x', keys = '`' },

        -- Registers
        { mode = 'n', keys = '"' },
        { mode = 'x', keys = '"' },
        { mode = 'i', keys = '<C-r>' },
        { mode = 'c', keys = '<C-r>' },

        -- Window commands
        { mode = 'n', keys = '<C-w>' },

        -- `z` key
        { mode = 'n', keys = 'z' },
        { mode = 'x', keys = 'z' },
    },

    clues = {
        -- Enhance this by adding descriptions for <Leader> mapping groups
        miniclue.gen_clues.builtin_completion(),
        miniclue.gen_clues.g(),
        miniclue.gen_clues.marks(),
        miniclue.gen_clues.registers(),
        miniclue.gen_clues.windows(),
        miniclue.gen_clues.z(),
        -- { mode = 'n', keys = '<Leader>a', desc = '[a]ppend to Harpoon' },
        -- { mode = 'n', keys = '<Leader>`', desc = '[`] Open Harpoon' },
        { mode = 'n', keys = '<Leader>f', desc = '+[f]ind' },
        { mode = 'n', keys = '<Leader>g', desc = '+[g]it' },
        { mode = 'n', keys = '<Leader>ga', desc = 'Git [a]dd' },
        { mode = 'n', keys = '<Leader>x', desc = '+[x] is Trouble' },
        { mode = 'n', keys = '<Leader>v', desc = '+[v]im LSP' },
        -- { mode = 'n', keys = '<Leader>vc', desc = 'Vim LSP [c]ode actions' },
        -- {
        --     mode = 'n',
        --     keys = '<Leader>vw',
        --     desc = 'Vim LSP [w]orkspace symbol',
        -- },
        -- { mode = 'n', keys = '<Leader>vd', desc = 'Vim LSP [d]iagnostics' },
        { mode = 'n', keys = '<Leader>vr', desc = 'Vim LSP +[r]' },
        -- { mode = 'n', keys = '<Leader>vrr', desc = 'Vim LSP refe[r]ences' },
        -- { mode = 'n', keys = '<Leader>vrn', desc = 'Vim LSP re[n]ame' },
        -- { mode = 'n', keys = '<Leader>o', desc = '+[o]rg' },
    },
    window = {
        -- Floating window config
        config = {
            width = 'auto',
            border = 'rounded',
        },

        -- Delay before showing clue window
        delay = 250,

        -- Keys to scroll inside the clue window
        scroll_down = '<C-d>',
        scroll_up = '<C-u>',
    },
})
