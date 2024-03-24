local ft = require('guard.filetype')

ft('css', 'html', 'json', 'javascript', 'markdown', 'typescript', 'yaml'):fmt(
    'prettier'
)

ft('lua'):fmt('stylua')

ft('python'):fmt({
    cmd = 'ruff',
    args = { 'format', '--config', '~/.ruff.toml', '-' },
    stdin = true,
}):lint('ruff')

-- ft('sh', 'bash', 'mksh'):fmt({
--     cmd = 'beautysh',
--     stin = true,
-- })

ft('c', 'cpp'):fmt('clang-format')
ft('gdscript'):fmt({
    cmd = 'gdformat',
    args = { '--line-length=78', '-' },
    stdin = true,
})
--     :lint({
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
