require("Passport_LevelUpTipsWindowByName")
local PassportLevelUpTipsWindow = {}
local uis, contentPane, lv

function PassportLevelUpTipsWindow.ReInitData()
end

function PassportLevelUpTipsWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.PassportLevelUpTipsWindow.package, WinResConfig.PassportLevelUpTipsWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetPassport_LevelUpTipsWindowUis(contentPane)
    lv = bridgeObj.argTable[1]
    SoundUtil.PlayUISfx(SOUND_EVENT_ENUM.CARD_LV_UP_SUCCEED)
    PassportLevelUpTipsWindow.InitBtn()
    PassportLevelUpTipsWindow.UpdateTextDisplay()
  end)
end

function PassportLevelUpTipsWindow.UpdateTextDisplay()
  uis.Main.SubtitleTxt.text = T(37)
  if lv then
    uis.Main.LevelTxt.text = lv
  end
  UIUtil.SetEffectToUI("Assets/Art/Effects/Prefab/UI_prefab/Common/FX_ui_get_common.prefab", uis.Main.EffectHolder)
end

function PassportLevelUpTipsWindow.InitBtn()
  uis.Main.TouchScreenBtn.onClick:Set(function()
    UIMgr:CloseWindow(WinResConfig.PassportLevelUpTipsWindow.name)
    SoundUtil.PlayUISfx(SOUND_EVENT_ENUM.POPUP_WINDOW_CLOSE)
  end)
end

function PassportLevelUpTipsWindow.OnShown()
end

function PassportLevelUpTipsWindow.OnHide()
end

function PassportLevelUpTipsWindow.OnClose()
  uis = nil
  contentPane = nil
  lv = nil
end

function PassportLevelUpTipsWindow.HandleMessage(msgId, para)
end

return PassportLevelUpTipsWindow
