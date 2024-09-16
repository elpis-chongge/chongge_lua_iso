require("Formation_StarConditionTipsWindowByName")
local StarConditionTipsWindow = {}
local uis, contentPane

function StarConditionTipsWindow.ReInitData()
end

function StarConditionTipsWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.StarConditionTipsWindow.package, WinResConfig.StarConditionTipsWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetFormation_StarConditionTipsWindowUis(contentPane)
    local stageId = bridgeObj.argTable[1]
    StarConditionTipsWindow.UpdateInfo(stageId)
    StarConditionTipsWindow.InitBtn()
  end)
end

function StarConditionTipsWindow.UpdateInfo(stageId)
  local challenges = ExpeditionMgr.GetAchievedChallenges(stageId)
  local goalTitle = T(20234)
  UIUtil.SetText(uis.Main.Title.root, goalTitle)
  local goallist = uis.Main.TipsList
  
  function goallist.itemRenderer(i, gcmp)
    local challenge = challenges[i + 1]
    local name = challenge.name
    local target = gcmp:GetChild("Target")
    UIUtil.SetText(target, name(), "WordTxt")
    target.alpha = 0
    PlayUITrans(gcmp, "up", nil, i * 0.1)
    ChangeUIController(target, "c1", challenge.achieved and 1 or 0)
  end
  
  goallist.numItems = #challenges
end

function StarConditionTipsWindow.InitBtn()
  uis.Main.TouchScreenBtn.onClick:Set(StarConditionTipsWindow.Close)
end

function StarConditionTipsWindow.Close()
  UIMgr:CloseWindow(WinResConfig.StarConditionTipsWindow.name)
end

function StarConditionTipsWindow.OnClose()
  uis = nil
  contentPane = nil
end

return StarConditionTipsWindow
