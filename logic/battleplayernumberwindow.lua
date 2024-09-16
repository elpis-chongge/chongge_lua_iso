require("Formation_BattlePlayerNumberWindowByName")
local BattlePlayerNumberWindow = {}
local uis, contentPane, preCount, nowCount

function BattlePlayerNumberWindow.ReInitData()
end

function BattlePlayerNumberWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.BattlePlayerNumberWindow.package, WinResConfig.BattlePlayerNumberWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetFormation_BattlePlayerNumberWindowUis(contentPane)
    preCount = bridgeObj.argTable[1]
    nowCount = bridgeObj.argTable[2]
    BattlePlayerNumberWindow.UpdateInfo()
    BattlePlayerNumberWindow.InitBtn()
    SoundUtil.PlayUISfx(SOUND_EVENT_ENUM.LV_UP_NUMBER)
  end)
end

function BattlePlayerNumberWindow.UpdateInfo()
  uis.Main.Word.WordTxt.text = T(10869)
  UIUtil.SetEffectToUI("Assets/Art/Effects/Prefab/UI_prefab/NewGuyFinger/FX_ui_newguide_member_up.prefab", uis.Main.Word.Effect.EffectHolder)
  uis.Main.Region.Before.NumberTxt.text = T(10870, preCount)
  uis.Main.Region.Before.c1Ctr.selectedIndex = 0
  uis.Main.Region.After.NumberTxt.text = T(10870, nowCount)
  uis.Main.Region.After.c1Ctr.selectedIndex = 1
end

function BattlePlayerNumberWindow.InitBtn()
  uis.Main.TouchScreenBtn.onClick:Add(BattlePlayerNumberWindow.Quit)
end

function BattlePlayerNumberWindow.Quit()
  UIMgr:CloseWindow(WinResConfig.BattlePlayerNumberWindow.name)
end

function BattlePlayerNumberWindow.OnClose()
  uis = nil
  contentPane = nil
  preCount, nowCount = nil, nil
end

return BattlePlayerNumberWindow
