require("ActivityDungeon1_PassportUp_LevelUpTipsWindowByName")
local ActivityPassportLevelUpTipsWindow = {}
local uis, contentPane, lv

function ActivityPassportLevelUpTipsWindow.ReInitData()
end

function ActivityPassportLevelUpTipsWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.ActivityPassportLevelUpTipsWindow.package, WinResConfig.ActivityPassportLevelUpTipsWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetActivityDungeon1_PassportUp_LevelUpTipsWindowUis(contentPane)
    lv = bridgeObj.argTable[1]
    SoundUtil.PlayUISfx(SOUND_EVENT_ENUM.CARD_LV_UP_SUCCEED)
    ActivityPassportLevelUpTipsWindow.UpdateInfo()
    ActivityPassportLevelUpTipsWindow.InitBtn()
  end)
end

function ActivityPassportLevelUpTipsWindow.UpdateInfo()
  uis.Main.SubtitleTxt.text = T(37)
  if lv then
    uis.Main.LevelTxt.text = lv
  end
  UIUtil.SetEffectToUI("Assets/Art/Effects/Prefab/UI_prefab/Common/FX_ui_get_common.prefab", uis.Main.EffectHolder)
end

function ActivityPassportLevelUpTipsWindow.InitBtn()
  uis.Main.TouchScreenBtn.onClick:Set(function()
    UIMgr:CloseWindow(WinResConfig.ActivityPassportLevelUpTipsWindow.name)
    SoundUtil.PlayUISfx(SOUND_EVENT_ENUM.POPUP_WINDOW_CLOSE)
  end)
end

function ActivityPassportLevelUpTipsWindow.OnClose()
  uis = nil
  contentPane = nil
  lv = nil
end

return ActivityPassportLevelUpTipsWindow
