-- Terminal Helpers{{{
-- Disable line numbers when opening a Terminal
vim.api.nvim_create_autocmd('TermOpen', {
    callback = function()
        vim.opt_local.relativenumber = false
        vim.opt_local.number = false
    end,
})
-- Automatically opening as insert mode when the buffer is a terminal
vim.api.nvim_create_autocmd('BufEnter', {
    callback = function()
        if vim.api.nvim_get_option_value('buftype', {}) == 'terminal' then
            vim.cmd.startinsert()
        end
    end,
}) -- }}}
-- When in allow for these applications when opening a respective file type{{{
vim.api.nvim_create_autocmd('BufEnter', {
    pattern = '*.pdf',
    command = ':silent !librewolf % &',
})

vim.api.nvim_create_autocmd('BufEnter', {
    pattern = { '*.docx', '*.pptx' },
    command = ':silent !flatpak run org.libreoffice.LibreOffice % &',
})

vim.api.nvim_create_autocmd('BufEnter', {
    pattern = { '*.png', '*.jpg', '*.webp', '*.svg' },
    command = ':silent !feh % &',
})
vim.api.nvim_create_autocmd('BufEnter', {
    pattern = {
        '*.pdf',
        '*.docx',
        '*.pptx',
        '*.png',
        '*.jpg',
        '*.webp',
        '*.svg',
    },
    callback = function()
        require('mini.bufremove').delete()
        CheckTabline()
    end,
}) -- }}}
-- Automatic disabling/renabling bufferline at 1 > Buffers ; 1 < Buffers {{{
function CheckTabline()
    -- Get the count of active buffers
    local buffers = vim.fn.len(vim.fn.getbufinfo({ buflisted = 1 }))

    if buffers == 1 then
        vim.opt.showtabline = 0
    elseif buffers > 1 then
        vim.opt.showtabline = 2
    end
end

vim.api.nvim_create_autocmd({
    'BufAdd',
    'BufDelete',
    'UIEnter',
}, { callback = CheckTabline })

-- Automatically deleting unnamed buffers
-- https://vi.stackexchange.com/questions/44617/bufferline-in-nvim-auto-close-or-hide-no-name-buffer-when-other-buffers-are-o
vim.api.nvim_create_autocmd({
    'BufReadPost',
}, {
    callback = function()
        -- Get a list of all buffers
        local buffers = vim.api.nvim_list_bufs()

        -- Iterate over each buffer
        for _, bufnr in ipairs(buffers) do
            -- Check if the buffer is empty and doesn't have a name
            if
                vim.api.nvim_buf_is_loaded(bufnr)
                and vim.api.nvim_buf_get_name(bufnr) == ''
                and vim.api.nvim_get_option_value('buftype', {}) == ''
            then
                -- Get all lines in the buffer
                local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)

                -- Initialize a variable to store the total number of characters
                local total_characters = 0

                -- Iterate over each line and calculate the number of characters
                for _, line in ipairs(lines) do
                    total_characters = total_characters + #line
                end

                -- Close the buffer if it's empty:
                if total_characters == 0 then
                    vim.api.nvim_buf_delete(bufnr, {
                        force = true,
                    })
                end
            end
        end
    end,
})

-- vim:foldmethod=marker:
