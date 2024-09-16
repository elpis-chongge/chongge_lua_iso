require("Bag_BagWindowByName")
local BagWindow = {}
local uis, contentPane, itemInfoList, itemList, jumpTb
local timeIndex = 0
local isPlayAnim, animTime

function BagWindow.ReInitData()
end

function BagWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.BagWindow.package, WinResConfig.BagWindow.comName, function(com)
    BagData.SetSelectType(bridgeObj.argTable[1] or BAG_TYPE.ALL)
    contentPane = com
    contentPane:Center()
    uis = GetBag_BagWindowUis(contentPane)
    BagWindow.UpdateBackground(FEATURE_ENUM.BAG_ALL)
    BagWindow.InitList()
    BagWindow.UpdateTextDisplay()
    BagWindow.UpdateInfo()
    BagWindow.InitBtn()
    if BagData.GetSelectType() ~= BAG_TYPE.ALL then
      PlayUITransToComplete(uis.Main.TabRegion.Tab1Btn, "down")
    end
  end)
end

function BagWindow.UpdateBackground(id)
  uis.Main.BackGround.BackGroundLoader.url = UIUtil.GetBackgroundUrl(id)
end

function BagWindow.InitList()
  itemList = uis.Main.ItemList
  itemList:SetVirtual()
  itemList.itemRenderer = BagWindow.RefreshItem
end

function BagWindow.UpdateInfo()
  BagWindow.UpdateItemList()
end

function BagWindow.UpdateFuncUnlock()
  EnterClampUtil.UpdateEntranceState(FEATURE_ENUM.HOME_BADGE, function(isUnlock)
    ChangeUIController(uis.Main.BadgeGoBtn, "lock", isUnlock and 0 or 1)
    ChangeUIController(uis.Main.BadgeDecomposeBtn, "lock", isUnlock and 0 or 1)
  end)
end

function BagWindow.UpdateTextDisplay()
  local tabRegion = uis.Main.TabRegion
  UIUtil.SetBtnText(tabRegion.Tab1Btn, T(101), T(100))
  UIUtil.SetBtnText(tabRegion.Tab2Btn, T(103), T(102))
  UIUtil.SetBtnText(tabRegion.Tab3Btn, T(105), T(104))
  UIUtil.SetBtnText(tabRegion.Tab4Btn, T(107), T(106))
  UIUtil.SetBtnText(tabRegion.Tab5Btn, T(1563), T(1564))
end

function BagWindow.InitBtn()
  jumpTb = CurrencyReturnWindow.SetCurrencyReturn(WinResConfig.BagWindow.name, uis.Main.CurrencyReturn, FEATURE_ENUM.HOME_BAG)
  local btnParamList = {
    {
      bagType = BAG_TYPE.ALL,
      ctrlIndex = 0,
      featureId = FEATURE_ENUM.BAG_ALL
    },
    {
      bagType = BAG_TYPE.PROP,
      ctrlIndex = 1,
      featureId = FEATURE_ENUM.BAG_PROP
    },
    {
      bagType = BAG_TYPE.MATERIAL,
      ctrlIndex = 2,
      featureId = FEATURE_ENUM.BAG_MATERIAL
    },
    {
      bagType = BAG_TYPE.FRAGMENT,
      ctrlIndex = 3,
      featureId = FEATURE_ENUM.BAG_FRAGMENT
    },
    {
      bagType = BAG_TYPE.BADGE,
      ctrlIndex = 4,
      featureId = FEATURE_ENUM.HOME_BADGE
    }
  }
  local tabRegion = uis.Main.TabRegion
  local btn
  for i, btnParam in ipairs(btnParamList) do
    btn = tabRegion["Tab" .. i .. "Btn"]
    if BagData.GetSelectType() == btnParam.bagType then
      uis.Main.TabRegion.c1Ctr:SetSelectedIndex(btnParam.ctrlIndex)
    end
    if btn then
      btn.soundFmod = SOUND_EVENT_ENUM.TAB_TAG_BOTTOM
      btn.changeStateOnClick = false
      ChangeUIController(btn, "c1", btnParam.ctrlIndex)
      btn.onClick:Set(function()
        if BagData.GetSelectType() ~= btnParam.bagType then
          uis.Main.TabRegion.c1Ctr:SetSelectedIndex(btnParam.ctrlIndex)
          BagData.SetSelectType(btnParam.bagType)
          BagWindow.UpdateItemList()
          if btnParam.bagType == BAG_TYPE.BADGE then
            UIMgr:SetWindowArgs(WinResConfig.BagWindow.name, {
              BAG_TYPE.BADGE
            })
          else
            UIMgr:SetWindowArgs(WinResConfig.BagWindow.name, {nil})
          end
        end
      end)
    end
  end
  UIUtil.SetText(uis.Main.BadgeGoBtn, T(1565))
  uis.Main.BadgeGoBtn.onClick:Set(function()
    if EnterClampUtil.WhetherToEnter(FEATURE_ENUM.HOME_BADGE) then
      OpenWindow(WinResConfig.BadgeWindow.name)
    end
  end)
  UIUtil.SetText(uis.Main.BadgeDecomposeBtn, T(1566))
  uis.Main.BadgeDecomposeBtn.onClick:Set(function()
    if EnterClampUtil.WhetherToEnter(FEATURE_ENUM.HOME_BADGE) then
      BadgeMgr.Init()
      OpenWindow(WinResConfig.BadgeDecomposeWindow.name)
    end
  end)
