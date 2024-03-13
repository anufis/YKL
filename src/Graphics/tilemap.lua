local tilemap = {}

---@class Tile: Object
---@field tex love.Image
Tile = Class("Tile")

local images = {}

---@return Tile
function Tile:create(fileName)
    fileName = fileName or "Gra//Tile//Nothing.png"
    if not images[fileName] then
        images[fileName] = love.graphics.newImage(fileName)
    end
    self.tex = images[fileName]
    return self
end

function Tile:draw(x, y)
    love.graphics.draw(self.tex, x, y)
end

Tile.default = Tile:create()

---@class Tilemap: Object
---@field width integer
---@field height integer
---@field tile Tile[][]
---@field canvas love.Canvas
---@field cameraX integer
---@field cameraY integer
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
    "Gra//Tile//Rock.png"
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
    self.canvas = love.graphics.newCanvas(128 * 30, 128 * 30)
    love.graphics.setCanvas(self.canvas)
    for i = x - 15, x + 14 do
        for j = y - 15, y + 14 do
            if self.tile[i][j] then
                self.tile[i][j]:draw(128 * (i - x + 15), 128 * (j - y + 15))
            else
                Tile.default:draw(128 * (i - x + 15), 128 * (j - y + 15))
            end
        end
    end
    love.graphics.setCanvas()
end

function Tilemap:get(x, y)
    return self.tile[x][y]
end

function Tilemap:draw()
    if not self.canvas or Player.x ~= self.cameraX or Player.y ~= self.cameraY then
        self:prepare(Player.x, Player.y)
    end
    love.graphics.translate(love.graphics.getWidth() / 2, love.graphics.getHeight() / 2)
    love.graphics.scale(Camera.scale, Camera.scale)
    love.graphics.draw(self.canvas, -15 * 128, -15 * 128)
    love.graphics.origin()
end