local GetExploreAFKInfoReq = function(rspCallback)
  Net.Send(Proto.MsgName.GetDispatchInfoReq, nil, rspCallback)
end
local GetExploreAFKInfoRsp = function(msg)
  local exp = msg.exp
  local level = msg.level
  ExploreAFKData.SetExp(exp)
  ExploreAFKData.SetLevel(level)
  local groups = msg.groups
  ExploreAFKData.ClearAllGroupsInfo()
  if groups then
    for _, groupInfo in ipairs(groups) do
      ExploreAFKData.AddOrOverrideGroupInfo(groupInfo)
    end
  end
end
local StartExploreAFKReq = function(groupId, rewardId, cardsIdList, extraIndex, rspCallback)
  local msg = {
    groupId = groupId,
    rewardId = rewardId,
    cards = cardsIdList,
    extraPos = extraIndex
  }
  Net.Send(Proto.MsgName.StartDispatchInfoReq, msg, rspCallback)
end
local StartExploreAFKRsp = function(msg)
  local groups = msg.groups
  ExploreAFKData.ClearAllGroupsInfo()
  if groups then
    for _, groupInfo in ipairs(groups) do
      ExploreAFKData.AddOrOverrideGroupInfo(groupInfo)
    end
  end
end
local GetExploreAFKRewardsReq = function(groupId, rspCallback)
  Net.Send(Proto.MsgName.RewardDispatchInfoReq, {groupId = groupId}, rspCallback)
end
local GetExploreAFKRewardsRsp = function(msg)
  local exp = msg.exp
  local level = msg.level
  local prevExp = ExploreAFKData.GetExp()
  local prevLevel = ExploreAFKData.GetLevel()
  local allGroupsInfo = ExploreAFKData.GetAllGroupsInfo()
  ExploreAFKData.SetExp(exp)
  ExploreAFKData.SetLevel(level)
  local rewardId, cards
  for _, v in ipairs(allGroupsInfo) do
    if not table.keyof(msg.groups, v.groupId, "groupId") then
      cards = v.cards
      rewardId = v.rewardId
      break
    end
  end
  local groups = msg.groups
  ExploreAFKData.ClearAllGroupsInfo()
  if groups then
    for _, groupInfo in ipairs(groups) do
      ExploreAFKData.AddOrOverrideGroupInfo(groupInfo)
    end
  end
  OpenWindow(WinResConfig.ExploreSettlementWindow.name, nil, prevExp, prevLevel, rewardId, cards, msg.drops)
end
local CancelExploreAFKReq = function(groupId, rspCallback)
  Net.Send(Proto.MsgName.CancelDispatchInfoReq, {groupId = groupId}, rspCallback)
end
local CancelExploreAFKRsp = function(msg)
  local returnItem = msg.returnItem
  if returnItem then
    FloatTipsUtil.ShowPopupItemTips(returnItem.itemId, returnItem.count)
  end
  local groups = msg.groups
  ExploreAFKData.ClearAllGroupsInfo()
  if groups then
    for _, groupInfo in ipairs(groups) do
      ExploreAFKData.AddOrOverrideGroupInfo(groupInfo)
    end
  end
end
local Init = function()
  Net.AddListener(Proto.MsgName.GetDispatchInfoRsp, GetExploreAFKInfoRsp)
  Net.AddListener(Proto.MsgName.StartDispatchInfoRsp, StartExploreAFKRsp)
  Net.AddListener(Proto.MsgName.RewardDispatchInfoRsp, GetExploreAFKRewardsRsp)
  Net.AddListener(Proto.MsgName.CancelDispatchInfoRsp, CancelExploreAFKRsp)
end
Init()
return {
  GetExploreAFKInfoReq = GetExploreAFKInfoReq,
  StartExploreAFKReq = StartExploreAFKReq,
  GetExploreAFKRewardsReq = GetExploreAFKRewardsReq,
  CancelExploreAFKReq = CancelExploreAFKReq
}
