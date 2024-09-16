require("Expedition_RewardWindowByName")
local ExpeditionRewardWindow = {}
local uis, contentPane
local locked_eff = "Assets/Art/Effects/Prefab/UI_prefab/Expedition/FX_ui_expedition_geticon_get.prefab"
local unlocked_eff = "Assets/Art/Effects/Prefab/UI_prefab/Expedition/FX_ui_expedition_geticon_unget.prefab"
local RefreshRewardsInfo = function()
  local expedData = ExpeditionData.GetData()
  local gotRewards = ExpeditionData.GetRewardsInfo()
  local numStars = expedData.highPassStar
  local rewradlist = uis.Main.RewardList
  rewradlist.defaultItem = "ui://sksayrjcn76ju"
  local rewardTbl = TableData.GetTable("BaseExpeditionReward")
  local rewards = {}
  for i, v in pairs(rewardTbl) do
    table.insert(rewards, v)
  end
  table.sort(rewards, function(x, y)
    local xGot = table.contain(gotRewards, x.id)
    local yGot = table.contain(gotRewards, y.id)
    if xGot ~= yGot then
      return not xGot
    end
    return x.id < y.id
  end)
  
  function rewradlist.itemRenderer(i, gcmp)
    local conf = rewards[i + 1]
    local rewardId = conf.id
    local subgcmp = gcmp:GetChild("RewardTips")
    local btn = subgcmp
    local stateCtr = subgcmp:GetController("c1")
    UIUtil.SetText(subgcmp, T(20241), "WordTxt")
    UIUtil.SetText(subgcmp, T(20243), "GetTxt")
    local requiredNum = conf.unlock_points
    UIUtil.SetText(subgcmp, requiredNum, "WordNumberTxt")
    UIUtil.SetText(subgcmp, string.format("[color=#ffffff][size=40]%s[/size][/color]/%s", numStars, requiredNum), "ProgressTxt")
    local rewardStrings = conf.reward
    local itemlist = subgcmp:GetChild("ItemList")
    itemlist.defaultItem = "ui://sksayrjcn76js"
    
    function itemlist.itemRenderer(j, ggcmp)
      local rewardStr = rewardStrings[j + 1]
      local splits = Split(rewardStr, ":")
      local itemId, itemCnt = tonumber(splits[2]), tonumber(splits[3])
      UIUtil.ShowItemFrame(itemId, ggcmp, itemCnt)
    end
    
    itemlist.numItems = #rewardStrings
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
  
  rewradlist.numItems = #rewards
end

function ExpeditionRewardWindow.ReInitData()
end

function ExpeditionRewardWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.ExpeditionRewardWindow.package, WinResConfig.ExpeditionRewardWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetExpedition_RewardWindowUis(contentPane)
    ld("Expedition", function()
      ExpeditionService.GetExpeditionInfoReq()
    end)
    ExpeditionRewardWindow.UpdateInfo()
    ExpeditionRewardWindow.InitBtn()
  end)
end

function ExpeditionRewardWindow.UpdateInfo()
  CurrencyReturnWindow.SetCurrencyReturn(WinResConfig.ExpeditionRewardWindow.name, uis.Main.CurrencyReturn)
  uis.Main.BackGround.BackGroundLoader.url = UIUtil.GetResUrl(TableData.GetConfig(11701, "BaseFeature").back_ground)
  local title = T(20048)
  uis.Main.RewardTitle.NameTxt.text = title
  local allStars = ExpeditionMgr.GetAllStageStars()
  local expedData = ExpeditionData.GetData()
  local content = string.format("[color=#ffcc00][size=40]%s[/size][/color]/%s", expedData.highPassStar, allStars)
  uis.Main.RewardStarNumber.NumberTxt.text = content
end

function ExpeditionRewardWindow.InitBtn()
end

function ExpeditionRewardWindow.OnClose()
  uis = nil
  contentPane = nil
end

function ExpeditionRewardWindow.HandleMessage(msgId, para)
  if msgId == WindowMsgEnum.ExpeditionRewardWindow.REFRESH_REWARDS_INFO then
    RefreshRewardsInfo()
  end
end

return ExpeditionRewardWindow
