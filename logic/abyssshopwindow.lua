require("Abyss_ShopWindowByName")
require("Abyss_ShopEnterAniByName")
local AbyssShopWindow = {}
local uis, contentPane
local ShopType = {
  AbyssPeriodicShop = 3,
  AbyssNormalShop = 4,
  AbyssBourse = 999
}
local shoplist = {
  [1] = {
    name = T(20011),
    type = ShopType.AbyssPeriodicShop,
    mainPageCtrlIndex = 1,
    btnCtrlIndex = 0
  },
  [2] = {
    name = T(20012),
    type = ShopType.AbyssNormalShop,
    mainPageCtrlIndex = 2,
    btnCtrlIndex = 1
  },
  [3] = {
    name = T(20013),
    type = ShopType.AbyssBourse,
    mainPageCtrlIndex = 3,
    btnCtrlIndex = 2
  }
}
local urllookup = {
  [1] = UIUtil.GetResUrl("Abyss:CycleCommodityAni1"),
  [2] = UIUtil.GetResUrl("Abyss:CycleCommodityAni2"),
  [3] = UIUtil.GetResUrl("Abyss:CycleCommodityAni3"),
  [4] = UIUtil.GetResUrl("Abyss:CycleCommodityAni4")
}
local selectedShopType = -1
local defaultTab, sellInterface
local playanim = true
local sellCallback = function(msg)
  UIMgr:SendWindowMessage(WinResConfig.AbyssShopWindow.name, WindowMsgEnum.AbyssShopWindow.ITEMS_SOLD)
end

function AbyssShopWindow.ReInitData()
end

function AbyssShopWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.AbyssShopWindow.package, WinResConfig.AbyssShopWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    sellInterface = bridgeObj.argTable[1]
    defaultTab = bridgeObj.argTable[2]
    if type(sellInterface) == "function" then
      Net.AddListener(Proto.MsgName.BatchUseItemsRsp, sellCallback)
    end
    uis = GetAbyss_ShopWindowUis(contentPane)
    AbyssShopWindow.UpdateInfo()
    AbyssShopWindow.InitBtn()
  end)
end

local SetupItem = function(item_cmp, loader_name, url, txt_name, txt_content)
  if item_cmp then
    local loader = item_cmp:GetChild(loader_name)
    if loader then
      loader.url = url
    end
    local txt = item_cmp:GetChild(txt_name)
    if txt then
      txt.text = txt_content
    end
  end
end
local SetupItemWithItemStr = function(item_str, item_cmp, loader_name, number_txt_name, display_str)
  local conf, cnt
  if item_cmp and item_str then
    if type(item_str) == "string" then
      local splits = Split(item_str, ":")
      conf = TableData.GetConfig(tonumber(splits[2]), "BaseItem")
      cnt = tonumber(splits[3])
    else
      conf = TableData.GetConfig(tonumber(item_str[2]), "BaseItem")
      cnt = tonumber(item_str[3])
    end
    SetupItem(item_cmp, loader_name, UIUtil.GetResUrl(conf.icon), number_txt_name, display_str and T(441, cnt) or cnt)
  end
  return conf, cnt
end
local GetAssetListByShopType = function(shopType)
  local shopTbl = TableData.GetTable("BaseShop")
  local shopConf
  for i, v in pairs(shopTbl) do
    if v.type == shopType then
      shopConf = v
      break
    end
  end
  return shopConf.bar_res
end
local bourse_assetlist
local GetBourseAssetList = function()
  if not bourse_assetlist then
    local val = TableData.GetConfig(70010812, "BaseFixed").array_value
    bourse_assetlist = Split(val, "|")
    for k, v in pairs(bourse_assetlist) do
      bourse_assetlist[k] = tonumber(v)
    end
  end
  return bourse_assetlist
end
local req_shop_list = {
  types = {
    ShopType.AbyssPeriodicShop,
    ShopType.AbyssNormalShop
  }
}
local CheckRefreshTimestampAndRefreshData = function(nextRefreshTime, dont_display_tips)
  local condition = type(nextRefreshTime) == "number" and nextRefreshTime > 0 and nextRefreshTime < LoginData.GetCurServerTime()
  if condition then
    Net.Send(Proto.MsgName.GetShopInfoReq, req_shop_list, function()
      UIMgr:SendWindowMessage(WinResConfig.AbyssShopWindow.name, WindowMsgEnum.AbyssShopWindow.REFRESH_SHOP)
      if not dont_display_tips then
        MessageBox.Show(T(20081), {})
      end
    end)
    return true
  end
  return false
end
local refreshTimers
local StopAndClearAllRefreshTimers = function()
  if not refreshTimers then
    return
  end
  for _, v in pairs(refreshTimers) do
    v:stop()
  end
  table.clear(refreshTimers)
end
local RefreshShopAssets = function(display, shopType)
  local list = uis.Main.AssetsList
  if display then
    local bar_res
    if shopType ~= ShopType.AbyssBourse then
      bar_res = GetAssetListByShopType(shopType)
    else
      bar_res = GetBourseAssetList()
    end
    for i, v in pairs(bar_res) do
      bar_res[i] = tonumber(v)
    end
    UIUtil.InitAssetsTips(list, bar_res)
    list.visible = true
  else
    list.visible = false
  end
