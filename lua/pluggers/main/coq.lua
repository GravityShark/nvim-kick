return {
    'ms-jpq/coq_nvim',
    name = 'coq_nvim',
    event = { 'BufReadPost', 'BufNewFile', 'BufWritePre' },
    build = ':COQdeps',
    dependencies = 'ms-jpq/coq.artifacts', -- Adds snippets,
    -- 'ms-jpq/coq.thirdparty', -- Thirdparty sources
    init = function()
        vim.g.coq_settings = {
            -- Silent startup
            auto_start = 'shut-up',
            keymap = {
                manual_complete = '<c-n>',
                pre_select = true,
            },
            display = {
                -- Make the preview actually diserable
                ['preview.border'] = {
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
