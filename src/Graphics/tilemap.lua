local tilemap = {}

---@class Tile: Object
---@field tex love.Image
---@field scalex float
---@field scaley float
Tile = Class("Tile")

---@type table<string,love.Image>
local images = {}

---@return Tile
function Tile:create(fileName)
    fileName = fileName or "Gra//Tile//Nothing.png"
    if not images[fileName] then
        images[fileName] = love.graphics.newImage(fileName)
    end
    self.tex = images[fileName]
    self.scalex = 128 / images[fileName]:getWidth()
    self.scaley = 128 / images[fileName]:getHeight()
    return self
end

function Tile:draw(x, y)
    love.graphics.draw(self.tex, x, y, 0, self.scalex, self.scaley)
end

Tile.default = Tile:create()

---@class Tilemap: Object
---@field width integer
---@field height integer
---@field tile Tile[][]
---@field canvas love.Canvas
---@field cameraX integer
---@field cameraY integer
---@field globalX integer
---@field globalY integer
---@field size Vector
Tilemap = Class("Tilemap")

---@return Tilemap
function Tilemap:create(width, height)
    self.width = width
    self.height = height
    self.tile = setmetatable({}, {
        __index = function (t, k)
            t[k] = {}
            return t[k]
        end
    })
    return self
end

local rndList = {
    "Gra//Tile//Grass.png",
    "Gra//Tile//Rock2.png"
}

function Tilemap:generate()
    for i = 1, self.width do
        for j = 1, self.height do
            self.tile[i][j] = Tile:create(rndList[math.random(1, #rndList)])
        end
    end
end

---@param x integer
---@param y integer
function Tilemap:prepare(x, y)
    self.cameraX = x
    self.cameraY = y
    if self.canvas then
        self.canvas:release()
    end
    local sizex, sizey = Camera.getTilesAmount()
    sizex, sizey = 1 + math.floor(sizex / 2), 1 + math.floor(sizey / 2)
    self.globalX = 128 * (x - sizex)
    self.globalY = 128 * (y - sizey)
    self.size = {sizex * 2, sizey * 2}
    self.canvas = love.graphics.newCanvas(256 * sizex, 256 * sizey)
    love.graphics.setCanvas(self.canvas)
    for i = 0, sizex * 2 do
        for j = 0, sizey * 2 do
            if self.tile[x - sizex + i][y - sizey + j] then
                self.tile[x - sizex + i][y - sizey + j]:draw(128 * i, 128 * j)
            else
                Tile.default:draw(128 * i, 128 * j)
            end
        end
    end
    love.graphics.setCanvas()
    love.graphics.reset()
end

function Tilemap:get(x, y)
    return self.tile[x][y]
end

function Tilemap:draw()
    local sizex, sizey = Camera.getTilesAmount()
    sizex, sizey = 1 + math.floor(sizex / 2), 1 + math.floor(sizey / 2)
    if not self.canvas or Player.x ~= self.cameraX or Player.y ~= self.cameraY or self.size[1] ~= 2 * sizex or self.size[2] ~= 2 * sizey then
        self:prepare(Player.x, Player.y)
    end
    love.graphics.scale(Camera.scale, Camera.scale)
    love.graphics.translate(-Camera.x, -Camera.y)
    love.graphics.draw(self.canvas, self.globalX, self.globalY)
    love.graphics.origin()
end