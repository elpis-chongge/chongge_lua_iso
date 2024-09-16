require("ActivityDungeon1_ShopWindowByName")
local ActivityShopWindow = {}
local uis, contentPane, activityInfo, tempAssetsTips

function ActivityShopWindow.ReInitData()
end

function ActivityShopWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.ActivityShopWindow.package, WinResConfig.ActivityShopWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetActivityDungeon1_ShopWindowUis(contentPane)
    ActivityShopWindow.UpdateInfo()
    ActivityShopWindow.InitBtn()
  end)
end

function ActivityShopWindow.UpdateInfo(noPlayAnim)
  activityInfo = ActivityDungeonData.GetActivityInfo()
  if activityInfo then
    uis.Main.Time.WordTxt.text = T(1527)
    uis.Main.Time.TimeTxt.text = TimeUtil.FormatEnTime(activityInfo.baseInfo.endStamp - LoginData.GetCurServerTime())
    local data = ActivityDungeonData.GetActivityData()
    if data then
      uis.Main.BackGround.BackGroundLoader.url = UIUtil.GetResUrl(data.bg_shop)
      local shopData = TableData.GetConfig(data.shop_id, "BaseActivityShop")
      if shopData then
        tempAssetsTips = {
          shopData.token_id
        }
        UIUtil.InitAssetsTips(uis.Main.AssetsTipsList, tempAssetsTips)
      end
      local shopGrid = ActivityShopWindow.GetShopGrid(data.shop_id)
      local titleTxt = {
        T(1529),
        T(1530),
        T(1617)
      }
      
      function uis.Main.ItemList.itemRenderer(i, item)
        local shopTitle = item:GetChild("ShopTitle")
        ChangeUIController(shopTitle, "c1", i)
        UIUtil.SetText(shopTitle, titleTxt[i + 1], "WordTxt")
        local list = item:GetChild("ItemList")
        ActivityShopWindow.ShowItem(list, shopGrid[i + 1], noPlayAnim)
      end
      
      uis.Main.ItemList.numItems = #shopGrid
    end
  end
end

function ActivityShopWindow.ShowItem(list, shopGrid, noPlayAnim)
  function list.itemRenderer(i, item)
    local data = shopGrid[i + 1]
    
    local tokenCom = item:GetChild("Item")
    local itemBtn = tokenCom:GetChild("ItemBtn")
    local itemData, ctrType = ActivityShopWindow.ShowOneReward(data.item[1], itemBtn, "ItemLoader", "NumberTxt", true)
    if itemData then
      itemBtn:GetChild("NameTxt").text = itemData.name()
      print(itemData.quality, itemData.id, "<<<<<<<<<<<<<")
      ChangeUIController(itemBtn, "c1", itemData.quality)
    end
    if ctrType then
      ChangeUIController(itemBtn, "c3", ctrType)
    end
    if 0 == ctrType then
      local type, detailData = ShopMgr.GetLookDetailsBtn(itemData.id)
      if detailData and #detailData > 0 then
        ChangeUIController(itemBtn:GetChild("UseMark"), "c1", type == USE_TYPE.CARD and 1 or 2)
        ChangeUIController(itemBtn, "c5", 1)
      else
        ChangeUIController(itemBtn, "c5", 0)
      end
    else
      ChangeUIController(itemBtn, "c5", 0)
    end
    ActivityShopWindow.ShowOneReward(data.sell_price[1], itemBtn, "SpendLoader", "Spend")
    local num = data.sell_limit_time
    local bought = activityInfo.boughtItem[data.id] or 0
    if num and num > bought or -1 == num then
      if -1 == num then
        itemBtn:GetChild("ItemNumber"):GetChild("NumberTxt").text = T(1549)
      else
        itemBtn:GetChild("ItemNumber"):GetChild("NumberTxt").text = T(438, num - bought)
      end
      item.onClick:Set(function()
        OpenWindow(WinResConfig.ShopTokensTipsWindow.name, nil, data.id, tempAssetsTips, {
          gridId = data.id,
          boughtNum = bought
        })
      end)
      ChangeUIController(itemBtn, "c2", 0)
      ChangeUIController(tokenCom, "c1", 0)
    else
      item.onClick:Set(function()
        FloatTipsUtil.ShowWarnTips(T(481))
      end)
      UIUtil.SetText(tokenCom:GetChild("SellOut"), T(469), "NameTxt")
      ChangeUIController(tokenCom, "c1", 1)
      ChangeUIController(itemBtn, "c2", 1)
    end
    if not noPlayAnim then
      tokenCom.alpha = 0
      PlayUITrans(item, "up", nil, Const.gridSpeed * i)
    end
  end
  
  list.numItems = #shopGrid
  list:ResizeToFit()
