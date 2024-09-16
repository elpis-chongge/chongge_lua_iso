require("PlotPlay_StartByName")
local PlotPlayStartWindow = {}
local uis, contentPane, effectObject, closeCallback

function PlotPlayStartWindow.ReInitData()
end

function PlotPlayStartWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.PlotPlayStartWindow.package, WinResConfig.PlotPlayStartWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    closeCallback = bridgeObj.argTable[1]
    uis = GetPlotPlay_StartUis(contentPane)
    SoundUtil.PlayUISfx(SOUND_EVENT_ENUM.PLOT_CHAPTER_ON)
    PlotPlayStartWindow.UpdateInfo()
    PlotPlayStartWindow.InitBtn()
    PlayUITrans(contentPane, "up", function()
      if closeCallback then
        closeCallback()
      end
      UIMgr:CloseWindow(WinResConfig.PlotPlayStartWindow.name)
    end)
    SoundUtil.PlaySfx(40003)
    PlotPlayStartWindow.ShowEffect()
  end)
end

function PlotPlayStartWindow.UpdateInfo()
  local curPartId = PlotPlayData.GetCurPartId()
  if curPartId then
    local partConfig = TableData.GetConfig(curPartId, "BasePlotPart")
    uis.TitleTxt.text = partConfig.start_title()
    uis.TitleElpisTxt.text = partConfig.start_subtitle()
    uis.WordTxt.text = partConfig.start_name_title()
  end
end

function PlotPlayStartWindow.ShowEffect()
  local path = "Assets/Art/Effects/Prefab/UI_prefab/chapterBegins/FX_ui_chapterbegins.prefab"
  effectObject = ResourceManager.Instantiate(path)
end

function PlotPlayStartWindow.InitBtn()
end

function PlotPlayStartWindow.OnShown()
end

function PlotPlayStartWindow.OnHide()
end

function PlotPlayStartWindow.OnClose()
  uis = nil
  contentPane = nil
  closeCallback = nil
  if effectObject then
    ResourceManager.DestroyGameObject(effectObject)
    effectObject = nil
  end
end

function PlotPlayStartWindow.HandleMessage(msgId, para)
end

return PlotPlayStartWindow
