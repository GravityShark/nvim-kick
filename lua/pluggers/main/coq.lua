return {
    'ms-jpq/coq_nvim',
    name = 'coq_nvim',
    event = { 'BufReadPost', 'BufNewFile', 'BufWritePre' },
    build = ':COQdeps',
    dependencies = 'ms-jpq/coq.artifacts', -- Adds snippets,
    -- 'ms-jpq/coq.thirdparty', -- Thirdparty sources
    init = function()
        vim.g.coq_settings = {
            auto_start = 'shut-up', -- Silent startup
            display = {
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