end

function ActivityShopWindow.ShowOneReward(reward, item, loaderName, numberTxtName, showStr, smallIcon)
  local config, ctrType
  if item and reward then
    local arr = Split(reward, ":")
    if arr and 3 == #arr then
      local itemType = tonumber(arr[1])
      if itemType == ProtoEnum.TUPLE_TYPE.CARD then
        ctrType = 1
        local loader = item:GetChild("CardHeadBg"):GetChild("PicLoader")
        if loader then
          local data = TableData.GetConfig(tonumber(arr[2]), "BaseCard")
          if data then
            local list = item:GetChild("StarList")
            
            function list.itemRenderer()
            end
            
            list.numItems = data.star
            UIUtil.SetHeadByFaceId(data.fashion_id, loader, HEAD_ICON_TYPE_ENUM.RECT)
            config = {
              quality = data.star - 1,
              name = data.name
            }
          end
        end
      elseif itemType == ProtoEnum.TUPLE_TYPE.BGM then
        ctrType = 0
        local loader = item:GetChild(loaderName)
        if loader then
          config = TableData.GetConfig(tonumber(arr[2]), "BaseSound")
          if config then
            local icon = smallIcon and config.icon_small and config.icon_small or config.icon
            loader.url = UIUtil.GetResUrl(icon)
          end
        end
      else
        ctrType = 0
        local loader = item:GetChild(loaderName)
        if loader then
          config = TableData.GetConfig(tonumber(arr[2]), "BaseItem")
          if config then
            local icon = smallIcon and config.icon_small and config.icon_small or config.icon
            loader.url = UIUtil.GetResUrl(icon)
          end
        end
      end
      local numberTxt = item:GetChild(numberTxtName)
      if numberTxt then
        if showStr then
          ChangeUIController(item, "c4", tonumber(arr[3]) > 1 and 0 or 1)
        end
        numberTxt.text = arr[3]
      end
    end
  end
  return config, ctrType
end

function ActivityShopWindow.GetShopGrid(groupId)
  local data = TableData.GetTable("BaseActivityShopGrid")
  local newTb = {}
  for i, v in pairs(data) do
    if v.activity_shop_id == groupId then
      if newTb[v.type] == nil then
        newTb[v.type] = {}
      end
      table.insert(newTb[v.type], v)
    end
  end
  for i, v in pairs(newTb) do
    table.sort(v, function(a, b)
      return a.sort_index < b.sort_index
    end)
  end
  return newTb
end

function ActivityShopWindow.InitBtn()
  uis.Main.ReturnBtn.onClick:Set(ActivityShopWindow.CloseWindow)
end

function ActivityShopWindow.CloseWindow()
  UIMgr:CloseWindow(WinResConfig.ActivityShopWindow.name)
end

function ActivityShopWindow.OnClose()
  uis = nil
  contentPane = nil
  tempAssetsTips = nil
  activityInfo = nil
end

function ActivityShopWindow.HandleMessage(msgId, para)
  if WindowMsgEnum.ActivityDungeon.REFRESH_SHOP == msgId then
    ActivityShopWindow.UpdateInfo(true)
  end
end

return ActivityShopWindow
