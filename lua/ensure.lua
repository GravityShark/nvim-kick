M = {}

M.treesitter = { -- {{{
    'lua',
    'python',
    'c',
    'cpp',
    'html',
    'htmldjango',
    'css',
    'javascript',
    'typescript',
    'tsx',
    'vim',
    'vimdoc',
    'bash',
    'sql',
    'json',
    'yaml',
    'markdown',
    'markdown_inline',
    'query',
    'regex',
    'toml',
    'gitcommit',
    'org',
    'diff',
    'go',
    -- 'gdscript',
    -- 'rust',
} -- }}}

M.servers = { -- {{{
    pyright = {},

    gopls = {
        gopls = { usePlaceholders = true, analyses = { unusedparams = true } },
    },

    html = {},
    emmet_language_server = {},
    cssls = {},
    tailwindcss = {},
    tsserver = {},
    -- htmx = {},

    clangd = {},

    lua_ls = {
        Lua = {
            completion = { autoRequire = true, callSnippet = 'Replace' },
            workspace = { checkThirdParty = false },
            telemetry = { enable = false },
        },
    },
}

M.mason = {
    'ruff',
    'pyright',

    'gopls',
    'golangci-lint',

    'html-lsp',
    'emmet-language-server',
    'css-lsp',
    'tailwindcss-language-server',
    'typescript-language-server',
    'prettierd',
    'eslint_d',
    -- 'htmx-lsp',

    'clangd',
    'clang-format',

    'lua-language-server',
    'stylua',
} -- }}}

M.mason_dap = { -- {{{
    'delve',
    'cppdbg',
} -- }}}

M.format = { -- {{{
    -- angular = {"prettierd"},
    css = { 'prettierd' },
    -- flow = {"prettierd"},
    -- graphql = {"prettierd"},
    html = { 'prettierd' },
    json = { 'prettierd' },
    -- jsx = { 'prettierd' },
    javascript = { 'prettierd' },
    less = { 'prettierd' },
    markdown = { 'prettierd' },
    scss = { 'prettierd' },
    typescript = { 'prettierd' },
    -- vue = {"prettierd"},
    yaml = { 'prettierd' },

    lua = { 'stylua' },
    c = { 'clang-format' },
    cpp = { 'clang-format' },

    go = { 'gofmt' },
    python = { 'ruff_format' },

    -- gdscript = { 'gdformat' },
}

M.formatextra = {
    python = {
        prepend_args = { '--config', '~/.ruff.toml' },
    },
} -- }}}

M.lint = { -- {{{
    python = { 'ruff' },
    javascript = { 'eslint_d' },
    go = { 'golangcilint' },
    -- gdscript = { 'gdlint' },
} -- }}}

return M