end

function BagWindow.UpdateItemList()
  itemList.numItems = 0
  timeIndex = 0
  BagWindow.StopAnim()
  isPlayAnim = true
  itemInfoList = BagData.GetItemByType(BagData.GetSelectType())
  ChangeController(uis.Main.c1Ctr, BagData.GetSelectType())
  itemList.numItems = #itemInfoList
  isPlayAnim = nil
  BagWindow.ShowBadgeNum()
end

function BagWindow.ShowBadgeNum()
  local max = TableData.GetConfig(70010032, "BaseFixed").int_value
  if max then
    ChangeUIController(uis.Main.TabRegion.Tab5Btn, "Badge", 1)
    local allBadge = ActorData.GetAllBadge()
    UIUtil.SetText(uis.Main.TabRegion.Tab5Btn:GetChild("BadgeMemory"), T(1569, #allBadge, max), "NumberTxt")
  end
end

function BagWindow.RefreshItem(index, item)
  local itemInfo = itemInfoList[index + 1]
  local itemFrame = item:GetChild("ItemFrame")
  if itemInfo and itemFrame then
    if BagData.GetSelectType() == BAG_TYPE.BADGE then
      UIUtil.ShowItemFrame(itemInfo.badgeId, itemFrame, itemInfo.level > 0 and T(1249, itemInfo.level) or nil, itemInfo, function()
        UIUtil.OpenPreviewTips(itemInfo.badgeId, ProtoEnum.TUPLE_TYPE.BADGE, itemInfo.badgeUid)
      end)
      ChangeUIController(itemFrame, "synthesis", 0)
    else
      local itemId = itemInfo.itemId
      local itemConfig = TableData.GetConfig(itemId, "BaseItem")
      local count = UIUtil.GetFormatCount(ActorData.GetItemCountByUid(itemInfo.itemUid))
      if itemConfig.type == ProtoEnum.ITEM_TYPE.FIX_COUNT_PACKAGE then
        if itemConfig.effect_value then
          local arr = Split(itemConfig.effect_value, "|")
          if 2 == #arr then
            local vaule = tonumber(arr[1])
            if vaule then
              local bar = itemFrame:GetChild("NumberProgressBar")
              if bar then
                bar.max = vaule
                local num = ActorData.GetItemCountByUid(itemInfo.itemUid)
                bar.value = num
                num = num > 999 and T(948) or count
                UIUtil.SetText(bar, T(914, num, vaule), "NumberTxt")
              end
            end
          end
        end
        ChangeUIController(itemFrame, "synthesis", 1)
        count = nil
      else
        ChangeUIController(itemFrame, "synthesis", 0)
      end
      UIUtil.ShowItemFrame(itemId, itemFrame, count, itemInfo, function()
        BagWindow.TouchItem(itemInfo, itemConfig)
      end)
    end
  end
  if isPlayAnim and timeIndex < 35 then
    itemFrame.alpha = 0
    animTime[item] = PlayUITrans(item, "up", function()
      animTime[item] = nil
      itemFrame.alpha = 1
    end, timeIndex * 0.025)
    timeIndex = timeIndex + 1
  else
    itemFrame.alpha = 1
  end
end

function BagWindow.StopAnim()
  if animTime then
    for i, v in pairs(animTime) do
      v:Stop(true, true)
    end
  end
  animTime = {}
end

function BagWindow.TouchItem(itemInfo, itemConfig)
  SoundUtil.PlayUISfx(SOUND_EVENT_ENUM.COMMON_CLICK)
  OpenWindow(WinResConfig.ItemTipsWindow.name, nil, itemInfo.itemUid)
end

function BagWindow.CheckItemTime()
  local time = LoginData.GetCurServerTime()
  if itemInfoList and BagData.GetSelectType() ~= BAG_TYPE.BADGE then
    for i, v in pairs(itemInfoList) do
      if 0 ~= v.expireStamp and time > v.expireStamp then
        return true
      end
    end
  end
end

function BagWindow.OnShown()
end

function BagWindow.OnHide()
end

function BagWindow.OnClose()
  itemList.numItems = 0
  itemList = nil
  uis = nil
  contentPane = nil
  itemInfoList = nil
  timeIndex = nil
  isPlayAnim = nil
  animTime = nil
  if jumpTb then
    jumpTb.Close()
    jumpTb = nil
  end
end

function BagWindow.HandleMessage(msgId, para)
  if msgId == WindowMsgEnum.Common.E_MSG_ITEM_CHANGE then
    BagWindow.UpdateItemList()
  elseif msgId == WindowMsgEnum.Common.E_MSG_SERVER_TIME_CHANGE then
    if BagWindow.CheckItemTime() then
      FloatTipsUtil.ShowWarnTips(T(1062))
      BagWindow.UpdateItemList()
    else
      itemList:RefreshVirtualList()
    end
  elseif msgId == WindowMsgEnum.Common.E_MSG_BADGE_UPDATE then
    BagWindow.ShowBadgeNum()
  end
end

return BagWindow
