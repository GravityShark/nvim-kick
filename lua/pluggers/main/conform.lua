return { -- conform.nvim Press <leader>o to format your current buffer
    'stevearc/conform.nvim',
    event = 'BufWritePre',
    cmd = { 'ConformInfo' },
    keys = {
        {
            '<leader>o',
            function()
                require('conform').format({ async = true, lsp_fallback = true })
            end,
            desc = 'rganize buffer',
        },
    },
    opts = { formatters_by_ft = require('ensure').format },
}
