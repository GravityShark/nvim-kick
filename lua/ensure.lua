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
    'gdscript',
    'html',
    'htmldjango',
    -- 'rust',
    -- 'go',
} -- }}}

-- Mason ensure_installed{{{
-- if not vim.g.is_termux then
M.servers = {
    pyright = {},
    tsserver = {},
    html = { filetypes = { 'html', 'htmldjango' } },
    cssls = {},
    clangd = {},
    lua_ls = {
        Lua = {
            workspace = { checkThirdParty = false },
            telemetry = { enable = false },
        },
    },
    gdscript = {},
    -- pylsp = {},
    -- gopls = {},
    -- rust_analyzer = {},
}

M.mason = {
    -- pylsp,
    -- gopls,
    -- rust_analyzer,
    'pyright',
    'typescript-language-server',
    'html-lsp',
    'css-lsp',
    'clangd',
    'lua-language-server',
    'clang-format',
    'blue',
    'gdtoolkit',
    'prettier',
    'stylua',
}
-- else -- Termux
--     M.servers = {
--         pylsp = {},
--         tsserver = {},
--         html = { filetypes = { 'html', 'htmldjango' } },
--         cssls = {},
--         -- tailwindcss = { filetypes = { 'html', 'css', 'htmldjango' } },
--         -- gopls = {},
--     }
-- end -- }}}

-- none-ls sources{{{
function M.null()
    local null_ls = require('null-ls')

    local formatting = null_ls.builtins.formatting
    local lint = null_ls.builtins.diagnostics

    return {
        lint.gdlint,
    }
end -- }}}

return M
