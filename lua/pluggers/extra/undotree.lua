return { -- undotree Shows a tree, of your undos
    'mbbill/undotree',
    cmd = { 'UndotreeToggle', 'UndotreeFocus' },
    keys = {
        {
            '<leader>u',
            '<cmd>UndotreeToggle<cr><cmd>UndotreeFocus<CR>',
            desc = 'ndotree Toggle',
        },
    },
}
