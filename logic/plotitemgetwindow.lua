require("PlotPlay_PlotItemGetByName")
local PlotItemGetWindow = {}
local uis, contentPane, items, curIndex, canTouch

function PlotItemGetWindow.ReInitData()
end

function PlotItemGetWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.PlotItemGetWindow.package, WinResConfig.PlotItemGetWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    items = bridgeObj.argTable[1]
    curIndex = 1
    canTouch = true
    uis = GetPlotPlay_PlotItemGetUis(contentPane)
    PlotItemGetWindow.UpdateInfo()
    PlotItemGetWindow.InitBtn()
    SoundUtil.PlayUISfx(SOUND_EVENT_ENUM.PLOT_ITEM_GET)
  end)
end

function PlotItemGetWindow.OnShowAnimationEnd()
  if PlotPlayData.isAutoPlay then
    TimerUtil.setTimeout(PlotPlayData.autoPlayWaitTime, PlotItemGetWindow.PlayNextItem)
  end
end

function PlotItemGetWindow.UpdateInfo()
  local curItem = items[curIndex]
  if curItem then
    local itemConfig = TableData.GetConfig(curItem.itemId, "BaseItem")
    if itemConfig then
      UIUtil.SetEffectToUI("Assets/Art/Effects/Prefab/UI_prefab/Story/FX_ui_story_get_item_under.prefab", uis.PlotItem.Effect1Holder)
      UIUtil.SetEffectToUI("Assets/Art/Effects/Prefab/UI_prefab/Story/FX_ui_story_get_item_front.prefab", uis.PlotItem.Effect2Holder)
      uis.PlotItem.ItemLoader.url = UIUtil.GetResUrl(itemConfig.icon)
      uis.WordTxt.text = itemConfig.name()
    end
  end
end

function PlotItemGetWindow.PlayNextItem()
  if false == canTouch then
    return
  end
  curIndex = curIndex + 1
  if curIndex > #items then
    UIMgr:CloseWindow(WinResConfig.PlotItemGetWindow.name)
    UIMgr:SendWindowMessage(WinResConfig.PlotPlayWindow.name, WindowMsgEnum.PlotPlayWindow.ACTIVE_UPDATE)
  else
    PlotItemGetWindow.UpdateInfo()
    canTouch = false
    PlayUITrans(contentPane, "up", function()
      canTouch = true
      if PlotPlayData.isAutoPlay then
        TimerUtil.setTimeout(PlotPlayData.autoPlayWaitTime, PlotItemGetWindow.PlayNextItem)
      end
    end)
  end
end

function PlotItemGetWindow.InitBtn()
  uis.SureBtn.onClick:Add(PlotItemGetWindow.PlayNextItem)
end

function PlotItemGetWindow.OnShown()
end

function PlotItemGetWindow.OnHide()
end

function PlotItemGetWindow.OnClose()
  canTouch = nil
  curIndex = nil
  items = nil
  uis = nil
  contentPane = nil
end

function PlotItemGetWindow.HandleMessage(msgId, para)
end

return PlotItemGetWindow
