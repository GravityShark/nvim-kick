-- mustache template that my stylix config for nix uses

local base16 = require('mini.base16')
local palette = {
    base00 = '${base00}',
    base01 = '${base01}',
    base02 = '${base02}',
    base03 = '${base03}',
    base04 = '${base04}',
    base05 = '${base05}',
    base06 = '${base06}',
    base07 = '${base07}',
    base08 = '${base08}',
    base09 = '${base09}',
    base0A = '${base0A}',
    base0B = '${base0B}',
    base0C = '${base0C}',
    base0D = '${base0D}',
    base0E = '${base0E}',
    base0F = '${base0F}',
}

local cterm = base16.rgb_palette_to_cterm_palette(palette)

base16.setup({
    palette = palette,
    use_cterm = cterm,
    plugins = {
        default = false,
        ['nvim-mini/mini.nvim'] = true,
        ['folke/lazy.nvim'] = true,
        ['folke/noice.nvim'] = true,
        ['folke/todo-comments.nvim'] = true,
        ['folke/trouble.nvim'] = true,
        ['folke/which-key.nvim'] = true,
        -- ['lewis6991/gitsigns.nvim'] = true,
    },
})

local overrides = {
    SignColumn = { bg = 'none', ctermbg = 'none' },
    LineNr = { bg = 'none', ctermbg = 'none' },
    LineNrAbove = { bg = 'none', ctermbg = 'none' },
    LineNrBelow = { bg = 'none', ctermbg = 'none' },
    SnacksIndent = { fg = palette.base01, ctermfg = cterm.base01 },
    Folded = { bg = palette.base00 },
    -- MiniJump = {
    --     fg = palette.base01,
    --     ctermfg = cterm.base01,
    --     undercurl = false,
    -- },
    MiniJump = {
        fg = palette.base01,
        ctermfg = cterm.base01,
        undercurl = false,
        underline = true,
    },
    DiagnosticUnderlineOk = { undercurl = true },
    DiagnosticUnderlineHint = { undercurl = true },
    DiagnosticUnderlineInfo = { undercurl = true },
    DiagnosticUnderlineWarn = { undercurl = true },
    DiagnosticUnderlineError = { undercurl = true },
}

for hl, atr in pairs(overrides) do
    vim.api.nvim_set_hl(0, hl, atr)
end

vim.g.colors_name = 'nix'
