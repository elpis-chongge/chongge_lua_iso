require("ActivityDungeon1002_PassportUp_LevelUpTipsWindowByName")
local Activity3PassportLevelUpTipsWindow = {}
local uis, contentPane, lv

function Activity3PassportLevelUpTipsWindow.ReInitData()
end

function Activity3PassportLevelUpTipsWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.Activity3PassportLevelUpTipsWindow.package, WinResConfig.Activity3PassportLevelUpTipsWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetActivityDungeon1002_PassportUp_LevelUpTipsWindowUis(contentPane)
    lv = bridgeObj.argTable[1]
    SoundUtil.PlayUISfx(SOUND_EVENT_ENUM.CARD_LV_UP_SUCCEED)
    Activity3PassportLevelUpTipsWindow.UpdateInfo()
    Activity3PassportLevelUpTipsWindow.InitBtn()
  end)
end

function Activity3PassportLevelUpTipsWindow.UpdateInfo()
  uis.Main.SubtitleTxt.text = T(37)
  if lv then
    uis.Main.LevelTxt.text = lv
  end
  UIUtil.SetEffectToUI("Assets/Art/Effects/Prefab/UI_prefab/Common/FX_ui_get_common.prefab", uis.Main.EffectHolder)
end

function Activity3PassportLevelUpTipsWindow.InitBtn()
  uis.Main.TouchScreenBtn.onClick:Set(function()
    UIMgr:CloseWindow(WinResConfig.Activity3PassportLevelUpTipsWindow.name)
    SoundUtil.PlayUISfx(SOUND_EVENT_ENUM.POPUP_WINDOW_CLOSE)
  end)
end

function Activity3PassportLevelUpTipsWindow.OnClose()
  uis = nil
  contentPane = nil
  lv = nil
end

return Activity3PassportLevelUpTipsWindow
