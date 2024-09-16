require("PlotPlay_EndByName")
local PlotPlayEndWindow = {}
local uis, contentPane, effectObject, closeCallback

function PlotPlayEndWindow.ReInitData()
end

function PlotPlayEndWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.PlotPlayEndWindow.package, WinResConfig.PlotPlayEndWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    closeCallback = bridgeObj.argTable[1]
    uis = GetPlotPlay_EndUis(contentPane)
    PlotPlayEndWindow.UpdateInfo()
    PlotPlayEndWindow.InitBtn()
    UIMgr:CloseWindow(WinResConfig.PlotPlayWindow.name)
    PlayUITrans(contentPane, "up", function()
      if closeCallback then
        closeCallback()
      end
      UIMgr:CloseWindow(WinResConfig.PlotPlayEndWindow.name)
    end)
    SoundUtil.PlayUISfx(SOUND_EVENT_ENUM.PLOT_CHAPTER_OFF)
    SoundUtil.PlaySfx(40004)
    PlotPlayEndWindow.ShowEffect()
  end)
end

function PlotPlayEndWindow.UpdateInfo()
  local curPartId = PlotPlayData.GetCurPartId()
  if curPartId then
    local partConfig = TableData.GetConfig(curPartId, "BasePlotPart")
    uis.TitleTxt.text = partConfig.end_title()
    uis.TitleElpisTxt.text = partConfig.end_subtitle()
  end
end

function PlotPlayEndWindow.ShowEffect()
  local path = "Assets/Art/Effects/Prefab/UI_prefab/chapterBegins/FX_ui_chapterend.prefab"
  effectObject = ResourceManager.Instantiate(path)
end

function PlotPlayEndWindow.InitBtn()
end

function PlotPlayEndWindow.OnShown()
end

function PlotPlayEndWindow.OnHide()
end

function PlotPlayEndWindow.OnClose()
  uis = nil
  contentPane = nil
  closeCallback = nil
  if effectObject then
    ResourceManager.DestroyGameObject(effectObject)
    effectObject = nil
  end
end

function PlotPlayEndWindow.HandleMessage(msgId, para)
end

return PlotPlayEndWindow
