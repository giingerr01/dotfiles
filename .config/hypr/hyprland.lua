-- Add local lua directory to path
package.path = package.path .. ";" .. os.getenv("HOME") .. "/.config/hypr/lua/?.lua"

-- Load configuration modules
require("autostart")
require("appearance")
require("animations")
require("input")
require("rules")
require("keybinds")
