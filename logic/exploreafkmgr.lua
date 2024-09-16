local IsCardSelected = function(groupId, cardId)
  local tempCards = ExploreAFKData.GetTempGroupCards(groupId)
  if tempCards then
    return table.keyof(tempCards, cardId, "cardId")
  end
end
local IsReady = function(groupId)
  local tempCards = ExploreAFKData.GetTempGroupCards(groupId)
  local config = TableData.GetConfig(groupId, "BaseDispatchTeam")
  local num = #config.job_num
  if tempCards and #tempCards == num then
    return true
  end
  return false
end
local IsCardAvailable = function(cardId)
  local groups = ExploreAFKData.GetAllGroupsInfo()
  if groups then
    for _, group in ipairs(groups) do
      if table.keyof(group.cards, cardId) then
        return false
      end
    end
  end
  return true
end
local StartDispatch = function(groupId, rewardId, extraIndex, rspCallback)
  local cards = ExploreAFKData.GetTempGroupCards(groupId)
  local cardIdList = {}
  for i, v in ipairs(cards) do
    table.insert(cardIdList, v.cardId)
  end
  ExploreAFKService.StartExploreAFKReq(groupId, rewardId, cardIdList, extraIndex, rspCallback)
end
return {
  IsCardSelected = IsCardSelected,
  IsReady = IsReady,
  IsCardAvailable = IsCardAvailable,
  StartDispatch = StartDispatch
}
