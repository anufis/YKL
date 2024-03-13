require('src.Entity.Entity')

---@class Unit: Entity
---@field sprite love.Image
Unit = Class('Unit', Entity)

---@return Unit
function Unit:create()
    self.sprite = love.graphics.newImage("gra//Sprite//TempUnit.png")
    return self
end

function Unit:setPosition(x, y)
    self.x = x
    self.y = y
end

function Unit:draw()
    TBD()
    love.graphics.scale(Camera.scale, Camera.scale)
    love.graphics.translate(-Camera.x, -Camera.y)
    love.graphics.draw(self.sprite, self.x * 128 - 128 + 64, self.y * 128 - 128 + 64)
    love.graphics.origin()
end