return { -- Default LSP Configurations
    'neovim/nvim-lspconfig',
    event = { 'BufReadPost', 'BufNewFile', 'BufWritePre', 'VeryLazy' },
}
