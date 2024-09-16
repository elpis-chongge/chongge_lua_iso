require("ItemGetShow_GetItemTipsWindowByName")
local GetItemTipsWindow = {}
local uis, contentPane, msg
local pitchOn = true
local notSort = true
local closeCallback

function GetItemTipsWindow.ReInitData()
end

function GetItemTipsWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.GetItemTipsWindow.package, WinResConfig.GetItemTipsWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetItemGetShow_GetItemTipsWindowUis(contentPane)
    if bridgeObj.argTable[1] then
      msg = bridgeObj.argTable[1]
      notSort = bridgeObj.argTable[2]
    end
    closeCallback = bridgeObj.argTable[3]
    pitchOn = true
    GetItemTipsWindow.InitBtn()
    GetItemTipsWindow.UpdateTextDisplay()
    GetItemTipsWindow.InitList()
    UIUtil.SetEffectToUI("Assets/Art/Effects/Prefab/UI_prefab/Bosschallenge/FX_ui_get_item_page.prefab", uis.Main.EffectHolder)
    UIUtil.SetEffectToUI("Assets/Art/Effects/Prefab/UI_prefab/Bosschallenge/FX_ui_get_item_page_title.prefab", uis.Main.GetItemTips1.TitleEffectHolder)
    SoundUtil.PlayUISfx(SOUND_EVENT_ENUM.GET_ITEM_REWARD)
  end)
end

function GetItemTipsWindow.OnShowAnimationEnd()
  LightManager:SetCameraBloom(UICamera, true, 1, 255, 255, 255, 1.1, 0, "UI")
end

function GetItemTipsWindow.OnPreClose()
  LightManager:SetCameraBloom(UICamera, false)
end

function GetItemTipsWindow.SortByBaseItem(tb)
  if #tb > 1 then
    for i, v in pairs(tb) do
      local config = TableData.GetConfig(v.itemId, "BaseItem")
      if config then
        v.sort = config.sort or 0
      else
        v.sort = 0
      end
    end
    table.sort(tb, function(a, b)
      return a.sort > b.sort
    end)
    return tb
  else
    return tb
  end
end

function GetItemTipsWindow.InitList()
  if msg then
    if not notSort then
      msg = GetItemTipsWindow.SortByBaseItem(msg)
    end
    local itemConfig
    for i, v in ipairs(msg) do
      local item = UIMgr:CreateObject("CommonResource", "ItemFrame")
      local showHeadWord
      local quality = 1
      if v.tupleType == ProtoEnum.TUPLE_TYPE.ITEM then
        itemConfig = TableData.GetConfig(v.itemId, "BaseItem")
        if itemConfig and itemConfig.type == ProtoEnum.ITEM_TYPE.HEAD_RECT_ITEM or itemConfig.type == ProtoEnum.ITEM_TYPE.EMOJI then
          showHeadWord = ActorData.CanHeadIsNew(v.itemId) and T(1561) or T(1562)
          ActorData.SaveHeadNew(v.itemId)
        end
        quality = itemConfig and itemConfig.quality + 1 or 1
      elseif v.tupleType == ProtoEnum.TUPLE_TYPE.BADGE then
        itemConfig = TableData.GetConfig(v.itemId, "BaseBadge")
        if itemConfig and itemConfig.star then
          quality = itemConfig.star
        end
      elseif v.tupleType == ProtoEnum.TUPLE_TYPE.T_FASHION then
        itemConfig = TableData.GetConfig(v.itemId, "BaseFashion")
        if itemConfig and itemConfig.card_id then
          itemConfig = TableData.GetConfig(itemConfig.card_id, "BaseCard")
          if itemConfig and itemConfig.star then
            quality = itemConfig.star
          end
        end
      elseif v.tupleType == ProtoEnum.TUPLE_TYPE.BGM then
        itemConfig = TableData.GetConfig(v.itemId, "BaseSound")
        if itemConfig and itemConfig.quality then
          quality = itemConfig.quality
        end
      end
      UIUtil.ShowItemFrame(v.itemId, item, v.count, nil, function()
        UIUtil.CommonItemClickCallback(v.itemId, v.tupleType, v.uid, true)
      end, showHeadWord)
      uis.Main.GetItemTips1.Item.ItemList:AddChild(item)
      ChangeUIController(item, "c1", quality - 1)
      if i < 15 then
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
    end
    uis.Main.GetItemTips1.Item.ItemList.opaque = false
  end
end

function GetItemTipsWindow.UpdateTextDisplay()
  uis.Main.GetItemTips1.SubtitleTxt.text = T(338)
  uis.Main.GetItemTips1.TitleTxt.text = T(339)
end

function GetItemTipsWindow.CloseWindow()
  local transition = uis.Main.root:GetTransition("in")
  if transition.playing then
    return
  end
  UIMgr:CloseWindow(WinResConfig.GetItemTipsWindow.name)
  SoundUtil.PlayUISfx(SOUND_EVENT_ENUM.POPUP_WINDOW_CLOSE)
  if closeCallback then
    closeCallback()
    closeCallback = nil
  end
end

function GetItemTipsWindow.InitBtn()
  uis.Main.TouchScreenBtn.onClick:Set(function()
    GetItemTipsWindow.CloseWindow()
  end)
end

function GetItemTipsWindow.OnClose()
  uis = nil
  contentPane = nil
  msg = nil
  pitchOn = nil
  notSort = nil
  closeCallback = nil
end

return GetItemTipsWindow
