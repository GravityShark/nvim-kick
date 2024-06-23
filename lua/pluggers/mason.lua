return {
    -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',
    event = { 'BufReadPost', 'BufWritePre', 'BufNewFile' },
    config = function()
        require('pluggers.lspconfig')
    end,
    dependencies = {
        -- Easy installation of LSPs and more
        {
            'WhoIsSethDaniel/mason-tool-installer.nvim',
            cmd = { 'MasonToolsUpdate', 'MasonToolsInstall' },
            dependencies = {
                { 'williamboman/mason.nvim', cmd = 'Mason', config = true },
            },
        },
    },
}
