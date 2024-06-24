-- persistence.nvim Session management
return {
    'folke/persistence.nvim',
    event = 'BufReadPre',
    keys = {
        {
            '<leader>sl',
            '<CMD>lua require("persistence").load()<CR>',
            desc = 'Session [l]oad',
        },
        {
            '<leader>sL',
            '<CMD>lua require("persistence").load({ last = true })<CR>',
            desc = 'Session [L]oad last session',
        },
        {
            '<leader>sp',
            '<CMD>lua require("persistence").stop()<CR>',
            desc = 'Session [p]ause',
        },
        {
            '<leader>ss',
            '<CMD>lua require("persistence").save()<CR>',
            desc = 'Session [s]save',
        },
        {
            '<leader>sd',
            function()
                local M = require('persistence')
                local sfile = M.get_last() or M.get_current()
                if sfile and vim.fn.filereadable(sfile) ~= 0 then
                    -- vim.cmd('silent! source ' .. vim.fn.fnameescape(sfile))
                    assert(os.remove(sfile))
                    M.stop()
                end
            end,
            desc = 'Session [d]elete',
        },
    },
    opts = {
        options = { 'buffers,curdir,folds,tabpages,winpos,winsize' },
    },
}
