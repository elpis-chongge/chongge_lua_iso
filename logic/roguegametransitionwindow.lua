require("RogueBuild01_InsideMidWindowByName")
local RogueGameTransitionWindow = {}
local uis, contentPane
local DURATION = 2.5
local tweenId, chapterId

function RogueGameTransitionWindow.ReInitData()
end

function RogueGameTransitionWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.RogueGameTransitionWindow.package, WinResConfig.RogueGameTransitionWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetRogueBuild01_InsideMidWindowUis(contentPane)
    chapterId = bridgeObj.argTable[1]
    RogueGameTransitionWindow.UpdateInfo()
    RogueGameTransitionWindow.InitBtn()
    SoundUtil.PlayUISfx("event:/sfx/sfx_ui/ui_sys/ui_yuantu_chapter_on")
  end)
end

function RogueGameTransitionWindow.UpdateInfo()
  local conf = TableData.GetConfig(chapterId, "BaseRogueChapter")
  uis.Main.NameTxt.text = conf and conf.name() or "未配置" .. tostring(chapterId)
  uis.Main.WordTxt.text = T(20458)
  uis.Main.TouchScreenBtn.onClick:Set(function()
    UIMgr:CloseWindow(WinResConfig.RogueGameTransitionWindow.name)
  end)
end

function RogueGameTransitionWindow.InitBtn()
end

function RogueGameTransitionWindow.OnClose()
  uis = nil
  contentPane = nil
  if tweenId then
    LeanTween.cancel(tweenId)
  end
  tweenId = nil
end

return RogueGameTransitionWindow