end
local RefreshItemlist = function(shopType, itemlist, no_anim)
  local shopInfo = ShopData.shopInfo[shopType]
  local goods = shopInfo.goods
  table.sort(goods, function(x, y)
    local sortx = TableData.GetConfig(x.gridId, "BaseShopGrid").sort_index or 0
    local sorty = TableData.GetConfig(y.gridId, "BaseShopGrid").sort_index or 0
    return sortx > sorty
  end)
  if not refreshTimers then
    refreshTimers = {}
  end
  StopAndClearAllRefreshTimers()
  
  function itemlist.itemProvider(i)
    local itemurl = ""
    if shopType == ShopType.AbyssNormalShop then
      itemurl = urllookup[4]
    elseif shopType == ShopType.AbyssPeriodicShop then
      local index = i < 3 and i + 1 or 4
      itemurl = urllookup[index]
    end
    return itemurl
  end
  
  function itemlist.itemRenderer(i, gcmp)
    local subItem = gcmp:GetChild("Item")
    local goodsData = goods[i + 1]
    local nextRefreshTime = goodsData.nextRefreshTime
    if nextRefreshTime > 0 then
      local count = math.ceil(nextRefreshTime - LoginData.GetCurServerTime())
      local timer
      timer = TimerUtil.new(1, count, function()
        if CheckRefreshTimestampAndRefreshData(nextRefreshTime) then
          timer:stop()
        else
          local serverTime = LoginData.GetCurServerTime()
          local diff = nextRefreshTime - serverTime
          local time = subItem:GetChild("Time")
          UIUtil.SetText(time, TimeUtil.FormatEnTime(diff), "TimeTxt")
        end
      end)
      timer:start()
      table.insert(refreshTimers, timer)
    end
    local goodsConf = TableData.GetConfig(goodsData.goodsId, "BaseShopPool")
    local splits = Split(goodsConf.item, ":")
    local itemConf, cnt = SetupItemWithItemStr(splits, subItem, "ItemLoader", "NumberTxt")
    if itemConf then
      local nameTxt = subItem:GetChild("NameTxt")
      if nameTxt then
        nameTxt.text = itemConf.name()
      end
      ChangeUIController(subItem, "Type", itemConf.quality)
    end
    if cnt then
      local pic = subItem:GetChild("n8")
      local numberText = subItem:GetChild("NumberTxt")
      if cnt <= 1 then
        pic.visible = false
        numberText.visible = false
      else
        pic.visible = true
        numberText.visible = true
      end
    end
    SetupItemWithItemStr(goodsConf.sell_price, subItem, "PriceLoader", "PriceTxt")
    if shopType == ShopType.AbyssPeriodicShop then
      UIUtil.SetText(subItem, T(20024), "SubtitleTxt")
    elseif shopType == ShopType.AbyssNormalShop then
      UIUtil.SetText(subItem, T(20025), "SubtitleTxt")
    end
    local type, detailData = ShopMgr.GetLookDetailsBtn(tonumber(splits[2]))
    local useMark = subItem:GetChild("UseMark")
    if detailData and #detailData > 0 then
      if useMark then
        ChangeUIController(useMark, "c1", type == USE_TYPE.CARD and 1 or 2)
        ChangeUIController(subItem, "c1", 1)
      end
    else
      ChangeUIController(subItem, "c1", 0)
    end
    if nextRefreshTime > 0 then
      local serverTime = LoginData.GetCurServerTime()
      local diff = nextRefreshTime - serverTime
      local time = subItem:GetChild("Time")
      UIUtil.SetText(time, TimeUtil.FormatEnTime(diff), "TimeTxt")
      local holder = time:GetChild("TimeHolder")
      local go = ResourceManager.Instantiate("Assets/Art/Models/UI_spine/prefab/ui_timeword_hourglass.prefab")
      UIUtil.SetObjectToUI(go, holder, 12000)
      ChangeUIController(subItem, "time", 1)
    else
      ChangeUIController(subItem, "time", 0)
    end
    local unlock, isNew = true, true
    local limit_bought_num
    local gridConf = TableData.GetConfig(goodsData.gridId, "BaseShopGrid")
    if gridConf then
      limit_bought_num = gridConf.sell_limit_time
    end
    unlock = goodsData.unlocked
    local surplusTxt = subItem:GetChild("SurplusTxt")
    local sellout = (not limit_bought_num or not (limit_bought_num > goodsData.boughtNum)) and -1 ~= limit_bought_num
    local surplusContent = ""
    if not sellout then
      if limit_bought_num > 0 then
        local surplusCnt = limit_bought_num - goodsData.boughtNum
        if shopType == ShopType.AbyssPeriodicShop and 0 == i then
          surplusContent = T(20027, surplusCnt, tonumber(cnt) * surplusCnt)
        else
          surplusContent = T(438, surplusCnt)
        end
      else
        surplusContent = T(1549)
      end
      ChangeUIController(subItem, "SellState", 0)
    else
      surplusContent = T(438, 0)
      ChangeUIController(subItem, "SellState", 1)
      UIUtil.SetText(subItem:GetChild("SellOut"), T(469), "WordTxt")
    end
    surplusTxt.text = surplusContent
    local conversation = goodsConf.sell_price_type and 1 == goodsConf.sell_price_type
    if conversation then
      local array = Split(TableData.GetConfig(70010823, "BaseFixed").array_value, ":")
      UIUtil.SetText(subItem:GetChild("GetBtn"), T(332), "NameTxt")
      local remainBoughtNum = math.min(limit_bought_num - goodsData.boughtNum, shopInfo.manorFreeCount)
      UIUtil.SetText(subItem, T(20447, remainBoughtNum), "PriceWordTxt")
      local conf = TableData.GetConfig(tonumber(array[2]), "BaseItem")
      local tipsText = T(20448, array[3], UIUtil.GetResUrl(conf.icon))
      UIUtil.SetText(subItem, tipsText, "TipsTxt")
      local btn = subItem:GetChild("GetBtn")
      btn.touchable = true
      btn.grayed = 0 == remainBoughtNum
      btn.onClick:Set(function(context)
        if remainBoughtNum > 0 then
          ShopService.BuyShopGoodsReq(goodsData.gridId, 1)
        else
          FloatTipsUtil.ShowWarnTips(T(20449))
        end
        context:StopPropagation()
      end)
      local red = subItem:GetChild("Red")
      red.visible = remainBoughtNum > 0
    end
    if unlock then
      ChangeUIController(subItem, "Lock", 0)
      if not sellout then
        subItem.onClick:Set(function()
          if CheckRefreshTimestampAndRefreshData(nextRefreshTime) then
            return
          end
          local bar_res = GetAssetListByShopType(shopType)
          if conversation then
            OpenWindow(WinResConfig.ItemTipsWindow.name, nil, tonumber(splits[2]), true)
          else
            OpenWindow(WinResConfig.ShopTokensTipsWindow.name, nil, goodsData.goodsId, bar_res)
          end
          LeanTween.delayedCall(0.5, function()
            local newTips = subItem:GetChild("New")
            newTips.visible = false
          end)
        end)
      else
        subItem.onClick:Set(function()
          if CheckRefreshTimestampAndRefreshData(nextRefreshTime) then
            return
          end
          FloatTipsUtil.ShowWarnTips(T(481))
        end)
      end
    else
      ChangeUIController(subItem, "Lock", 1)
      local o = subItem:GetChild("ItemLock")
      local diff = goodsData.unlockTime - LoginData.GetCurServerTime()
      local t0 = T(20022, TimeUtil.FormatEnTime(diff, false))
      local t1 = T(20023)
      UIUtil.SetText(o, t0, "ConditionTxt")
      UIUtil.SetText(o, t1, "WordTxt")
      subItem.onClick:Set(function()
        if CheckRefreshTimestampAndRefreshData(nextRefreshTime) then
          return
        end
        OpenWindow(WinResConfig.ItemTipsWindow.name, nil, tonumber(splits[2]), true)
      end)
    end
    if unlock and not sellout then
      isNew = not RedDotAbyss.Inspected(goodsData.gridId)
    else
      isNew = false
    end
    RedDotAbyss.SaveInspectedGrid(goodsData.gridId)
    local newTips = subItem:GetChild("New")
    newTips.visible = isNew
  end
  
  itemlist.numItems = #goods
  if not no_anim then
    for i = 1, itemlist.numChildren do
      local child = itemlist:GetChildAt(i - 1)
      local subChild = child:GetChild("Item")
      subChild.alpha = 0
      PlayUITrans(child, "up", nil, i * 0.03)
    end
  end
  RedDotAbyss.SaveInspectedGrids()
