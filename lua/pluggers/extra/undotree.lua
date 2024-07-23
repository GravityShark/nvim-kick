return { -- undotree Shows a tree, of your undos
    'mbbill/undotree',
    cmd = { 'UndotreeToggle', 'UndotreeFocus', 'UndotreeShow' },
    keys = {
        {
            '<leader>u',
            '<cmd>UndotreeToggle<cr><cmd>UndotreeFocus<CR>',
            desc = 'undotree',
        },
    },
}
