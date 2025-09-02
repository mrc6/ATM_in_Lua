local History = {}

function History:new(o)
  local obj = o or {}
  setmetatable(obj, self)
  self.__index = self
  return obj
end

return History
