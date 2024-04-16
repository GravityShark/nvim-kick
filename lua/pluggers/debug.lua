-- Shows how to use the DAP plugin to debug your code.

return {
    'mfussenegger/nvim-dap',
    -- event = { 'BufReadPost', 'BufWritePost', 'BufNewFile' },
    ft = { 'cpp', 'c' },
    dependencies = {
        -- Creates a beautiful debugger UI
        {
            'rcarriga/nvim-dap-ui',
            dependencies = { 'mfussenegger/nvim-dap', 'nvim-neotest/nvim-nio' },
        },

        -- Installs the debug adapters for you
        {
            'jay-babu/mason-nvim-dap.nvim',
            dependencies = {
                'williamboman/mason.nvim',
                'mfussenegger/nvim-dap',
            },
        },

        -- Add your own debuggers here
        -- 'mfussenegger/nvim-dap-python',
        -- 'leoluz/nvim-dap-go',
    },
    config = function()
        local dap = require('dap')
        local dapui = require('dapui')

        -- Basic debugging keymaps, feel free to change to your liking!
        require('mason-nvim-dap').setup({
            automatic_setup = true,
            -- see mason-nvim-dap README for more information
            handlers = {},
            ensure_installed = require('ensure').mason_dap,
        })

        vim.keymap.set('n', '<leader>bs', function()
            local widgets = require('dap.ui.widgets')
            local sidebar = widgets.sidebar(widgets.scopes)
            sidebar.open()
        end, { desc = 'Debug: Start/Continue' })

        vim.keymap.set(
            'n',
            '<F5>',
            dap.continue,
            { desc = 'Debug: Start/Continue' }
        )
        vim.keymap.set(
            'n',
            '<F1>',
            dap.step_into,
            { desc = 'Debug: Step Into' }
        )
        vim.keymap.set('n', '<F4>', dap.step_out, { desc = 'Debug: Step Into' })
        vim.keymap.set(
            'n',
            '<F2>',
            dap.step_over,
            { desc = 'Debug: Step Over' }
        )
        vim.keymap.set('n', '<F3>', dap.step_out, { desc = 'Debug: Step Out' })
        vim.keymap.set(
            'n',
            '<leader>bp',
            dap.toggle_breakpoint,
            { desc = 'Debug: Add breakpoint' }
        )
        vim.keymap.set('n', '<leader>bP', function()
            dap.set_breakpoint(vim.fn.input('Breakpoint condition: '))
        end, { desc = 'Debug: Set Breakpoint' })

        -- Dap UI setup
        dapui.setup()

        dap.listeners.after.event_initialized['dapui_config'] = dapui.open
        dap.listeners.before.event_terminated['dapui_config'] = dapui.close
        dap.listeners.before.event_exited['dapui_config'] = dapui.close

        vim.keymap.set(
            'n',
            '<F7>',
            dapui.toggle,
            { desc = 'Debug: See last session result.' }
        )

        -- Install golang specific config
        -- require('dap-go').setup()
        -- require('dap-python').setup()
    end,
}
