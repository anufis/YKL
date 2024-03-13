---@generic T
---@param t T
---@return T
function table.simplecopy(t)
    local r = {}
    for k, v in pairs(t) do
        r[k] = v
    end
    return r
end

function table.clear(t)
    for k, v in pairs(t) do
        t[k] = nil
    end
end