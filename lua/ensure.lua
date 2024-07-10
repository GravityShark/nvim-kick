-- A single file listing Treesitter, LSP, Mason, Formatting and Linting specs.
M = {}

M.treesitter = {
    'go', -- Go
    'gomod',
    'gosum',
    'templ',
    'html', -- Webdev
    'css',
    'javascript',
    'python', -- Other Languages
    'bash',
    'sql',
    'lua',
    'c',
    'json', -- Data/Config Formats
    'yaml',
    'toml',
    'markdown', -- Markup
    'markdown_inline',
    'vim', -- Other
    'vimdoc',
    'diff',
    'gitcommit',
}
M.mason = {
    'lua-language-server', -- Lua
    'stylua',
    'gopls', -- Go
    'golangci-lint',
    'gofumpt',
    'golines',
    'goimports-reviser',
    'html-lsp', -- HTML
    'prettierd',
    'emmet-language-server',
    'tailwindcss-language-server', -- CSS
    'typescript-language-server', -- Javascript
    'quick-lint-js',
    'clangd', -- C
    'clang-format',
    'pyright', -- Python
    'ruff',
    'shfmt', -- Shell
    'json-lsp', -- JSON
}
M.lsp = { -- :h lspconfig-all
    lua_ls = {
        settings = {
            Lua = {
                completion = { autoRequire = true, callSnippet = 'Replace' },
                workspace = { checkThirdParty = false },
            },
        },
    },
    gopls = {
        settings = {
            gopls = {
                completeUnimported = true,
                usePlaceholders = true,
                analyses = { unusedparams = true },
            },
        },
    },
    html = {}, -- Webdev
    emmet_language_server = {},
    tailwindcss = {},
    tsserver = {},
    clangd = {},
    pyright = {},
    jsonls = {},
}
M.format = {
    lua = { 'stylua' },
    css = { 'prettierd' },
    html = { 'prettierd' },
    json = { 'prettierd' },
    javascript = { 'prettierd' },
    markdown = { 'prettierd' },
    yaml = { 'prettierd' },
    c = { 'clang-format' },
    cpp = { 'clang-format' },
    go = { 'gofumpt', 'golines', 'goimports-reviser' },
    python = { 'ruff_format' },
    sh = { 'shfmt' },
    bash = { 'shfmt' },
}
M.formatextra = {
    python = {
        prepend_args = { '--config', '~/.ruff.toml' },
    },
}
M.lint = {
    python = { 'ruff' },
    javascript = { 'quick-lint-js' },
    go = { 'golangcilint' },
}

return M
