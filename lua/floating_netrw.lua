local M = {}

local netrw_float_win = nil

function M.toggle()
    if netrw_float_win and vim.api.nvim_win_is_valid(netrw_float_win) then
        vim.api.nvim_win_close(netrw_float_win, true)
        netrw_float_win = nil
        return
    end

    local ui = vim.api.nvim_list_uis()[1]
    local width = ui.width
    local height = math.floor(ui.height * 0.8)

    local opts = {
        relative = 'editor',
        width = width,
        height = height,
        row = math.floor((ui.height - height) / 2),
        col = 0,
        style = 'minimal',
        border = 'rounded',
    }

    local buf = vim.api.nvim_create_buf(false, true)
    netrw_float_win = vim.api.nvim_open_win(buf, true, opts)

    vim.api.nvim_buf_set_option(buf, 'bufhidden', 'wipe')

    vim.cmd('lcd ' .. vim.fn.getcwd())
    vim.cmd('edit .')
    vim.cmd('redraw!')
end

return M
