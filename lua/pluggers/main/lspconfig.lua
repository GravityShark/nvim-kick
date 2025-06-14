return { -- Default LSP Configurations
    'neovim/nvim-lspconfig',
    event = { 'BufReadPost', 'BufNewFile', 'BufWritePre' },
    config = function()
        -- Server setup
        for name, opts in pairs(require('ensure').lsp) do
            vim.lsp.enable(name)
            vim.lsp.config(name, opts)
        end
    end,
}
