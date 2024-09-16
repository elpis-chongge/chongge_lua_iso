require("RogueBuild01_Camp_GetCurrencyTipsWindowByName")
local RogueGameGetCurrencyTipsWindow = {}
local uis, contentPane, rewards
local DisplayReward = function(itemId, cnt)
  uis.Main.TipsRegion.WordTxt.text = T(20427, cnt)
end

function RogueGameGetCurrencyTipsWindow.ReInitData()
end

function RogueGameGetCurrencyTipsWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.RogueGameGetCurrencyTipsWindow.package, WinResConfig.RogueGameGetCurrencyTipsWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetRogueBuild01_Camp_GetCurrencyTipsWindowUis(contentPane)
    rewards = bridgeObj.argTable[1]
    RogueGameGetCurrencyTipsWindow.UpdateInfo()
    RogueGameGetCurrencyTipsWindow.InitBtn()
  end)
end

function RogueGameGetCurrencyTipsWindow.UpdateInfo()
  local titleText = T(20426)
  uis.Main.TipsRegion.NameTxt.text = titleText
  local removed = table.remove(rewards, 1)
  DisplayReward(removed.itemId, removed.count)
end

function RogueGameGetCurrencyTipsWindow.InitBtn()
  uis.Main.TipsRegion.CloseBtn.onClick:Set(function()
    local root = uis.Main.root
    if IsUITransPlaying(root, "in") or IsUITransPlaying(root, "out") then
      return
    end
    if #rewards > 0 then
      PlayUITrans(root, "out", function()
        local removed = table.remove(rewards, 1)
        DisplayReward(removed.itemId, removed.count)
        PlayUITrans(root, "in")
      end)
    else
      UIMgr:CloseWindow(WinResConfig.RogueGameGetCurrencyTipsWindow.name)
    end
  end)
end

function RogueGameGetCurrencyTipsWindow.OnClose()
  uis = nil
  contentPane = nil
end

return RogueGameGetCurrencyTipsWindow
