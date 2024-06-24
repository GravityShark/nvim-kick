-- vim-sleuth Detect tabstop and shiftwidth automatically
return {
    'tpope/vim-sleuth',
    event = { "BufReadPost", "BufNewFile", "BufWritePre" },
}
