local M = {}

local state = { buf = nil, win = nil }

function M.toggle()
    if state.win and vim.api.nvim_win_is_valid(state.win) then
        vim.api.nvim_win_hide(state.win)
        state.win = nil
        return
    end

    local ui = vim.api.nvim_list_uis()[1]
    local width = math.floor(ui.width * 0.8)
    local height = math.floor((ui.height - 2) * 0.8)
    local col = math.floor((ui.width - width) / 2)
    local row = math.floor(((ui.height - 2) - height) / 2)

    local opts = {
        relative = 'editor',
        width = width,
        height = height,
        row = row,
        col = col,
        style = 'minimal',
        border = 'rounded',
    }

    if not state.buf or not vim.api.nvim_buf_is_valid(state.buf) then
        state.buf = vim.api.nvim_create_buf(false, true)
        vim.api.nvim_buf_set_option(state.buf, 'bufhidden', 'wipe')
    end

    state.win = vim.api.nvim_open_win(state.buf, true, opts)

    -- Set up autocmd to close window after file selection
    vim.api.nvim_create_autocmd('BufEnter', {
        buffer = state.buf,
        once = true,
        callback = function()
            vim.api.nvim_create_autocmd('BufLeave', {
                once = true,
                callback = function()
                    -- Close the floating window
                    if
                        netrw_winid and vim.api.nvim_win_is_valid(netrw_winid)
                    then
                        vim.api.nvim_win_close(netrw_winid, true)
                    end
                    state.buf = nil
                    state.win = nil
                end,
            })
        end,
    })

    vim.cmd('lcd ' .. vim.fn.getcwd())
    vim.cmd('edit .')

    vim.g_local.netrw_liststyle = 3
    vim.g_local.netrw_browse_split = 4
end

return M
