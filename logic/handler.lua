require("Class")
local Handler = class()

function Handler:ctor()
  self.handles = {}
  self.inHand = false
  self.hasRemoveHand = false
end

function Handler:RunHandles(hands, data)
  self.inHand = true
  for _, ft in pairs(hands) do
    if nil ~= ft then
      if nil ~= ft.t then
        ft.func(ft.t, data)
      else
        ft.func(data)
      end
    end
  end
  self.inHand = false
  self:innerRemove()
end

function Handler:RunId(msgId, data)
  if self.handles[msgId] == nil then
    return
  end
  self:RunHandles(self.handles[msgId].table, data)
end

function Handler:getHandIndex(msgId, handle)
  if self.handles[msgId] == nil then
    return -1
  end
  local hds = self.handles[msgId].table
  for i = 1, #hds do
    if hds[i].func == handle and not hds[i].markRemove then
      return i
    end
  end
  return -1
end

function Handler:GetHandleCount(msgId)
  if self.handles[msgId] == nil then
    return 0
  end
  local hds = self.handles[msgId].table
  local count = 0
  for i = 1, #hds do
    if nil ~= hds[i].func and not hds[i].markRemove then
      count = count + 1
    end
  end
  return count
end

function Handler:AddHandle(msgId, handle, tableObj)
  local index = 1
  local t
  if self.handles[msgId] == nil then
    t = {
      hasRemveEle = false,
      table = {}
    }
    self.handles[msgId] = t
  else
    local existIndex = self:getHandIndex(msgId, handle)
    if -1 ~= existIndex then
      return false
    end
    t = self.handles[msgId]
    index = #t.table + 1
  end
  t.table[index] = {
    func = handle,
    t = tableObj,
    markRemove = false
  }
  return true
end

function Handler:RemoveHandle(msgId, handle)
  if self.handles[msgId] == nil then
    return false
  end
  local existIndex = self:getHandIndex(msgId, handle)
  if -1 == existIndex then
    return false
  end
  self.handles[msgId].hasRemveEle = true
  self.handles[msgId].table[existIndex].markRemove = true
  self.hasRemoveHand = true
  if not self.inHand then
    self:innerRemove()
  end
  return true
end

function Handler:RemoveAllHandle(msgId)
  if self.handles[msgId] == nil then
    return
  end
  self.handles[msgId].hasRemveEle = true
  local hds = self.handles[msgId].table
  for i = 1, #hds do
    hds[i].markRemove = true
  end
  self.hasRemoveHand = true
  if not self.inHand then
    self:innerRemove()
  end
  return true
end

function Handler:innerRemove()
  if self.hasRemoveHand then
    for _, t in pairs(self.handles) do
      if t.hasRemveEle then
        for i = #t.table, 1, -1 do
          if t.table[i].markRemove then
            table.remove(t.table, i)
          end
        end
        t.hasRemveEle = false
      end
    end
  end
  self.hasRemoveHand = false
end

function GetNewHandler()
  return Handler:new()
end
