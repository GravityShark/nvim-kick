-- A single file listing Treesitter, LSP, Formatting and Linting specs.
M = {}

-- Mostly want to install parsers that don't automatically install by filename
M.treesitter = {
    -- 'diff',
    'gitcommit',
    -- 'markdown_inline',
    -- 'regex',
    -- 'sql',
}

M.lsp = { -- :help lspconfig-all
    'clangd',
    'pyright',
    gopls = {
        settings = {
            gopls = {
                usePlaceholders = true,
                analyses = { unusedparams = true },
            },
        },
    },
    lua_ls = {
        settings = {
            Lua = {
                completion = { autoRequire = true, callSnippet = 'Replace' },
                workspace = { checkThirdParty = false },
                hint = { enable = true },
            },
        },
    },
    nil_ls = { settings = { nix = { flake = { autoArchive = true } } } },
    -- Webdev
    'emmet_language_server',
    'html',
    'jsonls',
    'tailwindcss',
    ts_ls = {
        settings = { implicitProjectConfiguration = { checkJs = true } },
    },
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

-- https://github.com/mfussenegger/nvim-lint?tab=readme-ov-file#available-linters
M.lint = {
    python = { 'ruff' },
    javascript = { 'quick-lint-js' },
    go = { 'golangcilint' },
}

return M
