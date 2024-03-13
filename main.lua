function love.load()
    require('src')
end

local x, y, w, h, l
x = 0
y = 0
l = 0
w = 10
h = 10
local centerx, centery = 300, 300
local speed = 300

function love.update(dt)
    --[[if love.keyboard.isDown("left") then
        speedx = -100
    elseif love.keyboard.isDown("right") then
        speedx = 100
    end
    if love.keyboard.isDown("down") then
        speedy = 100
    elseif love.keyboard.isDown("up") then
        speedy = -100
    end
    end]]
    --[[if not Vector then
        ---@class Vector: Object
        Vector = Class('Vector')
        ---@class Vector3: Vector
        Vector3 = Class('Vector3', Vector)

        ---@param x float
        ---@param y float
        ---@return Vector
        function Vector:create(x, y)
            self.x = x
            ---@diagnostic disable-next-line: missing-return
            self.y = y
        end

        ---@return Vector3
        function Vector3:create(x, y, z)
            ---@diagnostic disable-next-line: missing-return
            self.z = z
        end

        function Vector:print()
            print(self:getClassName(), self.x, self.y)
        end

        function Vector3:print()
            print(self:getClassName(),self.x, self.y, self.z)
        end

        ---@class Location: Vector
        Location = Class('Location', Vector)

        ---@return Location
        function Location:create(x, y)
            ---@diagnostic disable-next-line: missing-return
        end
    end

    local v1 = Vector:create(1, 2)
    local v2 = Vector3:create(10, 11, 12)

    v1:print()
    v2:print()

    local loc = Location:create(1, 2)
    loc:print()

    local o = Object:create()

    if KeyPressed.mouse1 then
        l = l + dt
        local posx, posy = love.mouse.getPosition()
        local dist = math.distance({centerx, centery}, {posx, posy})
        local angle = math.abp({centerx, centery}, {posx, posy})
        --print(math.abp({0, 0}, {100, 0}))
        --print(math.sin(math.abp({0, 0}, {100, 0})))
        --print(centerx, centery, posx, posy)
        --print(angle)
        if dist > speed * dt then
            dist = speed * dt
        end
        --print(dt, dist)

        centerx = centerx + math.cos(angle) * dist
        centery = centery + math.sin(angle) * dist
        x = centerx + 100 * math.sin(l)
        y = centery + 100 * math.cos(l)
        --x = centerx
        --y = centery
    end]]
end