local colorscheme = 'tokyonight-storm'

local is_oke, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)

if not is_oke then 
    vim.notify('colorscheme ' .. colorscheme .. ' not found')

    return
end
