require("RaidBoss_QuickRewardWindowByName")
local RaidBossQuickRewardWindow = {}
local uis, contentPane, rewards, distinct

function RaidBossQuickRewardWindow.ReInitData()
end

function RaidBossQuickRewardWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.RaidBossQuickRewardWindow.package, WinResConfig.RaidBossQuickRewardWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetRaidBoss_QuickRewardWindowUis(contentPane)
    rewards = bridgeObj.argTable[1]
    RaidBossQuickRewardWindow.UpdateInfo()
    RaidBossQuickRewardWindow.InitBtn()
  end)
end

function RaidBossQuickRewardWindow.UpdateInfo()
  local titleText = T(20282)
  uis.Main.QuickRewardContent.TitleTxt.text = titleText
  distinct = distinct or {}
  table.clear(distinct)
  for _, v in pairs(rewards) do
    local item = v.item
    local index = table.keyof(distinct, item.itemId, "itemId")
    if not index then
      table.insert(distinct, {
        itemId = item.itemId,
        count = item.count,
        type = item.tupleType,
        uid = item.uid
      })
    else
      local cnt = distinct[index].count
      distinct[index].count = cnt + item.count
    end
  end
  local list = uis.Main.QuickRewardContent.ItemList
  
  function list.itemRenderer(i, gcmp)
    local item = distinct[i + 1]
    UIUtil.ShowItemFrame(item.itemId, gcmp, item.count)
    gcmp.alpha = 0
    PlayUITrans(gcmp, "up", nil, i * 0.08)
    gcmp.onClick:Set(function()
      UIUtil.CommonItemClickCallback(item.itemId, item.type)
    end)
  end
  
  list.numItems = #distinct
end

function RaidBossQuickRewardWindow.InitBtn()
  uis.Main.TouchScreenBtn.onClick:Set(function()
    UIMgr:CloseWindow(WinResConfig.RaidBossQuickRewardWindow.name)
  end)
end

function RaidBossQuickRewardWindow.OnClose()
  uis = nil
  contentPane = nil
end

return RaidBossQuickRewardWindow
