local ft = require('guard.filetype')
-- local lint = require('guard.lint')

ft('css', 'html', 'json', 'javascript', 'markdown', 'typescript', 'yaml'):fmt(
    'prettier'
)

ft('python'):fmt({
    cmd = 'blue',
    args = { '--quiet', '-' },
    stdin = true,
})

ft('lua'):fmt('stylua')

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
