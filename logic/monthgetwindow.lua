require("MonthlyPass_MonthGetWindowByName")
local MonthGetWindow = {}
local uis, contentPane, data

function MonthGetWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.MonthGetWindow.package, WinResConfig.MonthGetWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetMonthlyPass_MonthGetWindowUis(contentPane)
    MonthGetWindow.InitBtn()
    MonthGetWindow.UpdateMonth()
    SoundUtil.PlayUISfx(SOUND_EVENT_ENUM.MONTH_TIPS)
  end)
end

function MonthGetWindow.GetRechargeData(type)
  local config = TableData.GetTable("BasePayProduct")
  for i, v in pairs(config) do
    if v.month_card_type == type then
      return v
    end
  end
end

function MonthGetWindow.UpdateMonth()
  local curId = MonthGetWindow.GetMonthId()
  if curId then
    data = MonthGetWindow.GetRechargeData(curId)
    if data then
      MonthGetWindow.ShowUI()
    end
  end
end

function MonthGetWindow.GetMonthId()
  for i, v in pairs(ShopData.monthCardDay) do
    if v > 0 and ShopData.monthCardReward[i] == nil or ShopData.monthCardReward[i] == false then
      return i
    end
  end
  return nil
end

function MonthGetWindow.ShowUI()
  if ShopData.monthCardDay[data.month_card_type] > 0 then
    uis.Main.WordTxt.text = T(1479, ShopData.monthCardDay[data.month_card_type])
  end
  uis.Main.NameTxt.text = T(1480)
  uis.Main.TipsTxt.text = T(1481)
  uis.Main.Month.PicLoader.url = UIUtil.GetResUrl(data.icon_pic)
  uis.Main.c1Ctr.selectedIndex = 0
  UIUtil.SetEffectToUI("Assets/Art/Effects/Prefab/UI_prefab/Yueka_getitem/FX_ui_yueka_getitem.prefab", uis.Main.Month.PicHolder)
end

function MonthGetWindow.InitBtn()
  uis.Main.GetBtn.onClick:Set(function()
    if data then
      ShopService.MonthCardDailyRewardReq(data.month_card_type)
    end
  end)
  uis.Main.CloseBtn.onClick:Set(function()
    UIMgr:SendWindowMessage(WinResConfig.HomeWindow.name, WindowMsgEnum.HomeWindow.CLOSE_MONTH)
    UIMgr:CloseWindow(WinResConfig.MonthGetWindow.name)
    FunctionQueueUtil.SetFunEnd("Shop")
  end)
end

function MonthGetWindow.ShowReward(items)
  UIUtil.SetEffectToUI("Assets/Art/Effects/Prefab/UI_prefab/Yueka_getitem/FX_ui_yueka_getitem_press.prefab", uis.Main.PressHolder)
  ChangeController(uis.Main.c1Ctr, 1)
  local itemConfig
  
  function uis.Main.ItemList.itemRenderer(i, item)
    local v = items[i + 1]
    UIUtil.ShowItemFrame(v.itemId, item, v.count, nil, function()
      UIUtil.CommonItemClickCallback(v.itemId, v.tupleType, v.uid, true)
    end)
    itemConfig = TableData.GetConfig(v.itemId, "BaseItem")
    local quality = 1
    if itemConfig then
      quality = itemConfig.quality + 1
    else
      itemConfig = TableData.GetConfig(v.itemId, "BaseFashion")
      if itemConfig and itemConfig.card_id then
        itemConfig = TableData.GetConfig(itemConfig.card_id, "BaseCard")
        if itemConfig and itemConfig.star then
          quality = itemConfig.star
        end
      end
      itemConfig = TableData.GetConfig(v.itemId, "BaseBadge")
      if itemConfig and itemConfig.star then
        quality = itemConfig.star
      end
    end
    ChangeUIController(item, "c1", quality - 1)
    item.alpha = 0
    item.visible = false
    local holder = item:GetChild("EffectHolder")
    UIUtil.SetHolderCenter(holder)
    UIUtil.SetEffectToUI(string.format(RES_PATH_PREFIX.GET_ITEM_PATH, quality + 1), holder, nil, true)
    TimerUtil.setTimeout(i * 0.15, function()
      if uis then
        item.visible = true
        PlayUITrans(item, "up")
        SoundUtil.PlayUISfx(SOUND_EVENT_ENUM.GET_ITEM)
      end
    end)
  end
  
  uis.Main.ItemList.numItems = #items
  uis.Main.ItemList.opaque = false
end

function MonthGetWindow.HandleMessage(msgId, para)
  if msgId == WindowMsgEnum.ShopWindow.GET_MONTH then
    MonthGetWindow.ShowReward(para)
  end
end

function MonthGetWindow.OnClose()
  uis = nil
  contentPane = nil
  data = nil
end

return MonthGetWindow
