M = {}

M.treesitter = { -- {{{
    'lua',
    'python',
    'c',
    'html',
    'css',
    'javascript',
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
    'gomod',
    'gosum',
    'templ',
    'typst',
} -- }}}

M.servers = { -- {{{
    --[[ Example
    x_language_server = {
      cmd = {...},
      filetypes = { ...},
      capabilities = {},
      settings = {...},
    },
    ]]

    pyright = {},

    gopls = {
        settings = {
            gopls = {
                usePlaceholders = true,
                analyses = { unusedparams = true },
            },
        },
    },

    html = {},
    emmet_language_server = {},
    cssls = {},
    tailwindcss = {},
    tsserver = {},
    -- htmx = {},

    clangd = {},

    lua_ls = {
        settings = {
            Lua = {
                completion = { autoRequire = true, callSnippet = 'Replace' },
                workspace = { checkThirdParty = false },
            },
        },
    },

    ltex = {
        filetypes = {
            {
                'gitcommit',
                'markdown',
                'org',
                'html',
                'text',
                'typst',
                -- 'bib',
                -- 'plaintex',
                -- 'rst',
                -- 'rnoweb',
                -- 'tex',
                -- 'pandoc',
                -- 'quarto',
                -- 'rmd',
                -- 'context',
                -- 'xhtml',
                -- 'mail',
            },
        },
    },
    tinymist = {},
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
    'quick-lint-js',
    -- 'htmx-lsp',

    'clangd',
    'clang-format',

    'lua-language-server',
    'stylua',

    'ltex-ls',
    'tinymist',
} -- }}}

-- M.mason_dap = { -- {{{
--     'delve',
--     'cppdbg',
-- } -- }}}

M.format = { -- {{{
    css = { 'prettierd' },
    html = { 'prettierd' },
    json = { 'prettierd' },
    javascript = { 'prettierd' },
    markdown = { 'prettierd' },
    yaml = { 'prettierd' },
    -- scss = { 'prettierd' },
    -- typescript = { 'prettierd' },

    lua = { 'stylua' },
    c = { 'clang-format' },
    cpp = { 'clang-format' },

    go = { 'gofmt' },
    python = { 'ruff_format' },
}

M.formatextra = {
    python = {
        prepend_args = { '--config', '~/.ruff.toml' },
    },
} -- }}}

M.lint = { -- {{{
    python = { 'ruff' },
    javascript = { 'quick-lint-js' },
    go = { 'golangcilint' },
} -- }}}

return M
