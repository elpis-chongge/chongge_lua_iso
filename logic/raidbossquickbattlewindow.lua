require("RaidBoss_QuickBattleWindowByName")
local RaidBossQuickBattleWindow = {}
local uis, contentPane, sweepingNum, stageId
local RefreshSweepingDisplay = function(maxSweepingNum)
  local content = string.format("%s[color=#949494]/%s[/color]", sweepingNum, maxSweepingNum)
  uis.Main.QuickBattleContent.NumberRegion.NumberTxt.text = content
end

function RaidBossQuickBattleWindow.ReInitData()
end

function RaidBossQuickBattleWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.RaidBossQuickBattleWindow.package, WinResConfig.RaidBossQuickBattleWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetRaidBoss_QuickBattleWindowUis(contentPane)
    stageId = bridgeObj.argTable[1]
    sweepingNum = 1
    RaidBossQuickBattleWindow.UpdateInfo()
    RaidBossQuickBattleWindow.InitBtn()
  end)
end

function RaidBossQuickBattleWindow.UpdateInfo()
  local titleText = T(20279)
  local descText = T(20280)
  local sureBtnText = T(20281)
  local panel = uis.Main.QuickBattleContent
  panel.TitleTxt.text = titleText
  panel.WordTxt.text = descText
  UIUtil.SetBtnText(panel.SureBtn, sureBtnText)
  local isHard = RaidBossMgr.IsHardestLevel(stageId)
  local maxSweepingNum = RaidBossData.GetRemainingChallenges(isHard)
  panel.NumberRegion.AddBtn.onClick:Set(function()
    sweepingNum = math.min(maxSweepingNum, sweepingNum + 1)
    RefreshSweepingDisplay(maxSweepingNum)
  end)
  panel.NumberRegion.ReduceBtn.onClick:Set(function()
    sweepingNum = math.max(1, sweepingNum - 1)
    RefreshSweepingDisplay(maxSweepingNum)
  end)
  RefreshSweepingDisplay(maxSweepingNum)
end

function RaidBossQuickBattleWindow.InitBtn()
  uis.Main.TouchScreenBtn.onClick:Set(function()
    UIMgr:CloseWindow(WinResConfig.RaidBossQuickBattleWindow.name)
  end)
  uis.Main.QuickBattleContent.SureBtn.onClick:Set(function()
    RaidBossService.SweepReq(stageId, sweepingNum)
    UIMgr:CloseWindow(WinResConfig.RaidBossQuickBattleWindow.name)
  end)
end

function RaidBossQuickBattleWindow.OnClose()
  uis = nil
  contentPane = nil
end

return RaidBossQuickBattleWindow
