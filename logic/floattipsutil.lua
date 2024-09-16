local FloatTipsUtil = {}
local floatTipsQueue = {}
local floatTipsUrl, popupLayer, floatTipsPlayTimer
local messageTipsPool = FairyGUI.GObjectPool(CS.Launch.Singleton.transform)

function FloatTipsUtil.ClearQueue()
  floatTipsQueue = {}
end

function FloatTipsUtil.AddPopupItem(itemId, itemCount)
  table.insert(floatTipsQueue, {itemId = itemId, itemCount = itemCount})
  if nil == floatTipsPlayTimer then
    floatTipsPlayTimer = TimerUtil.setInterval(0.4, -1, function()
      FloatTipsUtil.TimerCallback()
    end)
  end
end

function FloatTipsUtil.TimerCallback()
  if #floatTipsQueue <= 0 then
    if floatTipsPlayTimer then
      floatTipsPlayTimer:stop()
      floatTipsPlayTimer = nil
    end
    return
  end
  local itemInfo = floatTipsQueue[1]
  FloatTipsUtil.ShowPopupItemTips(itemInfo.itemId, itemInfo.itemCount)
  table.remove(floatTipsQueue, 1)
end

function FloatTipsUtil.GetFloatTips()
  FloatTipsUtil.TestBasic()
  floatTipsUrl = floatTipsUrl or UIUtil.GetResUrl("Message:FloatTipsUnit")
  return messageTipsPool:GetObject(floatTipsUrl)
end

function FloatTipsUtil.AddAndPlayTips(floatTips)
  floatTips:RemoveFromParent()
  popupLayer:AddChild(floatTips)
  floatTips:SetSize(popupLayer.width, popupLayer.height)
  floatTips.touchable = false
  PlayUITrans(floatTips, "up", function()
    if floatTips then
      floatTips:RemoveFromParent()
      messageTipsPool:ReturnObject(floatTips)
    end
  end)
end

function FloatTipsUtil.ShowPopupItemTips(itemId, itemCount)
  local floatTips = FloatTipsUtil.GetFloatTips()
  local itemConfig = TableData.GetConfig(itemId, "BaseItem")
  local iconStr = Split(itemConfig.icon, ":")
  local wordTxt = floatTips:GetChild("FloatTips"):GetChild("WordTxt")
  wordTxt.htmlObjAutolayout = true
  wordTxt.text = T(120, iconStr[1], iconStr[2], itemCount)
  FloatTipsUtil.AddAndPlayTips(floatTips)
  SoundUtil.PlayUISfx(SOUND_EVENT_ENUM.FLOAT_TIPS_GET_REWARD)
end

function FloatTipsUtil.ShowWarnTips(str)
  FloatTipsUtil.ClearQueue()
  local floatTips = FloatTipsUtil.GetFloatTips()
  local wordTxt = floatTips:GetChild("FloatTips"):GetChild("WordTxt")
  wordTxt.text = str
  FloatTipsUtil.AddAndPlayTips(floatTips)
  SoundUtil.PlayUISfx(SOUND_EVENT_ENUM.COMMON_NOTICE)
end

function FloatTipsUtil.TestBasic()
  if messageTipsPool.count > 10 then
    messageTipsPool:Clear()
  end
  if nil == popupLayer then
    popupLayer = UIMgr:GetLayerRoot(UILayer.Popup)
  end
end

return FloatTipsUtil