end
local tab_funcs = {Sell = "SELL", View = "View"}
tab_funcs[1] = tab_funcs.Sell
tab_funcs[2] = tab_funcs.View
local indexof = function(arr, key, val)
  for i, v in ipairs(arr) do
    if v[key] == val then
      return i
    end
  end
end
local putinto = function(arr, itemId, count, callback, itemUid)
  if type(count) ~= "number" or count <= 0 then
    return
  end
  local item
  local newlyadded = false
  local index = indexof(arr, "itemId", itemId)
  if not index then
    newlyadded = true
    item = {
      itemId = itemId,
      count = count,
      itemUid = itemUid
    }
    table.insert(arr, item)
    index = #arr
  else
    item = arr[index]
    item.count = item.count + count
  end
  if callback then
    callback(item, count)
  end
  return newlyadded, index, count
end
local remove = function(arr, itemId, count, callback, remove_zero)
  if type(count) ~= "number" or count <= 0 then
    return
  end
  local index = indexof(arr, "itemId", itemId)
  if not index then
    return
  end
  local item = arr[index]
  local cnt = item.count
  count = math.min(cnt, count)
  cnt = cnt - count
  item.count = cnt
  local delete = false
  if 0 == cnt and remove_zero then
    delete = true
    table.remove(arr, index)
  end
  if callback then
    callback(item, count)
  end
  return delete, index, count
