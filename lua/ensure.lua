M = {}

M.treesitter = {
    'lua',
    'python',
    'c',
    'cpp',
    'javascript',
    'typescript',
    'tsx',
    'css',
    'vim',
    'vimdoc',
    'bash',
    'sql',
    'json',
    'markdown',
    'gitcommit',
    'org',
    'rust',
    'go',
}

if not vim.g.is_termux then
    M.mason = {
        pylsp = {},
        tsserver = {},
        html = { filetypes = { 'html', 'twig', 'hbs' } },
        tailwindcss = {},
        gopls = {},

        rust_analyzer = {},
        clangd = {},
        lua_ls = {
            Lua = {
                workspace = { checkThirdParty = false },
                telemetry = { enable = false },
            },
        },
    }
else
    M.mason = {
        pylsp = {},
        tsserver = {},
        html = { filetypes = { 'html', 'twig', 'hbs' } },
        tailwindcss = {},
        gopls = {},
    }
end

return M
