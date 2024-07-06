return { -- Linting
    'mfussenegger/nvim-lint',
    event = { 'BufReadPost', 'BufNewFile', 'BufWritePre' }, -- LazyFile
    config = function()
        local lint = require('lint')
        lint.linters_by_ft = require('ensure').lint
        -- Create autocommand which carries out the actual linting
        -- on the specified events.
        local lint_augroup =
            vim.api.nvim_create_augroup('lint', { clear = true })
        vim.api.nvim_create_autocmd(
            { 'BufEnter', 'BufWritePost', 'TextChanged' },
            {
                group = lint_augroup,
                callback = function()
                    require('lint').try_lint()
                end,
            }
        )
    end,
}