end
local effectlookup1 = {
  ["ui://rsupm7zxhh428l"] = "Assets/Art/Effects/Prefab/UI_prefab/MapAdventure/FX_ui_MapAdventure_shop_fly_blue.prefab",
  ["ui://rsupm7zxhh428m"] = "Assets/Art/Effects/Prefab/UI_prefab/MapAdventure/FX_ui_MapAdventure_shop_fly_yellow.prefab"
}
local effectlookup2 = {
  ["ui://rsupm7zxhh428l"] = "Assets/Art/Effects/Prefab/UI_prefab/MapAdventure/FX_ui_MapAdventure_shop_fly_assetbar_blue.prefab",
  ["ui://rsupm7zxhh428m"] = "Assets/Art/Effects/Prefab/UI_prefab/MapAdventure/FX_ui_MapAdventure_shop_fly_assetbar_yellow.prefab"
}
local ggraphs, reusable_ggraphs
local GetGGraph = function()
  if not reusable_ggraphs then
    reusable_ggraphs = {}
  end
  local ggraph
  if #reusable_ggraphs > 0 then
    ggraph = table.remove(reusable_ggraphs)
  else
    ggraph = FairyGUI.UIObjectFactory.NewObject(FairyGUI.ObjectType.Graph)
  end
  return ggraph
end
local RestoreGGraph = function(ggraph)
  if not reusable_ggraphs then
    reusable_ggraphs = {}
  end
  ggraph:SetNativeObject(nil)
  table.insert(reusable_ggraphs, ggraph)
end
local RefreshAssetlist = function(list, bar_res, index)
  local canNotTouchId = {21000003}
  
  function list.itemRenderer(i, item)
    local itemId = bar_res[i + 1]
    if table.contain(canNotTouchId, itemId) then
      ChangeUIController(item, "c1", 1)
    else
      ChangeUIController(item, "c1", 0)
      item:GetChild("AssetsBtn").onClick:Set(function()
        UIUtil.ClickAssetItem(itemId)
      end)
    end
    local count = ActorData.GetItemCount(itemId)
    UIUtil.SetIconById(item:GetChild("IconLoader"), itemId, true)
    if type(index) == "number" and index ~= i then
      return
    end
    UIUtil.SetText(item, UIUtil.GetFormatCount(count), "NumberTxt")
  end
  
  list.numItems = #bar_res
