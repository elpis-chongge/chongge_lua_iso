require("Card_LevelUpTipsWindowByName")
local LevelUpTipsWindow = {}
local uis, contentPane, lv

function LevelUpTipsWindow.ReInitData()
end

function LevelUpTipsWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.LevelUpTipsWindow.package, WinResConfig.LevelUpTipsWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetCard_LevelUpTipsWindowUis(contentPane)
    lv = bridgeObj.argTable[1]
    LevelUpTipsWindow.InitBtn()
    LevelUpTipsWindow.UpdateTextDisplay()
    SoundUtil.PlayUISfx(SOUND_EVENT_ENUM.CARD_LV_UP_SUCCEED)
  end)
end

function LevelUpTipsWindow.UpdateTextDisplay()
  uis.Main.LevelUpTips1.SubtitleTxt.text = T(37)
  uis.Main.LevelUpTips1.TitleTxt.text = T(36)
  if lv then
    uis.Main.LevelUpTips1.LevelTxt.text = lv
  end
end

function LevelUpTipsWindow.InitBtn()
  uis.Main.TouchScreenBtn.onClick:Set(function()
    UIMgr:CloseWindow(WinResConfig.LevelUpTipsWindow.name)
  end)
end

function LevelUpTipsWindow.OnClose()
  uis = nil
  contentPane = nil
  lv = nil
end

return LevelUpTipsWindow
