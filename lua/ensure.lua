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
    'sql',
    'json',
    'markdown',
    'gitcommit',
    'org',
    'gdscript',
    'html',
    'htmldjango',
    'diff',
    -- 'rust',
    'go',
} -- }}}

-- Mason ensure_installed{{{
M.servers = {
    pyright = {},
    tsserver = {},
    html = { filetypes = { 'html', 'htmldjango' } },
    emmet_language_server = {
        filetypes = {
            'css',
            'eruby',
            'html',
            'htmldjango',
            'javascript',
            'javascriptreact',
            'less',
            'sass',
            'scss',
            'pug',
            'typescriptreact',
        },
    },
    cssls = {},
    tailwindcss = {},
    clangd = {},
    lua_ls = {
        Lua = {
            workspace = { checkThirdParty = false },
            telemetry = { enable = false },
        },
    },
    gdscript = {},
    gopls = {},
    htmx = {},
    -- rust_analyzer = {},
}

M.mason = {
    -- 'rust_analyzer',
    -- pylsp,
    'pyright',
    'gopls',
    'typescript-language-server',
    'html-lsp',
    'htmx-lsp',
    'css-lsp',
    'tailwindcss-language-server',
    'clangd',
    'lua-language-server',
    'clang-format',
    'ruff',
    'gdtoolkit',
    'prettier',
    'stylua',
    'emmet-language-server',
    'beautysh',
}

-- none-ls sources{{{
function M.null()
    local null_ls = require('null-ls')

    -- local formatting = null_ls.builtins.formatting
    local lint = null_ls.builtins.diagnostics

    return {
        lint.gdlint,
    }
end -- }}}

return M
