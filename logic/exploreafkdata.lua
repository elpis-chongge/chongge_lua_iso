local level, exp, groups, tempGroupCards
local AddOrOverrideGroupInfo = function(groupInfo)
  groups = groups or {}
  local k = table.keyof(groups, groupInfo.groupId, "groupId")
  if not k then
    table.insert(groups, groupInfo)
  else
    groups[k] = groupInfo
  end
end
local GetAllGroupsInfo = function()
  return groups
end
local GetGroupInfo = function(groupId)
  if not groups then
    return
  end
  local k = table.keyof(groups, groupId, "groupId")
  if k then
    return groups[k]
  end
end
local GetGroupIndex = function(groupId)
  if not groups then
    return
  end
  local k = table.keyof(groups, groupId, "groupId")
  return k
end
local SetExp = function(val)
  exp = val
end
local GetExp = function()
  return exp
end
local SetLevel = function(val)
  level = val
end
local GetLevel = function()
  return level
end
local AddOrOverrideCardToTempGroup = function(groupId, cardId, index)
  tempGroupCards = tempGroupCards or {}
  if not tempGroupCards[groupId] then
    tempGroupCards[groupId] = {}
  end
  local k = table.keyof(tempGroupCards[groupId], index, "index")
  if not k then
    table.insert(tempGroupCards[groupId], {cardId = cardId, index = index})
  else
    tempGroupCards[groupId][k].cardId = cardId
  end
  table.sort(tempGroupCards[groupId], function(x, y)
    return x.index < y.index
  end)
end
local GetTempGroupCards = function(groupId)
  if tempGroupCards then
    return tempGroupCards[groupId]
  end
end
local GetTempGroupCard = function(groupId, index)
  local cards = GetTempGroupCards(groupId)
  if cards then
    local k = table.keyof(cards, index, "index")
    if k then
      return cards[k].cardId
    end
  end
end
local GetAllTempGroupCards = function()
  return tempGroupCards
end
local LEVEL_OFFSET_IN_TBL = 70074000
local GetLevelExpThreshold = function(level)
  local expTbl = TableData.GetTable("BaseDispatchLevel")
  for i, v in pairs(expTbl) do
    if i == LEVEL_OFFSET_IN_TBL + level then
      return v.next_exp
    end
  end
end
local GetMaxLevel = function()
  local result = -1
  local expTbl = TableData.GetTable("BaseDispatchLevel")
  for i, v in pairs(expTbl) do
    result = math.max(result, v.level)
  end
  return result
end
local ClearTempGroupCards = function(groupId)
  if tempGroupCards and tempGroupCards[groupId] then
    table.clear(tempGroupCards[groupId])
  end
end
local ClearAllTempGroupCards = function()
  if tempGroupCards then
    table.clear(tempGroupCards)
  end
end
local ClearAllGroupsInfo = function()
  if groups then
    table.clear(groups)
  end
end
return {
  AddOrOverrideGroupInfo = AddOrOverrideGroupInfo,
  GetAllGroupsInfo = GetAllGroupsInfo,
  GetGroupInfo = GetGroupInfo,
  GetGroupIndex = GetGroupIndex,
  SetExp = SetExp,
  SetLevel = SetLevel,
  GetExp = GetExp,
  GetLevel = GetLevel,
  AddOrOverrideCardToTempGroup = AddOrOverrideCardToTempGroup,
  GetTempGroupCards = GetTempGroupCards,
  GetTempGroupCard = GetTempGroupCard,
  GetAllTempGroupCards = GetAllTempGroupCards,
  GetLevelExpThreshold = GetLevelExpThreshold,
  GetMaxLevel = GetMaxLevel,
  ClearTempGroupCards = ClearTempGroupCards,
  ClearAllTempGroupCards = ClearAllTempGroupCards,
  ClearAllGroupsInfo = ClearAllGroupsInfo
}
