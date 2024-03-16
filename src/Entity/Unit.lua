require('src.Entity.Entity')
require('src.Graphics.Sprite')

---@class Unit: Entity
Unit = Class('Unit', Entity)

---@return Unit
function Unit:create()
    self.sprite = Sprite:create("gra//Sprite//TempUnit3.png", 1, 1.)--love.graphics.newImage("gra//Sprite//TempUnit.png")
    return self
end

function Unit:setPosition(x, y)
    self.x = x
    self.y = y
end

function Unit:draw()
    TBD()
    local img, sizex, sizey = self.sprite:getAnim()
    love.graphics.scale(Camera.scale, Camera.scale)
    love.graphics.translate(-Camera.x, -Camera.y)
    love.graphics.draw(self.sprite.image, img, self.x * 128, self.y * 128, 0, 128 / sizex, 128 / sizey)
    love.graphics.origin()
    --love.graphics.setPointSize(25)
    --love.graphics.points(love.graphics:getWidth()/2, love.graphics:getHeight()/2)
end