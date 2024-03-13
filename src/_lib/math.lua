---@class mathlib
local math = math
local sqrt = math.sqrt
local atan2 = math.atan2

---@param pos1 Vector
---@param pos2 Vector
---@return float
function math.distance(pos1, pos2)
    local x = pos2[1] - pos1[1]
    local y = pos2[2] - pos1[2]
    return sqrt(x * x + y * y)
end

function math.abp(pos1, pos2)
    return atan2(pos2[2] - pos1[2], pos2[1] - pos1[1])
end