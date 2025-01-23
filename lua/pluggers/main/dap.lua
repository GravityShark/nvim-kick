return {
    'mfussenegger/nvim-dap',
    dependencies = {
        {
            'rcarriga/nvim-dap-ui',
            dependencies = { 'nvim-neotest/nvim-nio' },
            -- stylua: ignore
            keys = {
                { "<leader>du", function() require("dapui").toggle({ }) end, desc = "Dap UI" },
                { "<leader>de", function() require("dapui").eval() end, desc = "Eval", mode = {"n", "v"} },
            },
            opts = {},
            config = function(_, opts)
                local dap = require('dap')
                local dapui = require('dapui')
                dapui.setup(opts)
                dap.listeners.after.event_initialized['dapui_config'] = function()
                    dapui.open({})
                end
                dap.listeners.before.event_terminated['dapui_config'] = function()
                    dapui.close({})
                end
                dap.listeners.before.event_exited['dapui_config'] = function()
                    dapui.close({})
                end
            end,
        },
        -- virtual text for the debugger
        {
            'theHamsta/nvim-dap-virtual-text',
            opts = {},
        },
    },

    config = function()
        local dap = require('dap')
        dap.adapters.lldb = {
            type = 'executable',
            command = vim.fn.expand('/home/gravity/.nix-profile/bin/lldb-dap'),
            name = 'lldb',
        }
        dap.configurations.c = {
            {
                name = 'Launch',
                type = 'lldb',
                request = 'launch',
                program = function()
                    return vim.fn.input(
                        'Path to executable: ',
                        vim.fn.getcwd() .. '/',
                        'file'
                    )
                end,
                cwd = '${workspaceFolder}',
                stopOnEntry = false,
                args = {},

                -- 💀
                -- if you change `runInTerminal` to true, you might need to change the yama/ptrace_scope setting:
                --
                --    echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope
                --
                -- Otherwise you might get the following error:
                --
                --    Error on launch: Failed to attach to the target process
                --
                -- But you should be aware of the implications:
                -- https://www.kernel.org/doc/html/latest/admin-guide/LSM/Yama.html
                -- runInTerminal = false,
            },
        }
    end,
} -- TODO: add nvim-dap https://www.lazyvim.org/extras/dap/core
