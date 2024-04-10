M = {}

-- Treesitter ensure_installed{{{
M.treesitter = {
    'lua',
    'python',
    'c',
    'cpp',
    'html',
    'htmldjango',
    'css',
    'javascript',
    'typescript',
    'vim',
    'vimdoc',
    'bash',
    'sql',
    'json',
    'yaml',
    'markdown',
    'gitcommit',
    'org',
    'diff',
    'go',
    -- 'gdscript',
    -- 'rust',
} -- }}}

-- Mason ensure_installed{{{
M.servers = {
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
            workspace = { checkThirdParty = false },
            telemetry = { enable = false },
        },
    },
}

M.mason = {
    'ruff',
    'pyright',

    'gopls',

    'html-lsp',
    'emmet-language-server',
    'css-lsp',
    'tailwindcss-language-server',
    'typescript-language-server',
    'prettier',
    -- 'htmx-lsp',

    'clangd',
    'clang-format',

    'lua-language-server',
    'stylua',
}

M.mason_dap = {
    -- 'delve',
    'cppdbg',
}

-- none-ls sources{{{
-- function M.null()
--     local null_ls = require('null-ls')
--
--     -- local formatting = null_ls.builtins.formatting
--     local lint = null_ls.builtins.diagnostics
--
--     return {
--         lint.gdlint,
--     }
-- end -- }}}

return M
