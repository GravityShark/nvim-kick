return {
    'ms-jpq/coq_nvim',
    name = 'coq_nvim',
    event = { 'BufReadPost', 'BufNewFile', 'BufWritePre' },
    build = ':COQdeps',
    dependencies = { -- 9000+ Snippets
        { 'ms-jpq/coq.artifacts', branch = 'artifacts' },
        { 'ms-jpq/coq.thirdparty', branch = '3p' },
    },
    init = function()
        vim.g.coq_settings = {
            auto_start = 'shut-up', -- Silent startup
            ['keymap.pre_select'] = true,
            ['keymap.recommended'] = false,
            display = {
                ['pum.y_max_len'] = 6,
                ['ghost_text.context'] = { '', '' },
                ['preview.border'] = { -- Make the preview actually diserable
                    { '', 'NormalFloat' },
                    { '', 'NormalFloat' },
                    { '', 'NormalFloat' },
                    { ' ', 'NormalFloat' },
                    { '', 'NormalFloat' },
                    { '', 'NormalFloat' },
                    { '', 'NormalFloat' },
                    { ' ', 'NormalFloat' },
                },
            },
        }
    end,
}
