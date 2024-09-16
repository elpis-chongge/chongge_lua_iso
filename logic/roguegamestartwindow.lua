require("RogueBuild01_InsideStartWindowByName")
local RogueGameStartWindow = {}
local uis, contentPane, tweenId

function RogueGameStartWindow.ReInitData()
end

function RogueGameStartWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.RogueGameStartWindow.package, WinResConfig.RogueGameStartWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetRogueBuild01_InsideStartWindowUis(contentPane)
    RogueGameStartWindow.UpdateInfo()
    RogueGameStartWindow.InitBtn()
    SoundUtil.PlayUISfx("event:/sfx/sfx_ui/ui_sys/ui_yuantu_chapter_on")
  end)
end

function RogueGameStartWindow.UpdateInfo()
  local themeInfo = RogueGameData.GetThemeInfo()
  local conf = TableData.GetConfig(themeInfo.themeId, "BaseRogueTheme")
  local path = conf.start_effect
  local effect = ResourceManager.Instantiate(path)
  UIUtil.SetObjectToUI(effect, uis.Main.Ani.TitleHolder)
  local duration = EffectUtil.PlayTimeLineByName(effect, "timeline")
  LuaUtil.PlayEffect(effect)
end

function RogueGameStartWindow.InitBtn()
  uis.Main.TouchScreenBtn.onClick:Set(function(context)
    UIMgr:CloseWindow(WinResConfig.RogueGameStartWindow.name)
    UIMgr:SendWindowMessage(WinResConfig.RogueGameMapWindow.name, WindowMsgEnum.RogueGame.START_GAME)
  end)
end

function RogueGameStartWindow.OnClose()
  uis = nil
  contentPane = nil
  if tweenId then
    LeanTween.cancel(tweenId)
  end
  tweenId = nil
end

return RogueGameStartWindow
