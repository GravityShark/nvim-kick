local ls = require('luasnip')
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
-- local c = ls.choice_node
local sn = ls.snippet_node
local d = ls.dynamic_node
local f = ls.function_node
-- local fmta = require('luasnip.extras.fmt').fmta
local rep = require('luasnip.extras').rep
-- local r = ls.restore_node
-- local isn = ls.indent_snippet_node

ls.add_snippets('org', {
    s('<id', {
        t({
            ':PROPERTIES:',
            ':ID: ',
        }),
        d(1, function()
            return sn(nil, i(1, vim.fn.expand('%:t:r')))
        end),
        t({
            '',
            ':END:',
        }),
    }),
})

ls.add_snippets('org', {
    s('<roam', {
        t({ '#+title ' }),
        d(1, function()
            local title = vim.fn
                .expand('%:t:r')
                :gsub('^%l', string.upper, 1)
                :gsub('_', ' ')

            return sn(nil, i(1, title))
        end),
        t({ '', '* ' }),
        rep(1),
        t({
            '',
            '  :PROPERTIES:',
            '  :ID: ',
        }),
        d(2, function()
            return sn(nil, i(1, vim.fn.expand('%:t:r')))
        end),
        t({
            '',
            '  :END:',
        }),
    }),
})

-- ls.add_snippets('all', {
--     s('balls', { t('ITS BALLS TIME BABY') }),
-- })

-- ls.add_snippets('lua', {
--     s('req', fmta("local <> = require('<>')", { i(1), rep(1) })),
-- })

-- ls.add_snippets('go', {
--     s(
--         'iferrlog',
--         fmta(
--             [[
-- <>err := <>(<>)
-- if err != nil {
--     log.Fatal("<> error.")
--     return <>
-- }]],
--             {
--                 c(1, { t(), t(', '), t('_, ') }),
--                 i(2),
--                 i(3),
--                 rep(2),
--                 i(5, 'err'),
--             }
--         )
--     ),
-- })

-- local function go_result_type(info)
--     local function_node_types = {
--         function_declaration = true,
--         method_declaration = true,
--         func_literal = true,
--     }
-- local node = vim.treesitter.get_node()
--     while arst ~= node
-- end
--
--
--
-- local go_return_values = function(args)
--     return sn(
--         nil,
--         go_return_type {
--             index = 0,
--             err_name = args[1][1],
--             func_name = args[2][1],
--         }
--     )
-- end
--
-- ls.add_snippets('go', {
--     s(
--         'iferrlog',
--         fmta(
--             [[
-- if err != nil {
--     log.Fatal("<message>")
--     return <result>err
-- }
-- <finish>
-- ]],
--             {
--                 message = c(1, { sn(1, { i(1), t(' error.') }), i(1) }),
--                 result = i(2),
--                 finish = i(0),
--             }
--         )
--     ),
-- })
