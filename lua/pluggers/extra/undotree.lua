-- undotree Shows a tree, of your undos
return {
    'mbbill/undotree',
    cmd = { 'UndotreeToggle', 'UndotreeFocus' },
    keys = {
        {
            '<leader>u',
            '<cmd>UndotreeToggle<cr><cmd>UndotreeFocus<CR>',
            desc = '[u]ndotree Toggle',
        },
    },
}
