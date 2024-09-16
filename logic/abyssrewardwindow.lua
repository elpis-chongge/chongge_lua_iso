require("AbyssReward_AbyssRewardWindowByName")
local AbyssRewardWindow = {}
local uis, contentPane

function AbyssRewardWindow.ReInitData()
end

function AbyssRewardWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.AbyssRewardWindow.package, WinResConfig.AbyssRewardWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetAbyssReward_AbyssRewardWindowUis(contentPane)
    AbyssRewardWindow.UpdateInfo()
    AbyssRewardWindow.InitBtn()
  end)
end

function AbyssRewardWindow.UpdateInfo()
  ld("AbyssExplore")
  AbyssExploreMgr.GetExploreInfo(function(msg)
    if msg and msg.manorInfo then
      local manorInfo = msg.manorInfo
      local rewarded = manorInfo.rookieReward
      local rookieFinished = manorInfo.rookieFinished
      uis.Main.RewardTips.c1Ctr.selectedIndex = rookieFinished and (rewarded and 2 or 1) or 0
      local panel = uis.Main.RewardTips
      panel.NameTxt.text = T(20505)
      panel.RewardTxt.text = T(20506)
      local wordlist = panel.root:GetChild("WordTxt")
      
      function wordlist.itemRenderer(i, gcmp)
        UIUtil.SetText(gcmp, T(20507), "WordTxt")
      end
      
      wordlist.numItems = 1
      local arr = TableData.GetConfig(70010824, "BaseFixed").array_value
      local rewards = Split(arr, "|")
      local itemlist = panel.ItemList
      
      function itemlist.itemRenderer(i, gcmp)
        local reward = rewards[i + 1]
        local splits = Split(reward, ":")
        local itemType, itemId, count = splits[1], splits[2], splits[3]
        UIUtil.ShowItemFrame(tonumber(itemId), gcmp, tonumber(count), nil, function()
          UIUtil.CommonItemClickCallback(tonumber(itemId), tonumber(itemType))
        end)
      end
      
      itemlist.numItems = #rewards
      UIUtil.SetText(panel.GetBtn, T(397), "NameTxt")
      UIUtil.SetText(panel.Complete.root, T(443), "WordTxt")
      UIUtil.SetText(panel.Lock.root, T(20508), "WordTxt")
    end
  end)
end

function AbyssRewardWindow.InitBtn()
  uis.Main.TouchScreenBtn.onClick:Set(function()
    UIMgr:CloseWindow(WinResConfig.AbyssRewardWindow.name)
  end)
  uis.Main.RewardTips.GetBtn.onClick:Set(function()
    if AbyssExploreMgr and AbyssExploreMgr.Exists() then
      AbyssExploreService.GetAbyssNoviceBonusReq(function()
        UIMgr:CloseWindow(WinResConfig.AbyssRewardWindow.name)
      end)
    else
      Net.Send(Proto.MsgName.ManorFetchRookieRewardReq, nil, function(msg)
        GetItemTips.Show(msg.rewards)
        UIMgr:CloseWindow(WinResConfig.AbyssRewardWindow.name)
      end)
    end
  end)
end

function AbyssRewardWindow.OnClose()
  uis = nil
  contentPane = nil
end

return AbyssRewardWindow