end
local sellEffectTweenId
local msg_box_sureBtnParam = {}
local msg_box_cancelBtnParam = {}
local longPressGesture = CS.FairyGUI.LongPressGesture
local RefreshBourse = function(no_anim)
  local allItems = ActorData.GetItems()
  local tradables = {}
  local sellings = {}
  local rewards = {}
  for _, v in pairs(allItems) do
    local conf = TableData.GetConfig(v.itemId, "BaseItem")
    if 107 == conf.type and v.count > 0 then
      table.insert(tradables, SimpleCopy(v))
    end
  end
  local panel = uis.Main.MaterialSell
  local itemlist = panel.ItemList
  local selllist = panel.MaterialSell.SellItemList
  local pricelist = panel.MaterialSell.TotalPriceStrip.PriceList
  local tabCtrl = panel.c1Ctr
  local onputintosells = function(item, count)
    local conf = TableData.GetConfig(item.itemId, "BaseItem")
    local spilits = Split(conf.effect_value, ":")
    local id = tonumber(spilits[2])
    local cnt = tonumber(spilits[3])
    putinto(rewards, id, cnt * count)
  end
  local onremovefromsells = function(item, count)
    local conf = TableData.GetConfig(item.itemId, "BaseItem")
    local spilits = Split(conf.effect_value, ":")
    local id = tonumber(spilits[2])
    local cnt = tonumber(spilits[3])
    remove(rewards, id, cnt * count, nil, true)
  end
  local newlyadded = false
  local updatesellinfo = function(new, index)
    if new then
      newlyadded = index
    end
    selllist.numItems = #sellings
    pricelist.numItems = #rewards
    newlyadded = false
  end
  local newlyadded_item = false
  local updateitems = function(new, index)
    if new then
      newlyadded_item = index
    end
    itemlist.numItems = #tradables
    newlyadded_item = false
  end
  local addtosells = function(itemId, count, itemUid)
    local del, i, num = remove(tradables, itemId, count, nil, false)
    if num and num > 0 then
      updatesellinfo(putinto(sellings, itemId, num, onputintosells, itemUid))
    end
    return del, i, num
  end
  local removefromsells = function(itemId, count, itemUid)
    local del, i, num = remove(sellings, itemId, count, onremovefromsells, true)
    if num and num > 0 then
      updateitems(putinto(tradables, itemId, num, nil, itemUid))
    end
    return del, i, num
  end
  itemlist.defaultItem = UIUtil.GetResUrl("Abyss:CollectionAni")
  
  function itemlist.itemRenderer(i, gcmp)
    if not no_anim and type(newlyadded_item) == "number" and newlyadded_item - 1 == i then
      local trans = gcmp:GetTransition("up")
      if not trans.playing then
        PlayUITrans(gcmp, "up")
      end
    end
    local item = tradables[i + 1]
    local itemId, itemUid = item.itemId, item.itemUid
    local conf = TableData.GetConfig(item.itemId, "BaseItem")
    local btn = gcmp:GetChild("CollectionBtn")
    local count = item.count
    if 0 == tabCtrl.selectedIndex then
      local sellCnt = 0
      local index = indexof(sellings, "itemId", itemId)
      if index then
        sellCnt = sellings[index].count
      end
      count = count + sellCnt
    end
    SetupItem(btn, "ItemLoader", UIUtil.GetResUrl(conf.icon), "NumberTxt", count)
    UIUtil.SetBtnText(btn, conf.name())
    ChangeUIController(btn, "Type", conf.quality)
    ChangeUIController(btn, "SellState", count > 0 and 0 or 1)
    local gesture = longPressGesture.GetLongPressGesture(btn)
    btn.onClick:Set(function()
      if sellEffectTweenId then
        return
      end
      if 0 == tabCtrl.selectedIndex then
        OpenWindow(WinResConfig.ItemTipsWindow.name, nil, itemId)
      else
        local _, _, num = addtosells(itemId, 1, itemUid)
        if num then
          UIUtil.SetText(btn, item.count, "NumberTxt")
          ChangeUIController(btn, "SellState", item.count > 0 and 0 or 1)
        end
        panel.MaterialSell.c1Ctr.selectedIndex = 1
      end
    end)
    gesture.trigger = 0.5
    gesture.interval = 0
    local elapse = 0
    gesture.onBegin:Set(function()
      if sellEffectTweenId then
        return
      end
      if 0 == tabCtrl.selectedIndex then
        return
      end
      elapse = 0
    end)
    gesture.onAction:Set(function()
      if sellEffectTweenId then
        return
      end
      if 0 == tabCtrl.selectedIndex then
        return
      end
      elapse = elapse + Time.deltaTime
      local count = math.ceil(elapse * elapse * 10)
      local _, _, num = addtosells(itemId, count, itemUid)
      if num then
        UIUtil.SetText(btn, item.count, "NumberTxt")
        ChangeUIController(btn, "SellState", item.count > 0 and 0 or 1)
      end
      panel.MaterialSell.c1Ctr.selectedIndex = 1
    end)
  end
  
  local numTradables = #tradables
  itemlist.numItems = numTradables
  if not no_anim then
    for i = 0, numTradables - 1 do
      PlayUITrans(itemlist:GetChildAt(i), "up")
    end
  end
  selllist.defaultItem = UIUtil.GetResUrl("Abyss:SellItemBtnAni")
  
  function selllist.itemRenderer(i, gcmp)
    local btn = gcmp:GetChild("SellItemBtn")
    if type(newlyadded) == "number" and newlyadded - 1 == i then
      local trans = gcmp:GetTransition("in")
      if not trans.playing then
        btn.alpha = 0
        PlayUITrans(gcmp, "in")
      end
    end
    local item = sellings[i + 1]
    local conf = TableData.GetConfig(item.itemId, "BaseItem")
    SetupItem(btn, "ItemLoader", UIUtil.GetResUrl(conf.icon), "NumberTxt", item.count)
    local gesture = longPressGesture.GetLongPressGesture(btn)
    local itemId, itemUid = item.itemId, item.itemUid
    btn.onClick:Set(function()
      if sellEffectTweenId then
        return
      end
      local del, j, _ = removefromsells(itemId, 1, itemUid)
      if del then
        PlayUITrans(gcmp, "out", function()
          btn.alpha = 1
          btn.scale = Vector2.one
          updatesellinfo()
        end)
      else
        UIUtil.SetText(btn, item.count, "NumberTxt")
      end
      pricelist.numItems = #rewards
      panel.MaterialSell.c1Ctr.selectedIndex = #sellings > 0 and 1 or 0
    end)
    local elapse = 0
    gesture.interval = 0
    gesture.trigger = 0.5
    gesture.onBegin:Set(function()
      if sellEffectTweenId then
        return
      end
      elapse = 0
    end)
    gesture.onAction:Set(function()
      if sellEffectTweenId then
        return
      end
      elapse = elapse + Time.deltaTime
      local count = math.ceil(elapse * elapse * 10)
      local del, j, _ = removefromsells(itemId, count, itemUid)
      if del then
        PlayUITrans(gcmp, "out", function()
          btn.alpha = 1
          btn.scale = Vector2.one
          updatesellinfo()
        end)
      else
        UIUtil.SetText(btn, item.count, "NumberTxt")
      end
      pricelist.numItems = #rewards
      panel.MaterialSell.c1Ctr.selectedIndex = #sellings > 0 and 1 or 0
    end)
  end
  
  pricelist.defaultItem = UIUtil.GetResUrl("Abyss:TotalPrice")
  
  function pricelist.itemRenderer(i, gcmp)
    local item = rewards[i + 1]
    local conf = TableData.GetConfig(item.itemId, "BaseItem")
    SetupItem(gcmp, "ItemLoader", UIUtil.GetResUrl(conf.icon), "NumberTxt", item.count)
  end
  
  updatesellinfo()
  local tablist = uis.Main.MaterialSell.TabList
  tablist.defaultItem = UIUtil.GetResUrl("Abyss:MaterialTabBtn")
  
  function tablist.itemRenderer(i, gcmp)
    local func = tab_funcs[i + 1]
    if func == tab_funcs.Sell then
      UIUtil.SetBtnText(gcmp, T(20017))
      gcmp.onClick:Set(function()
        tabCtrl.selectedIndex = 1
        tablist.selectedIndex = i
      end)
    elseif func == tab_funcs.View then
      UIUtil.SetBtnText(gcmp, T(20007))
      gcmp.onClick:Set(function()
        tabCtrl.selectedIndex = 0
        tablist.selectedIndex = i
      end)
    end
  end
  
  tablist.numItems = #tab_funcs
  tabCtrl.onChanged:Set(function()
    updateitems()
  end)
  panel.AllPutBtn.onClick:Set(function()
    if sellEffectTweenId then
      return
    end
    local flag = false
    for i = 1, #tradables do
      local item = tradables[i]
      local itemId = item.itemId
      local itemUid = item.itemUid
      local count = item.count
      if count > 0 then
        flag = true
        addtosells(itemId, count, itemUid)
      end
    end
    if flag then
      panel.MaterialSell.c1Ctr.selectedIndex = 1
      updateitems()
    end
  end)
  panel.MaterialSell.DeleteBtn.onClick:Set(function()
    if sellEffectTweenId then
      return
    end
    for _ = 1, #sellings do
      local item = sellings[1]
      local itemId = item.itemId
      local itemUid = item.itemUid
      local count = item.count
      removefromsells(itemId, count, itemUid)
    end
    local num = selllist.numItems
    local complete = 0
    for i = 0, num - 1 do
      PlayUITrans(selllist:GetChildAt(i), "out", function()
        complete = complete + 1
        if complete == num then
          panel.MaterialSell.c1Ctr.selectedIndex = 0
          for j = 0, selllist.numItems - 1 do
            local childBtn = selllist:GetChildAt(j):GetChild("SellItemBtn")
            childBtn.alpha = 1
            childBtn.scale = Vector2.one
          end
          selllist.numItems = 0
        end
      end)
    end
  end)
  panel.MaterialSell.SellBtn.onClick:Set(function()
    if sellEffectTweenId then
      return
    end
    if _G.next(rewards) then
      local content = T(20014)
      for i, v in ipairs(rewards) do
        local conf = TableData.GetConfig(v.itemId, "BaseItem")
        local splits = Split(conf.icon, ":")
        content = content .. string.format("<img  src='ui://%s/%s'  width='25'  height='25'/>  %d ", splits[1], splits[2], v.count)
      end
      content = string.format("%s,%s", content, T(20031))
      
      function msg_box_sureBtnParam.touchCallback()
        if _G.next(sellings) then
          local itemUid2Cnt = {}
          for i, v in ipairs(sellings) do
            itemUid2Cnt[v.itemUid] = v.count
          end
          if sellInterface then
            sellInterface(itemUid2Cnt)
          else
            AbyssExploreService.SellItemsReq(itemUid2Cnt)
          end
        end
      end
      
      MessageBox.Show(content, msg_box_sureBtnParam, msg_box_cancelBtnParam)
    end
  end)
  local tradable = numTradables > 0
  panel.c2Ctr.selectedIndex = tradable and 0 or 1
  panel.MaterialSell.c1Ctr.selectedIndex = 0
  panel.MaterialSell.c2Ctr.selectedIndex = tradable and 0 or 1
  if not tradable then
    tabCtrl.selectedIndex = 0
  end
  tablist.selectedIndex = 1 == tabCtrl.selectedIndex and 0 or 1
