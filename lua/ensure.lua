-- A single file listing Treesitter, LSP, Mason, Formatting and Linting specs.
M = {}

M.treesitter = {
    -- 'go', -- Go
    -- 'gomod',
    -- 'gosum',
    -- 'templ',
    -- 'html', -- Webdev
    -- 'css',
    -- 'javascript',
    -- 'python', -- Other Languages
    -- 'sql',
    -- 'bash',
    -- 'c',
    -- 'lua',
    -- 'nix',
    -- 'json', -- Data/Config Formats
    -- 'yaml',
    -- 'toml',
    -- 'markdown', -- Markup
    -- 'markdown_inline',
    -- 'org',
    -- 'vimdoc',
    -- 'diff', -- Other
    'gitcommit',
    -- 'query',
    -- 'regex',
}

M.mason = { -- :Mason
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

M.lsp = { -- :help lspconfig-all
    lua_ls = {
        settings = {
            Lua = {
                completion = { autoRequire = true, callSnippet = 'Replace' },
                workspace = { checkThirdParty = false },
                hint = { enable = true },
            },
        },
    },
    -- gopls = {
    --     settings = {
    --         gopls = {
    --             usePlaceholders = true,
    --             analyses = { unusedparams = true },
    --         },
    --     },
    -- },
    -- html = {}, -- Webdev
    -- emmet_language_server = {},
    -- tailwindcss = {},
    -- ts_ls = {
    --     settings = {
    --         implicitProjectConfiguration = {
    --             checkJs = true,
    --         },
    --     },
    -- },
    clangd = {},
    -- pyright = {},
    -- jsonls = {},
    nil_ls = {},
    -- 25 different language AOC challenge
    -- csharp_ls = {},
    -- ols = {},
    -- zls = {},
    -- ocamllsp = {},
    -- perlpls = {},
    -- gleam = {},
    -- sourcekit = {},
    ruby_lsp = {},
}

M.format = { -- :help conform-formatters
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
    nix = { 'nixfmt' },
    ocaml = { 'ocamlformat' },
    swift = { 'swift-format' },
    ruby = { 'rubyfmt' },
}

M.formatextra = { -- :help conform-options
    ruff = {
        prepend_args = { '--config', '~/.ruff.toml' },
    },
}

-- :e ~/ -- https://github.com/mfussenegger/nvim-lint?tab=readme-ov-file#available-linters.local/share/nvim/lazy/nvim-lint/README.md
-- https://github.com/mfussenegger/nvim-lint?tab=readme-ov-file#available-linters
M.lint = {
    python = { 'ruff' },
    javascript = { 'quick-lint-js' },
    go = { 'golangcilint' },
}

return M
