-- main.lua
-- Loader for modules stored on GitHub

local base = "https://raw.githubusercontent.com/<dracodizzy>/<tas>/main/"

local function loadModule(name)
    local source = game:HttpGet(base .. name .. "_obf.lua")
    return loadstring(source)()
end

-- Load modules remotely
local Util        = loadModule("util")
local Animate     = loadModule("animate")
local Camera      = loadModule("camera")
local Input       = loadModule("input")
local Replay      = loadModule("replay")
local Connections = loadModule("connections")
local TASCreator  = loadModule("tascreator")
local AutoPlay    = loadModule("autoplay")
local Misc        = loadModule("misc")
local Extra       = loadModule("extra")

-- Wire modules together
AutoPlay:SetReplayModule(Replay)

-- Initialize
Input:Init()
Camera:Init()
Replay:Init()
Connections:Init()
Connections:CharacterAdded()

-- Frame updates
game:GetService("RunService").Heartbeat:Connect(function()
    Connections.InputBeganQueue = {}
    Connections.InputEndedQueue = {}
    AutoPlay:Step()
end)

