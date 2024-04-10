local ft = require('guard.filetype')

ft('css,html,json,markdown,yaml,typescript,javascript'):fmt('prettier')
ft('lua'):fmt('stylua')
ft('c,cpp'):fmt('clang-format')
ft('go'):fmt('gofmt')
ft('python'):fmt({
    cmd = 'ruff',
    args = { 'format', '--config', '~/.ruff.toml', '-' },
    stdin = true,
}):lint('ruff')


-- ft('gdscript'):fmt({
--     cmd = 'gdformat',
--     args = { '--line-length=80', '-' },
--     stdin = true,
-- }):lint({
--     cmd = 'gdlint',
--     -- stdin = true,
--     fname = true,
--     parse = lint.from_regex({
--         -- regex = '(.+):(%d+):%s+(%a+):%s+(.+)(%(.-%))',
--         regex = '.+:(%d+):%s+(%a+):%s+(.-)(%(.-%))',
--         col = 0,
--         -- groups = { 'source', 'lnum', 'severity', 'message', 'code' },
--         groups = { 'lnum', 'severity', 'message', 'code' },
--         severities = {
--             Error = lint.severities.error,
--         },
--     }),
-- })

require('guard').setup({
    fmt_on_save = true,
    lsp_as_default_formatter = false,
})
