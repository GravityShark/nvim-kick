-- Shows how to use the DAP plugin to debug your code.

return {
    'mfussenegger/nvim-dap',
    ft = { 'cpp', 'c', 'go' },
    dependencies = {
        -- Creates a beautiful debugger UI
        'rcarriga/nvim-dap-ui',

        -- Required dependency for nvim-dap-ui
        'nvim-neotest/nvim-nio',

        -- Installs the debug adapters for you
        'williamboman/mason.nvim',
        'jay-babu/mason-nvim-dap.nvim',

        -- Add your own debuggers here
        'leoluz/nvim-dap-go',
        -- 'mfussenegger/nvim-dap-python',
    },
    config = function()
        local dap = require('dap')
        local dapui = require('dapui')

        -- Basic debugging keymaps, feel free to change to your liking!
        ---@diagnostic disable-next-line: missing-fields
        require('mason-nvim-dap').setup({
            automatic_installation = true,
            handlers = {},
            ensure_installed = {
                'delve',
                'cppdbg',
            },
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
        require('dap-go').setup()
        -- require('dap-python').setup()
    end,
}
