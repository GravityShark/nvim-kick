return {
    'ms-jpq/chadtree',
    branch = 'chad',
    build = ':CHADdeps',
    cmd = 'CHADopen',
    keys = {
        {
            '<leader>,',
            '<CMD>CHADopen<CR>',
            desc = 'CHADtree',
        },
    },
    init = function()
        vim.g.chadtree_settings = { ['view.width'] = 25 }
    end,
}
