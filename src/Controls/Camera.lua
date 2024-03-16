---@class Camera
---@field x integer
---@field y integer
---@field scale float
Camera = {}
Camera.x = 0
Camera.y = 0
Camera.scale = 0.33

function Camera.moveToPlayer()
    local tx = love.graphics.getWidth() / 256 / Camera.scale
    local ty = love.graphics.getHeight() / 256 / Camera.scale
    Camera.x = 128 * (Player.x - tx) + 64
    Camera.y = 128 * (Player.y - ty) + 64
end

---@return integer, integer
function Camera.getTilesAmount()
    local x = 1 + math.floor(love.graphics.getWidth() / 128 / Camera.scale)
    local y = 1 + math.floor(love.graphics.getHeight() / 128 / Camera.scale)
    return x, y
end