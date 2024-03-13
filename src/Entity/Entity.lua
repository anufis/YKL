---@class Entity: Object
---@field x integer
---@field y integer
---@field hp integer
---@field maxhp integer
---@field sprite love.Image
Entity = Class("Entity")

function Entity:create()
    self.x = -1000000
    self.y = -1000000
    self.maxhp = 1
    self.hp = 1
end