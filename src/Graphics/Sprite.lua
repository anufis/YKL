---@class Sprite: Object
---@field private frames love.Quad[]
---@field duration float
---@field step integer
---@field dt float
Sprite = Class('Sprite')

---@type table
local sprite = setmetatable({}, {
    __index = function (t, k)
        t[k] = {}
        return t[k]
    end
})

---@return love.Image, love.Quad[]
local function create(fileName, frames)
    local img = love.graphics.newImage(fileName)
    local p = img:getWidth() / frames
    local h = img:getHeight()
    local t = {}
    for i = 0, frames - 1 do
        ---@diagnostic disable-next-line: missing-parameter, param-type-mismatch
        local q = love.graphics.newQuad(0 + p * i, 0, p, h, img)
        table.insert(t, q)
    end
    sprite[frames][fileName] = t
    return img, t
end

---@return Sprite
function Sprite:create(fileName, frames, duration)
    frames = frames or 1
    self.image, self.frames = create(fileName, frames)
    --[[if sprite[frames][fileName] then
        self.image, self.frames = create(fileName, frames)
    else

    end
    self.frames = sprite[frames][fileName] or create(fileName, frames)]]
    self.duration = duration / frames
    self.step = 0
    self.dt = self.duration
    return self
end

---@return love.Quad
function Sprite:getAnim()
    self.dt = self.dt + love.timer.getDelta()
    if self.dt > self.duration then
        self.step = self.step + 1
        if self.step > #self.frames then
            self.step = 1
        end
        self.dt = self.dt - self.duration
    end
    return self.frames[self.step]
end