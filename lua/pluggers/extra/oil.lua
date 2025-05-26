return {
    'stevearc/oil.nvim',
    cmd = 'Oil',
    opts = { delete_to_trash = true },
    keys = {
        { '<leader>.', '<CMD>Oil --float<CR>', desc = 'file manager' },
    },
    dependencies = { { 'echasnovski/mini.icons', opts = {} } },
    -- lazy = true,
}
