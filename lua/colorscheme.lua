
--local colorscheme = "habamax"
--local colorscheme = "OceanicNext"
local colorscheme = "gruvbox"
--local colorscheme = "catppuccin-macchiato"
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " 没有找到！")
  return
end
