-- https://github.com/linkarzu/dotfiles-latest/blob/990d77fbc13ea506968c2ce1617def110c6c02ad/neovim/neobean/lua/config/keymaps.lua#L3104C1-L3126C4
vim.opt.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
vim.opt.foldtext = 'v:lua.vim.treesitter.foldtext()'

-- vim.opt_local.foldexpr = 'v:lua.markdown_foldexpr()'
-- vim.opt_local.foldtext = 'v:lua.vim.treesitter.foldtext()'

-- Detect frontmatter closing line
local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
local found_first = false
local frontmatter_end = nil
for i, line in ipairs(lines) do
    if line == '---' then
        if not found_first then
            found_first = true
        else
            frontmatter_end = i
            break
        end
    end
end
vim.b.frontmatter_end = frontmatter_end
