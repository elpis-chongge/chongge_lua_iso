require("RogueBuild01_Camp_GetAttributeTipsWindowByName")
local RogueGameGetAttributeTipsWindow = {}
local uis, contentPane, rewards
local DisplayReward = function(itemId, cnt)
  uis.Main.TipsRegion.WordTxt.text = T(20425, cnt)
end

function RogueGameGetAttributeTipsWindow.ReInitData()
end

function RogueGameGetAttributeTipsWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.RogueGameGetAttributeTipsWindow.package, WinResConfig.RogueGameGetAttributeTipsWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetRogueBuild01_Camp_GetAttributeTipsWindowUis(contentPane)
    rewards = bridgeObj.argTable[1]
    RogueGameGetAttributeTipsWindow.UpdateInfo()
    RogueGameGetAttributeTipsWindow.InitBtn()
  end)
end

function RogueGameGetAttributeTipsWindow.UpdateInfo()
  local titleText = T(20424)
  uis.Main.TipsRegion.NameTxt.text = titleText
  local removed = table.remove(rewards, 1)
  DisplayReward(removed.itemId, removed.count)
end

function RogueGameGetAttributeTipsWindow.InitBtn()
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
      UIMgr:CloseWindow(WinResConfig.RogueGameGetAttributeTipsWindow.name)
    end
  end)
end

function RogueGameGetAttributeTipsWindow.OnClose()
  uis = nil
  contentPane = nil
end

return RogueGameGetAttributeTipsWindow
