M = {}

-- Treesitter ensure_installed{{{
M.treesitter = {
    'lua',
    'python',
    'c',
    'cpp',
    'javascript',
    -- 'typescript',
    -- 'tsx',
    'css',
    'vim',
    'vimdoc',
    'bash',
    -- 'sql',
    'json',
    'markdown',
    'gitcommit',
    'org',
    -- 'rust',
    -- 'go',
} -- }}}

-- Mason ensure_installed{{{
if not vim.g.is_termux then
    M.mason = {
        pyright = {},
        -- pylsp = {},
        tsserver = {},
        html = { filetypes = { 'html', 'htmldjango' } },
        cssls = {},
        -- gopls = {},

        -- rust_analyzer = {},
        clangd = {},
        lua_ls = {
            Lua = {
                workspace = { checkThirdParty = false },
                telemetry = { enable = false },
            },
        },
    }
else -- Termux
    M.mason = {
        pylsp = {},
        tsserver = {},
        html = { filetypes = { 'html', 'htmldjango' } },
        cssls = {},
        -- tailwindcss = { filetypes = { 'html', 'css', 'htmldjango' } },
        -- gopls = {},
    }
end -- }}}

-- none-ls sources{{{
function M.null()
    local null_ls = require('null-ls')

    local formatting = null_ls.builtins.formatting
    local lint = null_ls.builtins.diagnostics

    return {
        formatting.prettier,
        formatting.stylua,
        formatting.blue,
        -- lint.eslint_d,
        formatting.djlint,
        lint.djlint,
    }
end -- }}}

return M
