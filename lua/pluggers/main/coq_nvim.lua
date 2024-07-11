return {
    'ms-jpq/coq_nvim',
    event = { 'BufReadPost', 'BufNewFile', 'BufWritePre' },
    build = ':COQdeps',
    dependencies = {
        'ms-jpq/coq.artifacts',
        'ms-jpq/coq.thirdparty',
    },
    init = function()
        vim.g.coq_settings = {
            -- Silent startup
            auto_start = 'shut-up',
            -- ['keymap.recommended'] = false,
            ['keymap.pre_select'] = true,
            display = {
                -- Disable shitty ghost text
                ['ghost_text.enabled'] = false,
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
