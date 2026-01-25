-- define colorschemes here
local colorscheme = 'rosebones'

local is_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)

-- only set colorscheme options if available
if not is_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
else
  vim.g.rosebones_lightness='dim'
  vim.g.rosebones_transparent_background=true
end
