require("Arena_ExplainWindowByName")
local ArenaExplainWindow = {}
local uis, contentPane, data

function ArenaExplainWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.ArenaExplainWindow.package, WinResConfig.ArenaExplainWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetArena_ExplainWindowUis(contentPane)
    data = TableData.GetConfig(FEATURE_ENUM.ADVENTURE_ARENA, "BaseFeature")
    ArenaExplainWindow.UpdateTextDisplay()
    ArenaExplainWindow.InitBtn()
    ArenaExplainWindow.InitList()
  end)
end

function ArenaExplainWindow.UpdateTextDisplay()
  uis.Main.Explain1.ExplainTxt.text = T(414)
  uis.Main.Explain1.RewardTxt.text = T(416)
  
  function uis.Main.Explain1.ExplainWordList.itemRenderer(i, item)
    if data.rule_des then
      item:GetChild("WordTxt").text = data.rule_des()
    end
  end
  
  uis.Main.Explain1.ExplainWordList.numItems = 1
end

function ArenaExplainWindow.GetData(type)
  local tb = {}
  local config = TableData.GetTable("BaseArenaRankReward")
  for i, v in pairs(config) do
    if v.type == type then
      table.insert(tb, v)
    end
  end
  return tb
end

function ArenaExplainWindow.InitList()
  local rewardData = {}
  if data.rule_list then
    rewardData = ArenaExplainWindow.GetData(data.rule_list)
  end
  local rankData
  
  function uis.Main.Explain1.RewardShowList.itemRenderer(i, item)
    rankData = rewardData[i + 1]
    if rankData.rank_low == rankData.rank_high then
      item:GetChild("RankTxt").text = T(418, rankData.rank_low)
    else
      item:GetChild("RankTxt").text = T(417, rankData.rank_high, rankData.rank_low)
    end
    ArenaExplainWindow.ShowRewardIcon(item:GetChild("RewardItemList"), rankData.reward)
  end
  
  uis.Main.Explain1.RewardShowList.numItems = #rewardData
end

function ArenaExplainWindow.ShowRewardIcon(list, reward)
  local tb = GetConfigItemList(reward)
  local item
  for i, v in pairs(tb) do
    item = UIMgr:CreateObject("CommonResource", "ItemFrame")
    local itemConfig = TableData.GetConfig(v.id, "BaseItem")
    if itemConfig then
      item:GetChild("ItemLoader").url = UIUtil.GetResUrl(itemConfig.icon)
    end
    ChangeUIController(item, "c3", 1)
    item:GetChild("NumberTxt").text = T(419, v.value)
    list:AddChild(item)
  end
end

function ArenaExplainWindow.InitBtn()
  uis.Main.TouchScreenBtn.onClick:Set(function()
    UIMgr:CloseWindow(WinResConfig.ArenaExplainWindow.name)
  end)
end

function ArenaExplainWindow.HandleMessage(msgId, para)
end

function ArenaExplainWindow.OnClose()
  uis = nil
  contentPane = nil
  data = nil
end

return ArenaExplainWindow
