-- https://github.com/linkarzu/dotfiles-latest/blob/990d77fbc13ea506968c2ce1617def110c6c02ad/neovim/neobean/lua/config/keymaps.lua#L3104C1-L3126C4
function _G.markdown_foldexpr()
    local lnum = vim.v.lnum
    local line = vim.fn.getline(lnum)
    local heading = line:match('^(#+)%s')
    if heading then
        local level = #heading
        if level == 1 then
            -- Special handling for H1
            if lnum == 1 then
                return '>1'
            else
                local frontmatter_end = vim.b.frontmatter_end
                if frontmatter_end and (lnum == frontmatter_end + 1) then
                    return '>1'
                end
            end
        elseif level >= 2 and level <= 6 then
            -- Regular handling for H2-H6
            return '>' .. level
        end
    end
    return '='
end

-- https://github.com/linkarzu/dotfiles-latest/blob/990d77fbc13ea506968c2ce1617def110c6c02ad/neovim/neobean/lua/config/keymaps.lua#L3104C1-L3126C4
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
vim.opt_local.foldexpr = 'v:lua.markdown_foldexpr()'
-- vim.opt_local.foldtext = 'v:lua.vim.treesitter.foldtext()'
vim.opt_local.foldtext = 'foldtext()'
