require("Card_SkillUpSuccessWindowByName")
local SkillUpSuccessWindow = {}
local uis, contentPane

function SkillUpSuccessWindow.ReInitData()
end

function SkillUpSuccessWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.SkillUpSuccessWindow.package, WinResConfig.SkillUpSuccessWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetCard_SkillUpSuccessWindowUis(contentPane)
    local lv = bridgeObj.argTable[1]
    SkillUpSuccessWindow.UpdateInfo(lv)
    SkillUpSuccessWindow.InitBtn()
    SoundUtil.PlayUISfx(SOUND_EVENT_ENUM.CARD_SKILL_LV_UP)
  end)
end

function SkillUpSuccessWindow.UpdateInfo(lv)
  if lv then
    uis.Main.SkillUpSuccess1.LevelTxt.text = lv
    uis.Main.SkillUpSuccess1.TitleTxt.text = T(36)
    uis.Main.SkillUpSuccess1.SubtitleTxt.text = T(1085)
  end
end

function SkillUpSuccessWindow.InitBtn()
  uis.Main.TouchScreenBtn.onClick:Set(function()
    UIMgr:CloseWindow(WinResConfig.SkillUpSuccessWindow.name)
  end)
end

function SkillUpSuccessWindow.OnClose()
  uis = nil
  contentPane = nil
end

return SkillUpSuccessWindow
