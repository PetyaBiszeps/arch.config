local home = assert(os.getenv("HOME"))
local path = home .. "/.local/share/ambxst/hyprland.lua"

local config = loadfile(path)

if not config then
  return false
end

config()

return true
