require('src.Entity.Entity')
require('src.Graphics.Sprite')

---@class Unit: Entity
Unit = Class('Unit', Entity)

---@return Unit
function Unit:create()
    self.sprite = Sprite:create("gra//Sprite//TempUnit.png", 2, 1.)--love.graphics.newImage("gra//Sprite//TempUnit.png")
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
    love.graphics.draw(self.sprite.image, self.sprite:getAnim(), self.x * 128 - 128 + 64, self.y * 128 - 128 + 64)
    love.graphics.origin()
end