end
local PlaySellEffectsAndRefresh = function()
  if not ggraphs then
    ggraphs = {}
  end
  table.clear(ggraphs)
  local panel = uis.Main.MaterialSell
  local selllist = panel.MaterialSell.SellItemList
  local pricelist = panel.MaterialSell.TotalPriceStrip.PriceList
  local numItems = selllist.numItems
  local duration = 0
  local parent = uis.Main.root
  for i = 0, numItems - 1 do
    local child = selllist:GetChildAt(i)
    local holder = GetGGraph()
    parent:AddChild(holder)
    local position = child:TransformPoint(Vector2(child.width * 0.5, child.height * 0.5), parent)
    holder:SetXY(position.x, position.y)
    local eff = ResourceManager.Instantiate("Assets/Art/Effects/Prefab/UI_prefab/MapAdventure/FX_ui_MapAdventure_shop_soldout.prefab")
    UIUtil.SetObjectToUI(eff, holder, 10000)
    eff.transform.localPosition = Vector3.zero
    LuaUtil.PlayEffect(eff)
    duration = math.max(duration, EffectUtil.GetEffectDuration(eff))
    duration = math.max(duration, PlayUITrans(child, "out").totalDuration)
    table.insert(ggraphs, holder)
  end
  SoundUtil.PlayUISfx("event:/sfx/sfx_ui/ui_sys/ui_explore_exchange_fly")
  numItems = pricelist.numItems
  for i = 0, numItems - 1 do
    local child = pricelist:GetChildAt(i)
    local loader = child:GetChild("ItemLoader")
    local position = loader:TransformPoint(Vector2(loader.width * 0.5, loader.height * 0.5), parent)
    local holder = GetGGraph()
    parent:AddChild(holder)
    holder:SetXY(position.x, position.y)
    local eff = ResourceManager.Instantiate(effectlookup1[loader.url])
    UIUtil.SetObjectToUI(eff, holder, 10000)
    table.insert(ggraphs, holder)
    eff.transform.localPosition = Vector3.zero
    local timeline_duration = 1 + math.random() * 0.5
    local list = uis.Main.AssetsList
    for j = 0, list.numItems - 1 do
      local subChild = list:GetChildAt(j)
      local iconLoader = subChild:GetChild("IconLoader")
      if loader.url == iconLoader.url then
        local target = iconLoader:TransformPoint(Vector2(iconLoader.width * 0.5, iconLoader.height * 0.5), parent)
        holder:TweenMove(target, timeline_duration):OnComplete(function()
          if not sellEffectTweenId then
            return
          end
          eff = ResourceManager.Instantiate(effectlookup2[loader.url])
          SoundUtil.PlayUISfx("event:/sfx/sfx_ui/ui_sys/ui_explore_exchange_end")
          UIUtil.SetObjectToUI(eff, holder, 15000)
          eff.transform.localPosition = Vector3.zero
          LuaUtil.PlayEffect(eff)
          RefreshAssetlist(list, GetBourseAssetList(), j)
        end)
        duration = math.max(timeline_duration + 0.5, duration)
      end
    end
  end
  sellEffectTweenId = LeanTween.delayedCall(duration, function()
    RefreshBourse(true)
    local cnt = ggraphs and #ggraphs or 0
    for _ = 1, cnt do
      RestoreGGraph(table.remove(ggraphs))
    end
    sellEffectTweenId = nil
  end).id
