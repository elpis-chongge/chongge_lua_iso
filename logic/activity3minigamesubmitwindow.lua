require("ActivityDungeon1002_MiniStart_EndRewardWindowByName")
local Activity3MiniGameSubmitWindow = {}
local uis, contentPane

function Activity3MiniGameSubmitWindow.ReInitData()
end

function Activity3MiniGameSubmitWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.Activity3MiniGameSubmitWindow.package, WinResConfig.Activity3MiniGameSubmitWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetActivityDungeon1002_MiniStart_EndRewardWindowUis(contentPane)
    Activity3MiniGameSubmitWindow.UpdateInfo()
    Activity3MiniGameSubmitWindow.InitBtn()
    UIUtil.SetHolderCenter(uis.Main.EffectHolder)
    UIUtil.SetEffectToUI("Assets/Art/Effects/Prefab/UI_prefab/Common/FX_ui_get_common.prefab", uis.Main.EffectHolder)
    SoundUtil.PlayUISfx(SOUND_EVENT_ENUM.ACTIVITY_THREE_GAME_END)
  end)
end

function Activity3MiniGameSubmitWindow.UpdateInfo()
  local againTxt = T(20490)
  local closeTxt = T(20530)
  UIUtil.SetText(uis.Main.CloseBtn, closeTxt, "WordTxt")
  UIUtil.SetText(uis.Main.AgainBtn, againTxt, "WordTxt")
  uis.Main.TitleTxt.text = T(1655)
  uis.Main.WordTxt.text = T(1656)
end

function Activity3MiniGameSubmitWindow.InitBtn()
  uis.Main.CloseBtn.onClick:Set(function()
    Activity3_MiniGameService.MiniGameSubmitReq({}, 1, 1, function()
      UIMgr:CloseToWindow(WinResConfig.Activity3MiniGameMainWindow.name)
    end)
  end)
  uis.Main.AgainBtn.onClick:Set(function()
    Activity3_MiniGameService.MiniGameSubmitReq({}, 1, 1, function()
      UIMgr:CloseWindow(WinResConfig.Activity3MiniGameSubmitWindow.name)
    end)
  end)
end

function Activity3MiniGameSubmitWindow.OnClose()
  uis = nil
  contentPane = nil
end

return Activity3MiniGameSubmitWindow
