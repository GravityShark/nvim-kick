-- vim.api.exe
-- vim.cmd.amenu()
vim.cmd.aunmenu('PopUp.How-to\\ disable\\ mouse')
vim.cmd.aunmenu('PopUp.-1-')
vim.cmd.aunmenu('PopUp.Delete')

return {
    'echasnovski/mini.move',
    version = false,
    opts = {},
    event = { 'VeryLazy' },
}
-- local api = vim.api
--
-- local isDragging = false
-- local startLine = 0
-- local endLine = 0
--
-- local function onMouseDown()
--     isDragging = true
--     startLine = api.nvim_win_get_cursor(0)[1]
-- end
--
-- local function onMouseUp()
--     if isDragging then
--         isDragging = false
--         local endLine = api.nvim_win_get_cursor(0)[1]
--
--         -- Calculate the distance to move
--         local moveDistance = endLine - startLine
--
--         -- Move the selected text
--         api.nvim_command(
--             string.format('%d,%dm%d', startLine, endLine, startLine - 1)
--         )
--
--         -- Update the cursor position
--         api.nvim_win_set_cursor(
--             0,
--             { startLine - moveDistance, api.nvim_win_get_cursor(0)[2] }
--         )
--     end
-- end
--
-- -- Register autocmds to handle mouse events
-- api.nvim_command('augroup DragMovePlugin')
-- api.nvim_command('autocmd!')
-- api.nvim_command("autocmd CursorHold * lua require('dragmove').onMouseDown()")
-- api.nvim_command("autocmd CursorHoldI * lua require('dragmove').onMouseDown()")
-- api.nvim_command("autocmd CursorMoved * lua require('dragmove').onMouseUp()")
-- api.nvim_command("autocmd CursorMovedI * lua require('dragmove').onMouseUp()")
-- api.nvim_command('augroup END')
--
-- return {
--     onMouseDown = onMouseDown,
--     onMouseUp = onMouseUp,
-- }
