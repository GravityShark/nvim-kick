-- local slow_format_filetypes = {}
return {
    'stevearc/conform.nvim',
    event = 'BufWritePre',
    cmd = { 'ConformInfo' },
    init = function()
        -- Formatting disable and enable
        vim.api.nvim_create_user_command('FormatDisable', function(args)
            if args.bang then
                vim.b.disable_autoformat = true
            else
                vim.g.disable_autoformat = true
            end
        end, {
            desc = 'Disable autoformat-on-save',
            bang = true,
        })
        vim.api.nvim_create_user_command('FormatEnable', function()
            vim.b.disable_autoformat = false
            vim.g.disable_autoformat = false
        end, {

            desc = 'Re-enable autoformat-on-save',
        })
    end,
    keys = {
        {
            -- Customize or remove this keymap to your liking
            '<leader>F',
            function()
                require('conform').format({ async = true, lsp_fallback = true })
            end,
            -- mode = '',
            desc = '[F]ormat code',
        },
    },
    -- Everything in opts will be passed to setup()
    opts = {
        formatters_by_ft = require('ensure').format,
        formatters = require('ensure').formatextra,
        format_on_save = function(bufnr)
            -- Disable with a global or buffer-local variable
            if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
                return
            end

            -- Hide errors if formatting failed
            if
                #vim.diagnostic.get(
                    0,
                    { severity = { min = vim.diagnostic.severity.ERROR } }
                ) > 0
            then
                return
            end

            --[[ For slow formatters
            if slow_format_filetypes[vim.bo[bufnr].filetype] then
                return
            end
            local function on_format(err)
                if err and err:match('timeout$') then
                    slow_format_filetypes[vim.bo[bufnr].filetype] = true
                end
            end

            return { timeout_ms = 200, lsp_fallback = true }, on_format
            ]]
            return { timeout_ms = 200, lsp_fallback = true }
        end,
        --[[ For slow formatters
        format_after_save = function(bufnr)
            if not slow_format_filetypes[vim.bo[bufnr].filetype] then
                return
            end
            return { lsp_fallback = true }
        end,
        ]]
    },
}
