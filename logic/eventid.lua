local csEventID = CS.EventID
EventID = {DoQuset = 6000100}
setmetatable(EventID, {
  __index = function(t, k)
    local value = csEventID[k]
    if nil ~= value then
      t[k] = value
      return value
    end
  end
})
