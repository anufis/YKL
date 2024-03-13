require "src._lib.table"

local simplecopy = table.simplecopy

---@class Object
---@field package __meta table
Object = {}

local meta = {
    __index = Object,
    __type = Object,
    __name = "Object"
}
Object.__meta = meta

local function creator(cls, obj, ...)
    if not cls then
        return
    end
    creator(cls.__meta.__super, obj, ...)
    if cls.__create then
        cls.__create(obj, ...)
    end
    return obj
end

---@generic T: Object
---@param class T
---@return T
local function create(class, ...)
    ---@diagnostic disable-next-line: undefined-field
    return creator(class, setmetatable({}, class.__meta), ...)
end

---@protected
function Object:getClassName()
    return self.__meta.__name
end

---@generic T: Object
---@param self T
---@return T
function Object:create(...)
    rawset(self, "create", create)
    return create(self, ...)
end

local function index(t, k)
    if k == "create" then
        return nil
    else
        local s = rawget(t, "__super")
        if s then
            return s.__metaself.__index
        end
    end
    return nil
end

local function newindex(t, k, v)
    if k == "create" then
        rawset(t, "__create", v)
        rawset(t, "create", create)
        t.__metaself.__newindex = nil
        t.__metaself.__index = t.__meta.__super
    else
        rawset(t, k, v)
    end
end

---@param name string
---@param super Object|nil
---@return Object
function Class(name, super)
    super = super or Object
    local metaself = simplecopy(super.__meta)
    metaself.__index = index
    metaself.__newindex = newindex
    local cls = setmetatable({}, metaself)
    local meta = simplecopy(super.__meta)
    rawset(cls, "__metaself", metaself)
    cls.__meta = meta
    meta.__index = cls
    meta.__type = cls
    meta.__name = name
    meta.__super = super
    return cls
end