local home = assert(os.getenv("HOME"))
local root = home .. "/.config/hypr"

local function include(path)
  return dofile(root .. "/" .. path .. ".lua")
end

-- Integrations
include("integrations/ambxst")

-- Configuration
include("config/input")
include("config/binds")
include("config/autostart")
