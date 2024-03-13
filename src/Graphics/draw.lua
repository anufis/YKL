require('src.Graphics.tilemap')

---@class Graphics
---@field bg love.Canvas
---@field scales table
Graphics = {}
Graphics.scales = {}

function Graphics.resetScale()
    table.clear(Graphics.scales)
end

local Graphics = Graphics
local scales = Graphics.scales

do
    local bgimage = love.graphics.newImage('gra//Background//TestBG.png')
    Graphics.bg = love.graphics.newCanvas(bgimage:getWidth(), bgimage:getHeight())
    love.graphics.setCanvas(Graphics.bg)
    love.graphics.draw(bgimage, 0, 0)
    love.graphics.setCanvas()
end

local function drawBackground()
    if not scales.bgx then
        scales.bgx = love.graphics.getWidth() / Graphics.bg:getWidth()
        print(love.graphics.getWidth(), scales.bgx)
    end
    love.graphics.draw(Graphics.bg, 0, 0, 0, scales.bgx, scales.bgx)
end

do
    TestMap = Tilemap:create(500, 500)
    TestMap:generate()
end

do
    Player = Unit:create()
    Player.x = 1
    Player.y = 1
end

function love.draw()
    Camera.moveToPlayer()

    drawBackground()

    TestMap:draw()

    Player:draw()

    TBD("Draw Entities")
    TBD("Draw Interface")
    --
    love.graphics.setColor(1, 1, 1)
    love.graphics.print("Current FPS: "..tostring(love.timer.getFPS( )), 10, 10)
    --love.graphics.print(string.format("%f, %f", centerx, centery))
    --love.graphics.setColor(0, 0.4, 0.4)
    --love.graphics.rectangle("fill", x, y, w, h)
end