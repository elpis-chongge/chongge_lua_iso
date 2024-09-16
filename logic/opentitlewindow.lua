require("PlotDungeon_OpenTitleWindowByName")
local OpenTitleWindow = {}
local uis, contentPane, effect, back

function OpenTitleWindow.ReInitData()
end

function OpenTitleWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.OpenTitleWindow.package, WinResConfig.OpenTitleWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetPlotDungeon_OpenTitleWindowUis(contentPane)
    SoundUtil.PlayUISfx(SOUND_EVENT_ENUM.PLOT_CHAPTER_NEXT1)
    AdventureMgr.ClearChapterEnd()
    effect = UIUtil.SetEffectToUI("Assets/Art/Effects/Prefab/UI_prefab/Adventure/Chapter_openend/close/FX_ui_adventure_end.prefab", uis.Main.EffectHolder)
    LeanTween.delayedCall(2, function()
      back = UIUtil.SetEffectToUI("Assets/Art/Effects/Prefab/UI_prefab/Adventure/Chapter_openend/FX_ui_adventure_openend_back.prefab", uis.Main.EffectBgHolder)
      PlayUITrans(uis.Main.root, "out1", function()
        LuaUtil.SetEnergyAlpha(back, 0)
        OpenTitleWindow.CloseWindow()
      end)
      SoundUtil.PlayUISfx(SOUND_EVENT_ENUM.MAIN_CHAPTER_END)
      if AdventureMgr.ShowChapterEndTips() then
        LeanTween.delayedCall(0.85, function()
          OpenWindow(WinResConfig.OpenSceneWindow.name)
        end)
      else
        LuaUtil.SetAnimatorBool(back, "changeOut", true)
      end
    end)
    OpenTitleWindow.UpdateInfo()
  end)
end

function OpenTitleWindow.UpdateInfo()
  uis.Main.NameTxt.text = T(988)
  uis.Main.SubtitleTxt.text = T(989)
end

function OpenTitleWindow.CloseWindow()
  if GuideMgr.waitStoryId == nil then
    UIMgr:CloseWindow(WinResConfig.OpenTitleWindow.name)
  else
    ld("PlotPlay", function()
      PlotPlayMgr.PlayPlot(GuideMgr.waitStoryId, nil, nil, function()
        GuideMgr.Next()
        GuideMgr.waitStoryId = nil
        UIMgr:CloseWindow(WinResConfig.OpenTitleWindow.name)
        print(">>>>>>>>>>>>222>>>>")
      end, true, nil, PLOT_PLAY_TYPE.GUIDE)
    end)
  end
end

function OpenTitleWindow.OnClose()
  uis = nil
  contentPane = nil
  effect = nil
  if back then
    ResourceManager.DestroyGameObject(back, false)
    back = nil
  end
  if GuideMgr.guideBol and UIMgr:IsWindowOpen(WinResConfig.PlotDungeonWindow.name) then
    print(">>>>OpenTitleWindowshuaxin>>>>>>>>222>>>>")
    GuideMgr.Refresh()
  end
end

return OpenTitleWindow
