require("ActivityDungeon1001_PassportUp_LevelUpTipsWindowByName")
local Activity2PassportLevelUpTipsWindow = {}
local uis, contentPane, lv

function Activity2PassportLevelUpTipsWindow.ReInitData()
end

function Activity2PassportLevelUpTipsWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.Activity2PassportLevelUpTipsWindow.package, WinResConfig.Activity2PassportLevelUpTipsWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetActivityDungeon1001_PassportUp_LevelUpTipsWindowUis(contentPane)
    lv = bridgeObj.argTable[1]
    SoundUtil.PlayUISfx(SOUND_EVENT_ENUM.CARD_LV_UP_SUCCEED)
    Activity2PassportLevelUpTipsWindow.UpdateInfo()
    Activity2PassportLevelUpTipsWindow.InitBtn()
  end)
end

function Activity2PassportLevelUpTipsWindow.UpdateInfo()
  uis.Main.SubtitleTxt.text = T(37)
  if lv then
    uis.Main.LevelTxt.text = lv
  end
  UIUtil.SetEffectToUI("Assets/Art/Effects/Prefab/UI_prefab/Common/FX_ui_get_common.prefab", uis.Main.EffectHolder)
end

function Activity2PassportLevelUpTipsWindow.InitBtn()
  uis.Main.TouchScreenBtn.onClick:Set(function()
    UIMgr:CloseWindow(WinResConfig.Activity2PassportLevelUpTipsWindow.name)
    SoundUtil.PlayUISfx(SOUND_EVENT_ENUM.POPUP_WINDOW_CLOSE)
  end)
end

function Activity2PassportLevelUpTipsWindow.OnClose()
  uis = nil
  contentPane = nil
  lv = nil
end

return Activity2PassportLevelUpTipsWindow
