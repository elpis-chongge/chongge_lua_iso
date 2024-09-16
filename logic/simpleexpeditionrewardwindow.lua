require("Abyss_ExpeditionRewardWindowByName")
local SimpleExpeditionRewardWindow = {}
local uis, contentPane, rewardBuffer
local RewardItemRenderer = function(i, gcmp)
  local gotRewards = ExpeditionData.GetRewardsInfo()
  local conf = rewardBuffer[i + 1]
  local rewardId = conf.id
  local subgcmp = gcmp:GetChild("Item")
  local btn = subgcmp
  local stateCtr = subgcmp:GetController("c1")
  UIUtil.SetText(subgcmp, T(20241), "WordTxt")
  UIUtil.SetText(subgcmp, T(20243), "GetTxt")
  local requiredNum = conf.unlock_points
  UIUtil.SetText(subgcmp, requiredNum, "StarNumberTxt")
  local rewardStrings = conf.reward
  local rewardStr = rewardStrings[1]
  local splits = Split(rewardStr, ":")
  local itemId, itemCnt = tonumber(splits[2]), tonumber(splits[3])
  UIUtil.ShowItemFrame(itemId, subgcmp:GetChild("Item"), itemCnt)
  local got = false
  if table.contain(gotRewards, rewardId) then
    got = true
  end
  local points = type(conf.unlock_points) == "number" and conf.unlock_points or 0
  local lock = points > ExpeditionData.GetData().highPassStar
  stateCtr.selectedIndex = got and 2 or lock and 0 or 1
  btn.onClick:Set(function()
    if not got and not lock then
      ExpeditionService.GetExpeditionRewardReq(rewardId)
    else
      OpenWindow(WinResConfig.RewardShowWindow.name, nil, {
        reward = conf.reward
      })
    end
  end)
end
local RefreshRewards = function()
  local expedData = ExpeditionData.GetData()
  local gotRewards = ExpeditionData.GetRewardsInfo()
  local numStars = expedData.highPassStar
  local panel = uis.Main.ExpeditionReward1
  panel.Total.WordTxt.text = T(20245)
  panel.Total.NumberTxt.text = numStars
  local rewardTbl = TableData.GetTable("BaseExpeditionReward")
  rewardBuffer = rewardBuffer or {}
  table.clear(rewardBuffer)
  for i, v in pairs(rewardTbl) do
    table.insert(rewardBuffer, v)
  end
  table.sort(rewardBuffer, function(x, y)
    local xGot = table.contain(gotRewards, x.id)
    local yGot = table.contain(gotRewards, y.id)
    if xGot ~= yGot then
      return not xGot
    end
    return x.id < y.id
  end)
  panel.RewardList.numItems = #rewardBuffer
end

function SimpleExpeditionRewardWindow.ReInitData()
end

function SimpleExpeditionRewardWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.SimpleExpeditionRewardWindow.package, WinResConfig.SimpleExpeditionRewardWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetAbyss_ExpeditionRewardWindowUis(contentPane)
    SimpleExpeditionRewardWindow.UpdateInfo()
    SimpleExpeditionRewardWindow.InitBtn()
  end)
end

function SimpleExpeditionRewardWindow.UpdateInfo()
  uis.Main.ExpeditionReward1.RewardList.itemRenderer = RewardItemRenderer
  RefreshRewards()
end

function SimpleExpeditionRewardWindow.InitBtn()
  uis.Main.TouchScreenBtn.onClick:Set(function()
    UIMgr:CloseWindow(WinResConfig.SimpleExpeditionRewardWindow.name)
  end)
end

function SimpleExpeditionRewardWindow.OnShown()
  if UIMgr:IsShowFromHide(WinResConfig.SimpleExpeditionRewardWindow.name) then
    local rewradlist = uis.Main.ExpeditionReward1.RewardList
    local rewardTbl = TableData.GetTable("BaseExpeditionReward")
    rewradlist.numItems = table.getLen(rewardTbl)
  end
end

function SimpleExpeditionRewardWindow.OnClose()
  uis = nil
  contentPane = nil
  rewardBuffer = nil
end

function SimpleExpeditionRewardWindow.HandleMessage(msgId, para)
  if msgId == WindowMsgEnum.SimpleExpeditionRewardWindow.REFRESH_REWARDS_INFO then
    RefreshRewards()
  end
end

return SimpleExpeditionRewardWindow