end
local StopAndClearSellEffects = function()
  local cnt = ggraphs and #ggraphs or 0
  for _ = 1, cnt do
    RestoreGGraph(table.remove(ggraphs))
  end
  if sellEffectTweenId then
    LeanTween.cancel(sellEffectTweenId)
  end
  sellEffectTweenId = nil
end
local ShiftShop = function(shopType, no_anim)
  selectedShopType = shopType
  RefreshShopAssets(true, selectedShopType)
  local itemlist
  if shopType == ShopType.AbyssPeriodicShop then
    local shop = uis.Main.CycleShop
    uis.Main.BackGround.BackGroundLoader.url = UIUtil.GetResUrl(TableData.GetConfig(11304, "BaseFeature").back_ground)
    itemlist = shop.ItemList
  elseif shopType == ShopType.AbyssNormalShop then
    local shop = uis.Main.FixedShop
    uis.Main.BackGround.BackGroundLoader.url = UIUtil.GetResUrl(TableData.GetConfig(11305, "BaseFeature").back_ground)
    itemlist = shop.ItemList
  elseif shopType == ShopType.AbyssBourse then
    uis.Main.BackGround.BackGroundLoader.url = UIUtil.GetResUrl(TableData.GetConfig(11306, "BaseFeature").back_ground)
    RefreshBourse()
    return
  else
    return
  end
  RefreshItemlist(shopType, itemlist, no_anim)
end
local nearestRefreshTimers
local ShopEntranceRenderer = function(i, gcmp)
  local item = shoplist[i + 1]
  local shopEnterBtn = gcmp:GetChild("ShopEnterBtn")
  RedDotMgr.AddNode({
    windowName = WinResConfig.AbyssShopWindow.name,
    com = shopEnterBtn,
    visibleFunc = function()
      return RedDotAbyss.HasNewGoodsWithShopType(item.type)
    end,
    dataType = RED_DOT_DATA_TYPE.ABYSS
  })
  if playanim then
    shopEnterBtn.alpha = 0
    PlayUITrans(gcmp, "up", nil, i * 0.08)
  end
  local shopInfo = ShopData.shopInfo[item.type]
  local timeTxt = shopEnterBtn:GetChild("TimeTxt")
  local holder = shopEnterBtn:GetChild("TimeHolder")
  if shopInfo then
    local goods = shopInfo.goods
    local hasRefreshTime, nearestTime = false, false
    for _, data in pairs(goods) do
      local nextRefreshTime = data.nextRefreshTime
      if nextRefreshTime > 0 then
        if not hasRefreshTime then
          nearestTime = nextRefreshTime
        else
          nearestTime = math.min(nearestTime, nextRefreshTime)
        end
        hasRefreshTime = true
      end
    end
    ChangeUIController(shopEnterBtn, "time", hasRefreshTime and 1 or 0)
    if hasRefreshTime then
      local serverTime = LoginData.GetCurServerTime()
      local diff = nearestTime - serverTime
      timeTxt.text = TimeUtil.FormatEnTime(diff)
      local go = ResourceManager.Instantiate("Assets/Art/Models/UI_spine/prefab/ui_timeword_hourglass.prefab")
      UIUtil.SetObjectToUI(go, holder, 12000)
      local timer
      timer = TimerUtil.new(1, math.ceil(diff), function()
        local flag, time = false, false
        for _, data in pairs(goods) do
          local nextRefreshTime = data.nextRefreshTime
          if nextRefreshTime > 0 then
            if not flag then
              time = nextRefreshTime
            else
              time = math.min(time, nextRefreshTime)
            end
            flag = true
          end
        end
        if not flag then
          timer:stop()
          return
        end
        if CheckRefreshTimestampAndRefreshData(time, true) then
          timer:stop()
          return
        end
        timeTxt.text = TimeUtil.FormatEnTime(nearestTime - LoginData.GetCurServerTime())
      end)
      timer:start()
      table.insert(nearestRefreshTimers, timer)
    end
  else
    ChangeUIController(shopEnterBtn, "time", 0)
  end
  UIUtil.SetBtnText(shopEnterBtn, item.name)
  ChangeUIController(shopEnterBtn, "c1", item.btnCtrlIndex)
  shopEnterBtn.onClick:Set(function()
    uis.Main.c1Ctr.selectedIndex = item.mainPageCtrlIndex
    ShiftShop(item.type)
  end)
end
local StopAndClearAllNearestRefreshTimers = function()
  if not nearestRefreshTimers then
    return
  end
  for _, v in pairs(nearestRefreshTimers) do
    v:stop()
  end
  table.clear(nearestRefreshTimers)
