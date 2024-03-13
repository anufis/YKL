---@class Camera
---@field x integer
---@field y integer
---@field scale float
Camera = {}
Camera.x = 0
Camera.y = 0
Camera.scale = 0.33

function Camera.moveToPlayer()
    local x = love.graphics.getWidth() / 256 / Camera.scale
    local y = love.graphics.getHeight() / 256 / Camera.scale
    Camera.x = 128 * (Player.x - x) - 128 + 64
    Camera.y = 128 * (Player.y - y) - 128 + 64
end