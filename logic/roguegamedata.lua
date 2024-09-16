local themeInfo, chapterInfo, cardInfos, battleCardInfos
local SetThemeInfo = function(info)
  themeInfo = info
end
local GetThemeInfo = function()
  return themeInfo
end
local SetChapterInfo = function(info)
  chapterInfo = info
end
local GetChapterInfo = function()
  return chapterInfo
end
local UpdateBattleCardInfoList = function()
  if cardInfos then
    battleCardInfos = battleCardInfos or {}
    table.clear(battleCardInfos)
    for i, v in pairs(cardInfos) do
      table.insert(battleCardInfos, v.info)
    end
  end
end
local SetCardInfoList = function(infos)
  cardInfos = infos
  UpdateBattleCardInfoList()
end
local GetCardInfoList = function()
  return cardInfos
end
local GetBattleCardInfoList = function()
  return battleCardInfos
end
local AddOrOverrideCardInfo = function(info)
  if cardInfos then
    local exists = table.keyof(cardInfos, info.cardId, "cardId")
    if exists then
      cardInfos[exists] = info
    else
      table.insert(cardInfos, info)
    end
    UpdateBattleCardInfoList()
  end
end
local GetRecruitableCards = function()
  local info = RogueData.GetRogueInfo()
  return info.allCards
end
local GetInitialTreasures = function()
  if themeInfo then
    return themeInfo.initTreasureIds
  end
end
local GetInitialNumCards = function()
  local info = RogueData.GetRogueInfo()
  return info.initialRecruitCount
end
local GetInitialNumTreasures = function()
  local info = RogueData.GetRogueInfo()
  return info.initialTreasureCount
end
local GetTreasureIdList = function()
  if themeInfo then
    return themeInfo.treasureIds
  end
end
local GetHalidomIdList = function()
  if themeInfo then
    return themeInfo.holyIds
  end
end
local GetTreasureIdListByFilter = function(filter, buffer, param0, param1)
  local list = GetTreasureIdList()
  if list then
    for i, v in ipairs(list) do
      if not filter or type(filter) == "function" and filter(v, param0, param1) then
        buffer = buffer or {}
        table.insert(buffer, v)
      end
    end
  end
end
local GetCardInfo = function(cardId)
  if cardInfos then
    for i, v in ipairs(cardInfos) do
      if v.cardId == cardId then
        return v
      end
    end
  end
end
return {
  SetThemeInfo = SetThemeInfo,
  GetThemeInfo = GetThemeInfo,
  SetChapterInfo = SetChapterInfo,
  GetChapterInfo = GetChapterInfo,
  SetCardInfoList = SetCardInfoList,
  GetCardInfoList = GetCardInfoList,
  GetBattleCardInfoList = GetBattleCardInfoList,
  GetTreasureIdList = GetTreasureIdList,
  GetHalidomIdList = GetHalidomIdList,
  AddOrOverrideCardInfo = AddOrOverrideCardInfo,
  GetRecruitableCards = GetRecruitableCards,
  GetInitialTreasures = GetInitialTreasures,
  GetInitialNumCards = GetInitialNumCards,
  GetInitialNumTreasures = GetInitialNumTreasures,
  GetTreasureIdListByFilter = GetTreasureIdListByFilter,
  GetCardInfo = GetCardInfo
}
