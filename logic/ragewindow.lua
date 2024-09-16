require("Battle_RageWindowByName")
local RageWindow = {}
local uis, contentPane, tempBattleUnit

function RageWindow.ReInitData()
end

function RageWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.RageWindow.package, WinResConfig.RageWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetBattle_RageWindowUis(contentPane)
    tempBattleUnit = bridgeObj.argTable[1]
    RageWindow.UpdateInfo()
    RageWindow.InitBtn()
    SoundUtil.PlayUISfx(SOUND_EVENT_ENUM.BOSS_TRANSFORM)
  end)
end

function RageWindow.UpdateInfo()
  uis.Main.WordTxt.text = T(11037)
  uis.Main.NameTxt.text = tempBattleUnit:GetName()
end

function RageWindow.InitBtn()
  uis.Main.TouchScreenBtn.onClick:Add(RageWindow.TouchClose)
  uis.Main.RageLookBtn.onClick:Add(RageWindow.TouchLookSkill)
end

function RageWindow.TouchLookSkill()
  OpenWindow(WinResConfig.RageSkillWindow.name, nil, tempBattleUnit.monsterIdHistory)
end

function RageWindow.TouchClose()
  UIMgr:CloseWindow(WinResConfig.RageWindow.name)
  BattleControl.Continue()
end

function RageWindow.OnShowAnimationEnd()
end

function RageWindow.OnClose()
  tempBattleUnit = nil
  uis = nil
  contentPane = nil
end

return RageWindow