end
local RefreshEntranceBtns = function(play)
  RedDotMgr.RemoveNode(WinResConfig.AbyssShopWindow.name)
  if not nearestRefreshTimers then
    nearestRefreshTimers = {}
  end
  StopAndClearAllNearestRefreshTimers()
  playanim = play
  uis.Main.TipsList.numItems = #shoplist
  playanim = true
  RedDotMgr.UpdateNodeByWindowName(WinResConfig.AbyssShopWindow.name)
end

function AbyssShopWindow.UpdateInfo()
  RedDotAbyss.Init()
  local main = uis.Main
  CurrencyReturnWindow.SetCurrencyReturn(WinResConfig.AbyssShopWindow.name, main.CurrencyReturn, FEATURE_ENUM.ABYSS_SHOP, function()
    if 0 ~= main.c1Ctr.selectedIndex then
      if 3 == main.c1Ctr.selectedIndex and 0 ~= main.MaterialSell.c1Ctr.selectedIndex then
        main.MaterialSell.c1Ctr.selectedIndex = 0
        main.MaterialSell.TabList.selectedIndex = 1
        return
      end
      selectedShopType = -1
      StopAndClearAllRefreshTimers()
      main.c1Ctr.selectedIndex = 0
      RefreshShopAssets(false)
      RefreshEntranceBtns(false)
      main.BackGround.BackGroundLoader.url = UIUtil.GetResUrl(TableData.GetConfig(11303, "BaseFeature").back_ground)
      return
    end
    UIMgr:CloseWindow(WinResConfig.AbyssShopWindow.name)
  end)
  main.BackGround.BackGroundLoader.url = UIUtil.GetResUrl(TableData.GetConfig(11303, "BaseFeature").back_ground)
  main.c1Ctr.onChanged:Set(function()
    if 3 ~= main.c1Ctr.selectedIndex then
      StopAndClearSellEffects()
    end
  end)
  local list = main.TipsList
  list.defaultItem = UIUtil.GetResUrl("Abyss:ShopEnterAni")
  list.itemRenderer = ShopEntranceRenderer
  selectedShopType = -1
  local defaultShop
  if type(defaultTab) == "number" then
    defaultShop = shoplist[defaultTab]
  end
  if defaultShop then
    main.c1Ctr.selectedIndex = defaultShop.mainPageCtrlIndex
    ShiftShop(defaultShop.type)
  else
    RefreshShopAssets(false)
    RefreshEntranceBtns(true)
  end
  local tradeTips = T(20014)
  local notingTips = T(20015)
  local sellTitle = T(20016)
  local sellSubtitle = T(20020)
  local sellbtnTitle = T(20017)
  local sellbtnSubtitle = T(20021)
  local allputinTitle = T(20018)
  local allputinSubtitle = T(20021)
  local selectTradableTips = T(20019)
  local panel = main.MaterialSell
  panel.Nothing.WordTxt.text = notingTips
  panel.MaterialSell.Nothing.WordTxt.text = notingTips
  panel.MaterialSell.TotalPriceStrip.WordTxt.text = tradeTips
  panel.MaterialSell.SellTitle.NameTxt.text = sellTitle
  panel.MaterialSell.SellTitle.SubtitleTxt.text = sellSubtitle
  panel.MaterialSell.WordTxt.text = selectTradableTips
  UIUtil.SetBtnText(panel.AllPutBtn, allputinTitle, allputinSubtitle)
  UIUtil.SetBtnText(panel.MaterialSell.SellBtn, sellbtnTitle, sellbtnSubtitle)
end

function AbyssShopWindow.InitBtn()
end

function AbyssShopWindow.OnShown()
end

function AbyssShopWindow.OnHide()
end

function AbyssShopWindow.OnClose()
  uis = nil
  contentPane = nil
  RedDotMgr.UpdateNodeByWindowName(WinResConfig.AbyssWindow.name)
  if sellInterface then
    Net.RemoveListener(Proto.MsgName.BatchUseItemsRsp, sellCallback)
  end
  sellInterface = nil
  RedDotMgr.RemoveNode(WinResConfig.AbyssShopWindow.name)
  StopAndClearAllRefreshTimers()
  refreshTimers = nil
  StopAndClearAllNearestRefreshTimers()
  nearestRefreshTimers = nil
  StopAndClearSellEffects()
  local cnt = reusable_ggraphs and #reusable_ggraphs or 0
  for _ = 1, cnt do
    table.remove(reusable_ggraphs):Dispose()
  end
end

function AbyssShopWindow.HandleMessage(msgId, para)
  if msgId == WindowMsgEnum.AbyssShopWindow.REFRESH_SHOP then
    if selectedShopType > 0 then
      ShiftShop(selectedShopType, true)
    else
      RefreshEntranceBtns(false)
    end
  elseif msgId == WindowMsgEnum.AbyssShopWindow.ITEMS_SOLD then
    PlaySellEffectsAndRefresh()
  elseif msgId == WindowMsgEnum.AbyssShopWindow.SWITCH_PANEL and type(para) == "number" then
    local item = shoplist[para]
    local targetType = item.type
    if targetType ~= selectedShopType then
      uis.Main.c1Ctr.selectedIndex = item.mainPageCtrlIndex
      ShiftShop(targetType)
    end
  end
end

return AbyssShopWindow
