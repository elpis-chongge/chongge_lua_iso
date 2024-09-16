RedDotData = {}
RED_DOT_DATA_TYPE = {
  CARD = 1,
  BADGE = 2,
  TASK = 3,
  PASSPORT = 4,
  GACHA = 5,
  MAIL = 6,
  NOTICE = 7,
  BIOGRAHY = 8,
  ABYSS = 9,
  EXPED = 10,
  STORY = 11,
  GUILD = 12,
  SHOP = 13,
  SIGN = 14,
  CHAT = 15,
  FRIEND = 16,
  FORMATION = 17,
  TOTAL = 18,
  ADVENTURE = 19,
  ARENA_DEFENSE_BUILDING_NEW = 20,
  ARENA_DEFENSE_MAP_NEW = 21,
  ROGUE = 22,
  RESERVATION = 23,
  ACTIVITY_DUNGENON = 24,
  GUILD_WAR = 25
}
local allNode = {}
local homeRedDotMax = TableData.GetConfig(70011100, "BaseFixed").int_value
local homeNode = {}

function RedDotData.Init()
  allNode = {}
  homeNode = {}
end

function RedDotData.Clear()
  allNode = {}
  homeNode = {}
end

local SaveHomeNode = function(node)
  for i, v in pairs(homeNode) do
    if v.com == node.com then
      homeNode[i] = node
      return
    end
  end
  table.insert(homeNode, node)
end
local GetHomeAllRedDot = function()
  local newRed = {}
  for i, v in pairs(homeNode) do
    if v.visible then
      table.insert(newRed, v)
    end
  end
  return newRed
end
local UpdateHomeRedDotLimit = function()
  local node = GetHomeAllRedDot()
  if #node > homeRedDotMax then
    table.sort(node, function(a, b)
      return a.sort < b.sort
    end)
    for i = 1, #node do
      node[i].com:GetChild("Red").visible = i <= homeRedDotMax
    end
  end
end

function RedDotData.AddNode(param)
  local windowName = param.windowName
  if nil == allNode[windowName] then
    allNode[windowName] = {}
  end
  local node = RedDotData.CreateOneNode(param)
  for i, v in pairs(allNode[windowName]) do
    if v.com == node.com then
      allNode[windowName][i] = node
      return
    end
  end
  table.insert(allNode[windowName], node)
end

function RedDotData.UpdateNode(dataType)
  local updateOtherType = false
  if dataType == RED_DOT_DATA_TYPE.CHAT or dataType == RED_DOT_DATA_TYPE.FRIEND then
    updateOtherType = true
  end
  for windowName, nodes in pairs(allNode) do
    for comId, node in pairs(nodes) do
      if node.dataType == dataType or updateOtherType and node.dataType == RED_DOT_DATA_TYPE.TOTAL then
        node:Update()
      end
    end
  end
end

function RedDotData.UpdateNodeByWindowName(windowName)
  if allNode[windowName] then
    for comId, node in pairs(allNode[windowName]) do
      node:Update()
    end
  end
end

function RedDotData.RemoveNode(windowName)
  allNode[windowName] = nil
end

function RedDotData.RemoveOneNode(windowName, com)
  local windowNodeList = allNode[windowName]
  if windowNodeList then
    for i, v in pairs(windowNodeList) do
      if v.com == com then
        table.remove(windowNodeList, i)
        return
      end
    end
  end
end

local FLAG_TYPE_ENUM = {
  NONE = 0,
  RED = 1,
  NEW = 2
}

function RedDotData.CreateOneNode(param)
  local redDotNode = {curFlagType = nil}
  
  function redDotNode:Init()
    self.visibleFunc = nil
    self.newFlagVisibleFunc = nil
    for i, v in pairs(param) do
      self[i] = v
    end
    self:Update()
  end
  
  function redDotNode:Update()
    self:UpdateVisible()
  end
  
  function redDotNode:UpdateVisible()
    local com = self.com
    if nil == com then
      return
    end
    local flag = com:GetController(self.newFlagName or "Flag")
    local visibleNew
    if self.newFlagVisibleFunc and flag then
      visibleNew = self.newFlagVisibleFunc()
      if visibleNew then
        self.curFlagType = FLAG_TYPE_ENUM.NEW
        if self.onlyNew then
          flag.selectedIndex = 1
        else
          flag.selectedIndex = 2
          return
        end
      end
    end
    if self.visibleFunc then
      local visible = self.visibleFunc()
      if flag and nil == self.onlyNew then
        if visible then
          flag.selectedIndex = 1
          self.curFlagType = FLAG_TYPE_ENUM.RED
          return
        end
      else
        local red = self.com:GetChild("Red")
        if red and not red.isDisposed then
          red.visible = visible
          if visible then
            self.curFlagType = FLAG_TYPE_ENUM.RED
          else
            self.curFlagType = FLAG_TYPE_ENUM.NONE
          end
          if self.homeLimitSort then
            SaveHomeNode({
              visible = visible,
              com = self.com,
              sort = self.homeLimitSort
            })
            UpdateHomeRedDotLimit()
          end
        end
      end
    end
    if flag and not visibleNew then
      flag.selectedIndex = 0
      self.curFlagType = FLAG_TYPE_ENUM.NONE
    end
  end
  
  redDotNode:Init()
  return redDotNode
end
