require("Guide_PicLookWindowByName")
local GuidePicLookWindow = {}
local uis, contentPane, pictureData, listPage, closeCallback, captionId, showCloseBtn
local effect = "Assets/Art/Effects/Prefab/UI_prefab/NewGuyFinger/FX_NewGuy_Finger_pointlight.prefab"
local time = 0
local startTime, tempItem, lastCtr, itemEffect

function GuidePicLookWindow.OnInit(bridgeObj)
  bridgeObj:SetView(WinResConfig.GuidePicLookWindow.package, WinResConfig.GuidePicLookWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetGuide_PicLookWindowUis(contentPane)
    closeCallback = bridgeObj.argTable[2]
    captionId = bridgeObj.argTable[1]
    showCloseBtn = bridgeObj.argTable[3]
    pictureData = TableData.GetConfig(captionId, "BaseGuideCaption")
    uis.Main.CloseBtn.onClick:Set(function()
      if closeCallback then
        closeCallback()
      end
      UIMgr:CloseWindow(WinResConfig.GuidePicLookWindow.name)
    end)
    if pictureData then
      startTime = pictureData.aperture
      time = Time.time
      lastCtr = -1
      GuidePicLookWindow.InitPicture()
      UpdateManager.AddUpdateHandler(GuidePicLookWindow.Update)
    end
  end)
end

function GuidePicLookWindow.ShowEffEct(ctr)
  ChangeUIController(uis.Main.CloseBtn, "effect", ctr)
  if 1 == ctr then
    UIUtil.SetEffectToUI(effect, uis.Main.CloseBtn:GetChild("EffectHolder"))
  end
  if uis.Main.CloseBtn.visible == false then
    if ctr and tempItem then
      for i, v in pairs(tempItem) do
        ChangeUIController(v, "effect", ctr)
        if math.abs(i - 1 - listPage) < 0.02 then
          GuidePicLookWindow.DestroyEffect()
          UIUtil.SetEffectToUI(effect, v:GetChild("EffectHolder"), 1.6)
          table.insert(itemEffect, v:GetChild("EffectHolder"))
        end
      end
    end
  else
    GuidePicLookWindow.DestroyEffect()
  end
  lastCtr = ctr
end

function GuidePicLookWindow.DestroyEffect()
  for i, v in pairs(itemEffect) do
    v:SetNativeObject(nil)
  end
  itemEffect = {}
end

function GuidePicLookWindow.Update()
  if contentPane then
    contentPane:InvalidateBatchingState(true)
    if startTime then
      if Time.time - time > startTime then
        if 1 ~= lastCtr then
          GuidePicLookWindow.ShowEffEct(1)
        end
      elseif 0 ~= lastCtr then
        GuidePicLookWindow.ShowEffEct(0)
      end
    end
  end
end

function GuidePicLookWindow.InitPicture()
  listPage = 0
  local len = #pictureData.picture
  local maxPer = 1 / (len - 1)
  if len > 1 and not showCloseBtn then
    uis.Main.CloseBtn.visible = false
  end
  tempItem = {}
  itemEffect = {}
  
  function uis.Main.PicList.itemRenderer(i, item)
    item:GetChild("PicLoader").url = UIUtil.GetResUrl(string.format(pictureData.picture[i + 1], Language.curLanguage))
    if len - 1 == i then
      ChangeUIController(item, "c1", 1)
    else
      ChangeUIController(item, "c1", 0)
      local RightBtn = item:GetChild("RightBtn")
      RightBtn.onClick:Set(function()
        if math.abs(uis.Main.PicList.scrollPane.percX - maxPer * (i + 1)) < 0.02 then
          uis.Main.PicList.scrollPane:SetPercX(maxPer * i, true)
        else
          uis.Main.PicList.scrollPane:SetPercX(maxPer * (i + 1), true)
        end
        time = Time.time
      end)
      if startTime then
        table.insert(tempItem, item)
      end
    end
  end
  
  uis.Main.PicList.numItems = len
  uis.Main.PicList.scrollPane.mouseWheelEnabled = false
  local pagePer = maxPer / 2
  local lastPer = uis.Main.PicList.scrollPane.percX
  uis.Main.PicList.scrollPane.onScroll:Set(function()
    if Mathf.Abs(uis.Main.PicList.scrollPane.percX - lastPer) >= pagePer then
      uis.Main.PicList.scrollPane:CancelDragging()
      uis.Main.PicList:StopDrag()
      local targetPage
      if uis.Main.PicList.scrollPane.percX > lastPer then
        targetPage = listPage + 1
        if not (targetPage < len) or not targetPage then
          targetPage = len - 1
        end
      else
        targetPage = listPage - 1
        targetPage = targetPage >= 0 and targetPage or 0
      end
      local targetPer = maxPer * targetPage
      if targetPer == uis.Main.PicList.scrollPane.percX then
        uis.Main.PicList.scrollPane.onScrollEnd:Call()
      else
        uis.Main.PicList.scrollPane:SetPercX(targetPer, true)
      end
    end
    time = Time.time
  end)
  uis.Main.PicList.scrollPane.onScrollEnd:Set(function()
    lastPer = uis.Main.PicList.scrollPane.percX
    listPage = Mathf.Abs(uis.Main.PicList.scrollPane.percX / maxPer)
    GuidePicLookWindow.SetPageShow(len)
    if uis.Main.PicList.scrollPane.percX > 1 - pagePer then
      uis.Main.CloseBtn.visible = true
    end
    time = Time.time
  end)
  uis.Main.c1Ctr.selectedIndex = len > 1 and 1 or 0
  GuidePicLookWindow.SetPageShow(len)
end

function GuidePicLookWindow.SetPageShow(len)
  if len <= 1 then
    return
  end
  
  function uis.Main.PageNumberList.itemRenderer(i, item)
    if listPage == i then
      ChangeUIController(item, "c1", 1)
    else
      ChangeUIController(item, "c1", 0)
    end
  end
  
  uis.Main.PageNumberList.numItems = len
end

function GuidePicLookWindow.HandleMessage(msgId, para)
end

function GuidePicLookWindow.OnClose()
  UpdateManager.RemoveUpdateHandler(GuidePicLookWindow.Update)
  closeCallback = nil
  uis = nil
  contentPane = nil
  listPage = nil
  pictureData = nil
  showCloseBtn = nil
  time = nil
  startTime = nil
  tempItem = nil
  lastCtr = nil
  itemEffect = nil
end

return GuidePicLookWindow
