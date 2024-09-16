require("Message_ItemTipsWindowByName")
local ItemTipsWindow = {}
local uis, contentPane, itemInfo, itemConfig, selectIndex, selectItemId, isLook, isUse, wayData, energyNum, energyMax, itemType, haveCount, indexMap, jumpData, itemTime, viewOnly, sureCallback, buyNum
local SELECT_TYPE = {
  Item = 1,
  Card = 2,
  Fashion = 3
}

function ItemTipsWindow.ReInitData()
end

function ItemTipsWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.ItemTipsWindow.package, WinResConfig.ItemTipsWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetMessage_ItemTipsWindowUis(contentPane)
    local itemId = bridgeObj.argTable[1]
    viewOnly = bridgeObj.argTable[2]
    sureCallback = bridgeObj.argTable[3]
    itemInfo = ActorData.GetItemInfoById(itemId)
    if nil == itemInfo then
      itemInfo = ActorData.GetItemInfoByUid(itemId)
    end
    if itemInfo then
      itemConfig = TableData.GetConfig(itemInfo.itemId, "BaseItem")
    else
      itemConfig = TableData.GetConfig(itemId, "BaseItem")
    end
    ItemTipsWindow.InitBtn()
    ItemTipsWindow.UpdateInfo(true)
    ItemTipsWindow.CheckItemTime()
    SoundUtil.PlayUISfx(SOUND_EVENT_ENUM.GET_ITEM_IN)
  end)
end

function ItemTipsWindow.CheckItemTime()
  if itemInfo and 0 ~= itemInfo.expireStamp then
    uis.Main.root.onClick:Set(function()
      if itemInfo.expireStamp < LoginData.GetCurServerTime() then
        FloatTipsUtil.ShowWarnTips(T(1063))
        UIMgr:CloseWindow(WinResConfig.ItemTipsWindow.name)
      end
    end)
  end
end

function ItemTipsWindow.InitItemInfo()
  local Modular = uis.Main.MainModular
  Modular.ItemLoader.url = UIUtil.GetResUrl(itemConfig.icon)
  Modular.NameTxt.text = itemConfig.name()
  
  function Modular.WordList.itemRenderer(i, item)
    UIUtil.SetText(item, itemConfig.remark and itemConfig.remark() or "", "WordTxt")
    UIUtil.SetText(item, itemConfig.des and itemConfig.des() or "", "UseTxt")
  end
  
  Modular.WordList.numItems = 1
  Modular.NumberTxt.text = T(117, ActorData.GetItemCount(itemConfig.id))
  uis.Main.MainModular.Way.WordTxt.text = T(711)
  uis.Main.MainModular.Way.NameTxt.text = T(841)
  uis.Main.MainModular.Way.SubtitleTxt.text = T(842)
  if 1 == itemConfig.go_to_type then
    uis.Main.MainModular.c1Ctr.selectedIndex = 1
  else
    if itemConfig.go_to_id then
      ItemTipsWindow.GetGoToData()
    else
      uis.Main.MainModular.Way.c1Ctr.selectedIndex = 1
    end
    uis.Main.MainModular.c1Ctr.selectedIndex = 0
  end
  if itemConfig.useLevel and ActorData.GetLevel() < itemConfig.useLevel then
    local itemLevel = UIMgr:CreateComponent("Message", "ItemLevel")
    UIUtil.SetText(itemLevel, T(116, itemConfig.useLevel), "UseTxt")
    Modular.InfoList:AddChild(itemLevel)
  end
  ItemTipsWindow.UpdateExpireTime()
end

function ItemTipsWindow.LoadLookBtn()
  if itemConfig.view_type and 1 == itemConfig.view_type then
    local Btn = UIMgr:CreateComponent("Message", "LookBtn")
    Btn.onClick:Set(ItemTipsWindow.LookGift)
    uis.Main.MainModular.InfoList:AddChildAt(Btn, 0)
  end
end

function ItemTipsWindow.LookGift()
  if isUse then
    uis.Main.DetailsModular.c1Ctr.selectedIndex = 0
    uis.Main.DetailsModular.NumberTxt.text = T(709, 0)
  else
    isLook = true
    uis.Main.DetailsModular.c1Ctr.selectedIndex = 1
    uis.Main.DetailsModular.NumberTxt.text = ""
  end
  local effectValue = ItemTipsWindow.GetSelectItem()
  uis.Main.DetailsModular.ItemList:RemoveChildrenToPool()
  for index, config in ipairs(effectValue) do
    local item = uis.Main.DetailsModular.ItemList:AddItemFromPool()
    local itemFrame = item:GetChild("ItemFrame")
    UIUtil.ShowItemFrame(tonumber(config[2]), itemFrame, tonumber(config[3]))
    itemFrame.onClick:Set(function()
      selectIndex = index
      selectItemId = tonumber(config[2])
      uis.Main.DetailsModular.NumberTxt.text = T(708, 1)
    end)
    item.touchable = isUse
  end
  if itemConfig.type == ProtoEnum.ITEM_TYPE.CHOSEN_PACKAGE then
    if isUse then
      uis.Main.DetailsModular.WordTxt.text = T(128)
    else
      uis.Main.DetailsModular.WordTxt.text = T(706)
    end
  elseif itemConfig.type == ProtoEnum.ITEM_TYPE.RANDOM_PACKAGE then
    uis.Main.DetailsModular.WordTxt.text = T(710)
  elseif itemConfig.type == ProtoEnum.ITEM_TYPE.FIX_COUNT_PACKAGE then
    uis.Main.DetailsModular.WordTxt.text = T(963)
  else
    uis.Main.DetailsModular.WordTxt.text = T(707)
  end
  uis.Main.c1Ctr.selectedIndex = 1
end

function ItemTipsWindow.GetEnergyMax()
  local config = TableData.GetConfig(70010003, "BaseFixed")
  return config.int_value
end

function ItemTipsWindow.GetMonthPayProductData()
  local type = tonumber(itemConfig.effect_value)
  if type then
    local payData = TableData.GetTable("BasePayProduct")
    for i, v in pairs(payData) do
      if v.month_card_type and v.month_card_type == type then
        return v
      end
    end
  end
end

function ItemTipsWindow.InitStrip()
  local numberStrip = uis.Main.NumberModular.NumberStrip
  ItemTipsWindow.CheckIsEnergy()
  haveCount = itemInfo and ActorData.GetItemCountByUid(itemInfo.itemUid) or 0
  if itemType == ProtoEnum.ITEM_TYPE.FIX_COUNT_PACKAGE then
    local str = Split(itemConfig.effect_value, "|")
    local num = tonumber(str[1])
    if num and num > 1 then
      haveCount = math.floor(haveCount / num)
    end
  end
  local totalNum = haveCount
  if energyNum then
    local number = math.floor((ItemTipsWindow.GetEnergyMax() - ActorData.GetItemCount(COMMON_ITEM_ID.ENERGY)) / energyNum)
    if number < 1 then
      energyMax = true
    else
      if number >= 2 then
        totalNum = number > haveCount and haveCount or number
      elseif 1 == number then
        totalNum = 1
      end
      energyMax = false
    end
    UIUtil.SetIconById(uis.Main.NumberModular.ItemNumberStrip.PriceLoader, COMMON_ITEM_ID.ENERGY)
  end
  uis.Main.NumberModular.ItemNumberStrip.Price1Txt.text = T(1089)
  if itemConfig.salePrice then
    UIUtil.SetIconById(uis.Main.NumberModular.ItemNumberStrip.PriceLoader, COMMON_ITEM_ID.GAME_COIN)
  end
  local priceTxt = uis.Main.NumberModular.ItemNumberStrip.PriceTxt
  local UpdateBuyNum = function()
    if energyNum then
      priceTxt.text = T(947, ActorData.GetItemCount(COMMON_ITEM_ID.ENERGY), Mathf.FloorToInt(energyNum * buyNum), ActorData.GetEnergyMax())
    end
    if itemConfig.salePrice then
      priceTxt.text = Mathf.FloorToInt(itemConfig.salePrice * buyNum)
    end
    ChangeController(uis.Main.NumberModular.c1Ctr, (energyNum or itemConfig.salePrice) and 1 or 0)
    numberStrip.ChoiceNumberTxt.text = T(1025, buyNum, haveCount)
    ChangeUIController(numberStrip.MaxBtn, "c1", buyNum == totalNum and 1 or 0)
    ChangeUIController(numberStrip.AddBtn, "c1", buyNum == totalNum and 1 or 0)
    ChangeUIController(numberStrip.ReduceBtn, "c1", 1 == buyNum and 1 or 0)
    ChangeUIController(numberStrip.MinBtn, "c1", 1 == buyNum and 1 or 0)
  end
  buyNum = 1
  local longSpeed = 1
  UIUtil.SetText(numberStrip.MaxBtn, T(1024))
  UIUtil.SetText(numberStrip.MinBtn, T(1023))
  numberStrip.MaxBtn.onClick:Set(function()
    if energyNum and buyNum == totalNum then
      FloatTipsUtil.ShowWarnTips(T(939))
    end
    buyNum = totalNum
    UpdateBuyNum()
  end)
  numberStrip.MinBtn.onClick:Set(function()
    buyNum = 1
    UpdateBuyNum()
  end)
  numberStrip.AddBtn.onClick:Set(function()
    buyNum = math.min(buyNum + 1, totalNum)
    UpdateBuyNum()
    if energyNum and buyNum == totalNum then
      FloatTipsUtil.ShowWarnTips(T(939))
    end
  end)
  numberStrip.ReduceBtn.onClick:Set(function()
    buyNum = math.max(buyNum - 1, 1)
    UpdateBuyNum()
  end)
  local spNum = 1
  local gesture = ItemTipsWindow.GetGesture(numberStrip.AddBtn)
  gesture.onAction:Set(function()
    if spNum > 5 then
      longSpeed = longSpeed + 1
      spNum = 1
    end
    buyNum = math.min(buyNum + longSpeed, totalNum)
    UpdateBuyNum()
    spNum = spNum + 1
  end)
  gesture.onBegin:Set(function()
    longSpeed = 1
    spNum = 1
  end)
  gesture.onEnd:Set(function()
    longSpeed = 1
    spNum = 1
  end)
  local gestureReduce = ItemTipsWindow.GetGesture(numberStrip.ReduceBtn)
  gestureReduce.onAction:Set(function()
    if spNum > 5 then
      longSpeed = longSpeed + 1
      spNum = 1
    end
    buyNum = math.max(buyNum - longSpeed, 1)
    UpdateBuyNum()
    spNum = spNum + 1
  end)
  gestureReduce.onBegin:Set(function()
    longSpeed = 1
    spNum = 1
  end)
  gestureReduce.onEnd:Set(function()
    longSpeed = 1
    spNum = 1
  end)
  UpdateBuyNum()
end

function ItemTipsWindow.GetGesture(btn)
  local longPress = LongPressGesture.GetLongPressGesture(btn)
  longPress.trigger = 0.5
  longPress.interval = 0.2
  return longPress
end

function ItemTipsWindow.UpdateInfo(isInit)
  itemType = itemConfig.type
  UIUtil.SetBtnText(uis.Main.MainModular.Way.TitleBtn, T(701), T(702))
  uis.Main.DetailsModular.WordTxt.text = T(127)
  if true == isInit then
    ItemTipsWindow.InitItemInfo()
  end
  ItemTipsWindow.InitStrip()
  if viewOnly then
    UIUtil.SetBtnText(uis.Main.MainModular.Popup_B_Green_Btn, T(302), T(303))
    if sureCallback then
      uis.Main.MainModular.Popup_B_Green_Btn.onClick:Set(function()
        sureCallback()
        ItemTipsWindow.CloseWindow()
      end)
    else
      uis.Main.MainModular.Popup_B_Green_Btn.onClick:Set(ItemTipsWindow.CloseWindow)
    end
    return
  end
  if itemType == ProtoEnum.ITEM_TYPE.CHOSEN_PACKAGE or itemType == ProtoEnum.ITEM_TYPE.REGULAR_PACKAGE or itemType == ProtoEnum.ITEM_TYPE.RANDOM_PACKAGE then
    if true == isInit then
      if itemConfig.select_type and itemConfig.select_type ~= SELECT_TYPE.Item then
        if itemConfig.select_type == SELECT_TYPE.Card then
          ItemTipsWindow.SelectCard()
        elseif itemConfig.select_type == SELECT_TYPE.Fashion then
          CardService.GetAllCardFashionReq(function()
            ItemTipsWindow.SelectFashion()
          end)
        end
      else
        ItemTipsWindow.SelectItem()
      end
    end
  elseif itemType == ProtoEnum.ITEM_TYPE.FIX_COUNT_PACKAGE then
    ItemTipsWindow.ConvertItem()
  elseif haveCount > 0 and itemConfig.salePrice then
    if true == isInit then
      uis.Main.NumberModular.NameTxt.text = itemConfig.name()
      
      function uis.Main.NumberModular.WordList.itemRenderer(i, item)
        UIUtil.SetText(item, itemConfig.remark(), "WordTxt")
      end
      
      uis.Main.NumberModular.WordList.numItems = 1
      uis.Main.c1Ctr.selectedIndex = 0
      UIUtil.SetBtnText(uis.Main.MainModular.Popup_B_Green_Btn, T(115), T(109))
      uis.Main.MainModular.Popup_B_Green_Btn.onClick:Set(function()
        uis.Main.c1Ctr.selectedIndex = 2
      end)
      UIUtil.SetBtnText(uis.Main.NumberModular.Popup_S_Black_Btn, T(10052), T(10053))
      uis.Main.NumberModular.Popup_S_Black_Btn.onClick:Set(function()
        uis.Main.c1Ctr.selectedIndex = 0
      end)
      UIUtil.SetBtnText(uis.Main.NumberModular.Popup_S_Green_Btn, T(302), T(303))
      uis.Main.NumberModular.Popup_S_Green_Btn.onClick:Set(function()
        BagService.SaleItemReq(itemInfo.itemUid, buyNum, function()
          ItemTipsWindow.CloseWindow(true)
        end)
      end)
    end
  elseif itemType == ProtoEnum.ITEM_TYPE.PROFESSION_PACKAGE then
    ItemTipsWindow.InitBreachGift()
  elseif itemType == ProtoEnum.ITEM_TYPE.MONTH_CARD then
    ItemTipsWindow.InitMonthCard()
  elseif itemType == ProtoEnum.ITEM_TYPE.BATTLE_PASS then
    ItemTipsWindow.InitHighPassPart()
  elseif itemType == ProtoEnum.ITEM_TYPE.BATTLE_PASS_SINIOR then
    ItemTipsWindow.InitSuperPassPart()
  else
    UIUtil.SetBtnText(uis.Main.MainModular.Popup_B_Green_Btn, T(302), T(303))
    uis.Main.MainModular.Popup_B_Green_Btn.onClick:Set(ItemTipsWindow.CloseWindow)
  end
end

function ItemTipsWindow.GetSelectItem()
  local effectValue = {}
  if itemConfig.view_item then
    for i = 1, #itemConfig.view_item do
      local data = Split(itemConfig.view_item[i], ":")
      effectValue[#effectValue + 1] = data
    end
  end
  return effectValue
end

function ItemTipsWindow.InitSuperPassPart()
  local onlyLook = true
  local passId = PassportData.GetNextPassport()
  local superData
  if passId then
    superData = PassportMgr.GetPlatformId(passId, 6)
    local minData = PassportMgr.GetPlatformId(passId, 4)
    local state = ShopData.limitRecord[minData.id] or ShopData.limitRecord[superData.id]
    if not state then
      onlyLook = nil
      UIUtil.SetBtnText(uis.Main.MainModular.Popup_B_Green_Btn, T(114), T(111))
      uis.Main.MainModular.Popup_B_Green_Btn.onClick:Set(function()
        uis.Main.c1Ctr.selectedIndex = 8
        local sendTips = true
        local passTips = uis.Main.PassportModular
        passTips.WordTxt.text = T(1556)
        passTips.NumberTxt.text = T(1557)
        
        function passTips.ItemList.itemRenderer(i, item)
          UIUtil.SetText(item, T(1451), "NameTxt")
          UIUtil.SetText(item, T(1559), "WordTxt")
          item.onClick:Set(function()
            sendTips = false
            passTips.NumberTxt.text = T(1558)
            ChangeUIController(item, "c3", 1)
          end)
          ChangeUIController(item, "c1", 1)
          ChangeUIController(item, "c2", 0)
          ChangeUIController(item, "c3", 0)
        end
        
        passTips.ItemList.numItems = 1
        UIUtil.SetBtnText(passTips.Popup_S_Black_Btn, T(10052), T(10053))
        passTips.Popup_S_Black_Btn.onClick:Set(function()
          uis.Main.c1Ctr.selectedIndex = 0
        end)
        UIUtil.SetBtnText(passTips.Popup_S_Green_Btn, T(302), T(303))
        passTips.Popup_S_Green_Btn.onClick:Set(function()
          if sendTips then
            FloatTipsUtil.ShowWarnTips(T(1560))
            return
          end
          MessageBox.Show(T(1486), {
            touchCallback = function()
              BagService.UseItemReq(itemInfo.itemUid, buyNum, passId, function(msg)
                for i = #msg.items, 1, -1 do
                  if 0 == msg.items[i].count then
                    table.remove(msg.items, i)
                  end
                end
                GetItemTips.Show(msg.items, true)
                if uis then
                  ItemTipsWindow.CloseWindow(true)
                end
                ShopService.PurchaseGetReq()
              end)
            end
          }, {})
        end)
      end)
    end
  end
  if onlyLook then
    UIUtil.SetBtnText(uis.Main.MainModular.Popup_B_Green_Btn, T(114), T(111))
    uis.Main.MainModular.Popup_B_Green_Btn.onClick:Set(function()
      if superData and ShopData.limitRecord[superData.id] then
        FloatTipsUtil.ShowWarnTips(T(1483))
      else
        FloatTipsUtil.ShowWarnTips(T(1579))
      end
    end)
  end
  uis.Main.c1Ctr.selectedIndex = 0
end

function ItemTipsWindow.InitHighPassPart()
  local onlyLook = true
  local passId = PassportData.GetNextPassport()
  if passId then
    local data = PassportMgr.GetPlatformId(passId, 4)
    local superData = PassportMgr.GetPlatformId(passId, 6)
    local state = ShopData.limitRecord[data.id] or ShopData.limitRecord[superData.id]
    if not state then
      onlyLook = nil
      UIUtil.SetBtnText(uis.Main.MainModular.Popup_B_Green_Btn, T(114), T(111))
      uis.Main.MainModular.Popup_B_Green_Btn.onClick:Set(function()
        uis.Main.c1Ctr.selectedIndex = 8
        local sendTips = true
        local passTips = uis.Main.PassportModular
        passTips.WordTxt.text = T(1556)
        passTips.NumberTxt.text = T(1557)
        
        function passTips.ItemList.itemRenderer(i, item)
          UIUtil.SetText(item, T(1450), "NameTxt")
          UIUtil.SetText(item, T(1559), "WordTxt")
          item.onClick:Set(function()
            sendTips = false
            passTips.NumberTxt.text = T(1558)
            ChangeUIController(item, "c3", 1)
          end)
          ChangeUIController(item, "c1", 0)
          ChangeUIController(item, "c2", 0)
          ChangeUIController(item, "c3", 0)
        end
        
        passTips.ItemList.numItems = 1
        UIUtil.SetBtnText(passTips.Popup_S_Black_Btn, T(10052), T(10053))
        passTips.Popup_S_Black_Btn.onClick:Set(function()
          uis.Main.c1Ctr.selectedIndex = 0
        end)
        UIUtil.SetBtnText(passTips.Popup_S_Green_Btn, T(302), T(303))
        passTips.Popup_S_Green_Btn.onClick:Set(function()
          if sendTips then
            FloatTipsUtil.ShowWarnTips(T(1560))
            return
          end
          MessageBox.Show(T(1485), {
            touchCallback = function()
              BagService.UseItemReq(itemInfo.itemUid, buyNum, passId, function(msg)
                for i = #msg.items, 1, -1 do
                  if 0 == msg.items[i].count then
                    table.remove(msg.items, i)
                  end
                end
                GetItemTips.Show(msg.items, true)
                if uis then
                  ItemTipsWindow.CloseWindow(true)
                end
                ShopService.PurchaseGetReq()
              end)
            end
          }, {})
        end)
      end)
    end
  end
  if onlyLook then
    UIUtil.SetBtnText(uis.Main.MainModular.Popup_B_Green_Btn, T(114), T(111))
    uis.Main.MainModular.Popup_B_Green_Btn.onClick:Set(function()
      FloatTipsUtil.ShowWarnTips(T(1482))
    end)
  end
  uis.Main.c1Ctr.selectedIndex = 0
end

function ItemTipsWindow.InitMonthCard()
  local onlyLook = true
  local data = ItemTipsWindow.GetMonthPayProductData()
  if data then
    local day = ShopMgr.GetMonthCardDay(data)
    if day <= data.sell_limit_max then
      onlyLook = nil
      UIUtil.SetBtnText(uis.Main.MainModular.Popup_B_Green_Btn, T(114), T(111))
      uis.Main.MainModular.Popup_B_Green_Btn.onClick:Set(function()
        MessageBox.Show(T(1487), {
          touchCallback = function()
            BagService.UseItemReq(itemInfo.itemUid, buyNum, "", function(msg)
              GetItemTips.Show(msg.items, true, function()
                ShopService.PurchaseGetReq(function()
                  ShopMgr.CheckMonthCardDay()
                end)
              end)
              if uis then
                ItemTipsWindow.CloseWindow(true)
              end
            end)
          end
        }, {})
      end)
    else
      UIUtil.SetBtnText(uis.Main.MainModular.Popup_B_Green_Btn, T(302), T(303))
      uis.Main.MainModular.Popup_B_Green_Btn.onClick:Set(ItemTipsWindow.CloseWindow)
    end
  end
  if onlyLook then
    UIUtil.SetBtnText(uis.Main.MainModular.Popup_B_Green_Btn, T(114), T(111))
    uis.Main.MainModular.Popup_B_Green_Btn.onClick:Set(function()
      FloatTipsUtil.ShowWarnTips(T(1484))
    end)
  end
  uis.Main.c1Ctr.selectedIndex = 0
end

function ItemTipsWindow.InitBreachGift()
  UIUtil.SetBtnText(uis.Main.MainModular.Popup_B_Green_Btn, T(114), T(111))
  uis.Main.MainModular.Popup_B_Green_Btn.onClick:Set(function()
    uis.Main.c1Ctr.selectedIndex = 7
  end)
  local tips = uis.Main.BreachGiftModular
  tips.WordTxt.text = T(1444)
  UIUtil.SetBtnText(tips.Popup_S_Black_Btn, T(10052), T(10053))
  tips.Popup_S_Black_Btn.onClick:Set(function()
    uis.Main.c1Ctr.selectedIndex = 0
  end)
  UIUtil.SetBtnText(tips.Popup_S_Green_Btn, T(10244), T(10245))
  tips.Popup_S_Green_Btn.onClick:Set(function()
    uis.Main.c1Ctr.selectedIndex = 2
  end)
  tips.NumberTxt.text = T(1445)
  local breachData = ItemTipsWindow.GetBreachGiftItemData()
  local tbCtr = {
    0,
    1,
    3,
    4
  }
  local lastChoiceBtn
  
  function tips.ItemList.itemRenderer(index, item)
    local typeData = breachData[index + 1]
    local choiceBtn = item:GetChild("ChoiceBtn")
    ChangeUIController(choiceBtn, "c1", tbCtr[index + 1])
    choiceBtn.changeStateOnClick = false
    local itemList = item:GetChild("ItemList")
    
    function itemList.itemRenderer(i, typeItem)
      UIUtil.ShowItemFrame(typeData[i + 1].id, typeItem, typeData[i + 1].count, nil, function()
        UIUtil.CommonItemClickCallback(typeData[i + 1].id, typeData[i + 1].type)
      end)
    end
    
    itemList.numItems = #typeData
    item.onClick:Set(function()
      selectIndex = index + 1
      if lastChoiceBtn then
        if lastChoiceBtn == choiceBtn then
          return
        end
        lastChoiceBtn.selected = false
      end
      choiceBtn.selected = true
      lastChoiceBtn = choiceBtn
      tips.NumberTxt.text = T(1446)
    end)
  end
  
  tips.ItemList.numItems = #breachData
  uis.Main.NumberModular.NameTxt.text = itemConfig.name()
  if itemConfig.remark then
    function uis.Main.NumberModular.WordList.itemRenderer(i, item)
      UIUtil.SetText(item, itemConfig.remark(), "WordTxt")
    end
    
    uis.Main.NumberModular.WordList.numItems = 1
  end
  UIUtil.SetBtnText(uis.Main.NumberModular.Popup_S_Black_Btn, T(10052), T(10053))
  uis.Main.NumberModular.Popup_S_Black_Btn.onClick:Set(function()
    uis.Main.c1Ctr.selectedIndex = 7
  end)
  UIUtil.SetBtnText(uis.Main.NumberModular.Popup_S_Green_Btn, T(302), T(303))
  uis.Main.NumberModular.Popup_S_Green_Btn.onClick:Set(function()
    BagService.UseItemReq(itemInfo.itemUid, buyNum, selectIndex, function(msg)
      GetItemTips.Show(msg.items, true)
      if uis then
        ItemTipsWindow.CloseWindow(true)
      end
    end)
  end)
end

function ItemTipsWindow.GetBreachGiftItemData()
  local breachData = {}
  if itemConfig and itemConfig.effect_value then
    local ids = Split(itemConfig.effect_value, "&")
    for i = 1, #ids do
      local arr = Split(ids[i], "|")
      if arr then
        breachData[i] = {}
        for index = 1, #arr do
          local tempArr = Split(arr[index], ":")
          if #tempArr then
            table.insert(breachData[i], {
              type = tonumber(tempArr[1]),
              id = tonumber(tempArr[2]),
              count = tonumber(tempArr[3])
            })
          end
        end
      end
    end
  end
  return breachData
end

function ItemTipsWindow.GetSelectCardData()
  local selectItem = ItemTipsWindow.GetSelectItem()
  local haveCard = {}
  indexMap = {}
  local card = {}
  local cardInfo = ActorData.GetCardList()
  local isHave = function(id)
    for i, v in pairs(cardInfo) do
      if v.cardId == id then
        return true
      end
    end
  end
  for i, v in pairs(selectItem) do
    local id = tonumber(v[2])
    indexMap[id] = i
    local data = TableData.GetConfig(id, "BaseCard")
    if isHave(id) then
      table.insert(haveCard, data)
    else
      table.insert(card, data)
    end
  end
  local sortFun = function(a, b)
    if a.star == b.star then
      return a.id > b.id
    else
      return a.star > b.star
    end
  end
  table.sort(card, sortFun)
  table.sort(haveCard, sortFun)
  return card, haveCard
end

function ItemTipsWindow.SelectCard()
  local cardCom = uis.Main.CardChangeModular
  UIUtil.SetBtnText(uis.Main.MainModular.Popup_B_Green_Btn, T(114), T(111))
  cardCom.WordTxt.text = T(832)
  cardCom.NumberTxt.text = T(709, 0)
  local init = true
  uis.Main.MainModular.Popup_B_Green_Btn.onClick:Set(function()
    if init then
      local card, haveCard = ItemTipsWindow.GetSelectCardData()
      local createFun = function(data, have)
        local tb = {}
        local show = true
        for i = 1, #data do
          table.insert(tb, data[i])
          if #tb >= 5 or i == #data then
            local com = UIMgr:CreateComponent("Message", "CardList")
            cardCom.CardList:AddChild(com)
            ItemTipsWindow.ShowCardOneLine(com, tb, have, show)
            tb = {}
            show = false
          end
        end
      end
      createFun(card, true)
      createFun(haveCard, false)
      init = false
    end
    uis.Main.c1Ctr.selectedIndex = 3
  end)
end

function ItemTipsWindow.ShowCardOneLine(com, data, have, show)
  if com then
    if show then
      com:GetChild("WordTxt").text = have and T(833) or T(834)
    else
      com:GetChild("WordTxt").text = ""
    end
    local list = com:GetChild("CardList")
    
    function list.itemRenderer(i, head)
      local id = data[i + 1].id
      local cardBtn = head:GetChild("CardHeadBtn")
      local info = CardData.GetCardDataById(id)
      if info then
        UIUtil.ShowCardTips(info, cardBtn, function()
          selectIndex = i
          uis.Main.CardChangeModular.NumberTxt.text = T(708, 1)
          ItemTipsWindow.ShowCardDetails(data[i + 1])
          uis.Main.c1Ctr.selectedIndex = 4
        end, nil, HEAD_ICON_TYPE_ENUM.RECT)
      else
        UIUtil.ShowCardTips({
          cardId = id,
          grade = -1,
          fashionId = 0
        }, cardBtn, function()
          selectIndex = i
          uis.Main.CardChangeModular.NumberTxt.text = T(708, 1)
          ItemTipsWindow.ShowCardDetails(data[i + 1])
          uis.Main.c1Ctr.selectedIndex = 4
        end, nil, HEAD_ICON_TYPE_ENUM.RECT)
      end
      cardBtn.alpha = 0
      PlayUITrans(head, "in", nil, i * 0.05)
      ChangeUIController(cardBtn, "c1", data[i + 1].star - 1)
    end
    
    list.numItems = #data
  end
end

function ItemTipsWindow.ShowCardDetails(configData)
  local info = uis.Main.CardDetailsModular
  local cardInfo = CardData.GetCardDataById(configData.id)
  info.WordTxt.text = T(835, itemConfig.name(), configData.name())
  local fid = cardInfo and cardInfo.fashionId or configData.fashion_id
  local fashionData = TableData.GetConfig(fid, "BaseFashion")
  if fashionData then
    info.CardPic.PicLoader.url = UIUtil.GetResUrl(fashionData.head_icon_banner)
  end
  info.CardName.Name1Txt.text = configData.name()
  info.CardName.Name2Txt.text = configData.name_english()
  if cardInfo then
    UIUtil.ShowStarList(info.CardAttribute.StarList, cardInfo, configData)
  else
    UIUtil.ShowStarList(info.CardAttribute.StarList, {grade = -1}, configData)
  end
  info.SkillList.onClick:Set(function()
    UIUtil.OpenPreviewTips(configData.id, ProtoEnum.TUPLE_TYPE.CARD)
  end)
  UIUtil.ShowElementList(info.CardAttribute.ElementList, configData)
  info.CardAttribute.Occupation.c1Ctr.selectedIndex = configData.type - 1
  local skillList = info.SkillList
  local skillData = {
    configData.special_skill,
    configData.burst_skill
  }
  
  function skillList.itemRenderer(i, item)
    local data = TableData.GetConfig(skillData[i + 1], "BaseSkill")
    local skill = item:GetChild("Skill")
    ChangeUIController(skill, "c2", data.show_type)
    skill:GetChild("IconLoader").url = UIUtil.GetResUrl(data.icon)
    UIUtil.SetText(item, data.name(), "NameTxt")
  end
  
  skillList.numItems = #skillData
  UIUtil.SetBtnText(info.Popup_S_Black_Btn, T(10052), T(10053))
  info.Popup_S_Black_Btn.onClick:Set(function()
    uis.Main.CardChangeModular.NumberTxt.text = T(709, 0)
    uis.Main.c1Ctr.selectedIndex = 3
  end)
  local confirm = function()
    BagService.UseItemReq(itemInfo.itemUid, 1, indexMap[configData.id], function(msg)
      GetItemTips.Show(msg.items)
      if uis then
        ItemTipsWindow.CloseWindow(true)
      end
    end)
  end
  UIUtil.SetBtnText(info.Popup_S_Green_Btn, T(302), T(303))
  info.Popup_S_Green_Btn.onClick:Set(function()
    if nil == cardInfo then
      confirm()
    elseif cardInfo.grade >= configData.grade_max then
      local str = ItemTipsWindow.GetMessageBoxTips(configData.change_item_full, true)
      MessageBox.Show(T(836, str), {touchCallback = confirm})
    elseif configData.convert_item and ActorData.GetItemCount(configData.convert_item) >= configData.grade_max then
      local str = ItemTipsWindow.GetMessageBoxTips(configData.change_item_full, true)
      MessageBox.Show(T(837, str), {touchCallback = confirm}, {})
    else
      local str = ItemTipsWindow.GetMessageBoxTips(configData.change_item, true)
      MessageBox.Show(T(838, str), {touchCallback = confirm}, {})
    end
  end)
end

function ItemTipsWindow.GetMessageBoxTips(string, small)
  local str = ""
  local arr = GetConfigItemList(string, true)
  for i, v in ipairs(arr) do
    local d = TableData.GetConfig(v.id, "BaseItem")
    if d then
      local iconStr = small and d.icon_small and d.icon_small or d.icon
      local icon = Split(iconStr, ":")
      str = T(839, icon[1], icon[2], d.name()) .. str
    end
  end
  return str
end

function ItemTipsWindow.GetSelectFashionData()
  local selectItem = ItemTipsWindow.GetSelectItem()
  indexMap = {}
  local fashion = {}
  for i, v in pairs(selectItem) do
    local id = tonumber(v[2])
    indexMap[id] = i
    local data = TableData.GetConfig(id, "BaseFashion")
    if data then
      table.insert(fashion, {
        data = data,
        have = CardData.FashionIsContain(id)
      })
    end
  end
  if #fashion > 1 then
    table.sort(fashion, function(a, b)
      if a.have then
        return false
      end
      if b.have then
        return true
      end
      return false
    end)
  end
  return fashion
end

function ItemTipsWindow.SelectFashion()
  UIUtil.SetBtnText(uis.Main.MainModular.Popup_B_Green_Btn, T(114), T(111))
  local init = true
  uis.Main.MainModular.Popup_B_Green_Btn.onClick:Set(function()
    if init then
      local clothesCom = uis.Main.ClothesChangeModular
      clothesCom.WordTxt.text = T(832)
      clothesCom.NumberTxt.text = T(709, 0)
      local fashionData = ItemTipsWindow.GetSelectFashionData()
      
      function clothesCom.ClothesList.itemRenderer(i, item)
        local data = fashionData[i + 1]
        local btn = item:GetChild("ClothesCardBtn")
        if data.data.name then
          UIUtil.SetText(btn, data.data.name(), "ClothesNameTxt")
        end
        local cardData = TableData.GetConfig(data.data.card_id, "BaseCard")
        btn:GetChild("PicLoader").url = UIUtil.GetResUrl(data.data.head_icon_square)
        if cardData then
          UIUtil.SetText(btn, cardData.name(), "NameTxt")
        end
        if data.have then
          UIUtil.SetText(btn, T(698), "TipsTxt")
          ChangeUIController(btn, "c1", 1)
          item.onClick:Clear()
          item.touchable = false
        else
          item.touchable = true
          ChangeUIController(btn, "c1", 0)
          item.onClick:Set(function()
            selectIndex = 1
            ItemTipsWindow.ShowFashionDetails(data.data, cardData)
            uis.Main.c1Ctr.selectedIndex = 6
          end)
        end
        btn.alpha = 0
        PlayUITrans(item, "in", nil, i * 0.05)
      end
      
      clothesCom.ClothesList.numItems = #fashionData
      init = nil
    end
    uis.Main.c1Ctr.selectedIndex = 5
  end)
end

function ItemTipsWindow.ShowFashionDetails(fashionData, cardData)
  local info = uis.Main.ClothesDetailsModular
  UIUtil.SetBtnText(info.Popup_S_Black_Btn, T(10052), T(10053))
  info.Popup_S_Black_Btn.onClick:Set(function()
    uis.Main.c1Ctr.selectedIndex = 5
  end)
  UIUtil.SetBtnText(info.Popup_S_Green_Btn, T(302), T(303))
  info.Popup_S_Green_Btn.onClick:Set(function()
    BagService.UseItemReq(itemInfo.itemUid, 1, indexMap[fashionData.id], function(msg)
      GetItemTips.Show(msg.items)
      if uis then
        ItemTipsWindow.CloseWindow(true)
      end
    end)
  end)
  if cardData and fashionData then
    info.Name1Txt.text = cardData.name()
    info.Name2Txt.text = cardData.name_english()
    info.ClothesNameTxt.text = fashionData.name()
    info.WordTxt.text = T(840, itemConfig.name(), cardData.name(), fashionData.name())
    info.PicLoader.url = UIUtil.GetResUrl(fashionData.clothes_path)
  end
end

function ItemTipsWindow.SelectItem()
  ItemTipsWindow.LoadLookBtn()
  UIUtil.SetBtnText(uis.Main.MainModular.Popup_B_Green_Btn, T(114), T(111))
  uis.Main.MainModular.Popup_B_Green_Btn.onClick:Set(function()
    if nil == itemInfo then
      FloatTipsUtil.ShowWarnTips(T(7001200))
      return
    end
    if energyNum and energyMax then
      FloatTipsUtil.ShowWarnTips(T(735))
      return
    end
    uis.Main.NumberModular.NameTxt.text = itemConfig.name()
    
    function uis.Main.NumberModular.WordList.itemRenderer(i, item)
      UIUtil.SetText(item, itemConfig.remark(), "WordTxt")
    end
    
    uis.Main.NumberModular.WordList.numItems = 1
    if itemType == ProtoEnum.ITEM_TYPE.CHOSEN_PACKAGE then
      selectIndex = nil
      isUse = true
      ItemTipsWindow.LookGift()
      return
    else
      uis.Main.c1Ctr.selectedIndex = 2
    end
  end)
  UIUtil.SetBtnText(uis.Main.DetailsModular.Popup_B_Green_Btn, T(680), T(681))
  uis.Main.DetailsModular.Popup_B_Green_Btn.onClick:Set(function()
    isUse = false
    isLook = nil
    uis.Main.c1Ctr.selectedIndex = 0
  end)
  UIUtil.SetBtnText(uis.Main.DetailsModular.Popup_S_Black_Btn, T(10052), T(10053))
  uis.Main.DetailsModular.Popup_S_Black_Btn.onClick:Set(function()
    isUse = false
    uis.Main.c1Ctr.selectedIndex = 0
  end)
  UIUtil.SetBtnText(uis.Main.DetailsModular.Popup_S_Green_Btn, T(302), T(303))
  uis.Main.DetailsModular.Popup_S_Green_Btn.onClick:Set(function()
    if isUse then
      if nil == selectIndex then
        FloatTipsUtil.ShowWarnTips(T(128))
        return
      end
      local callBack = function()
        uis.Main.NumberModular.NameTxt.text = itemConfig.name()
        
        function uis.Main.NumberModular.WordList.itemRenderer(i, item)
          UIUtil.SetText(item, itemConfig.remark(), "WordTxt")
        end
        
        uis.Main.NumberModular.WordList.numItems = 1
        uis.Main.c1Ctr.selectedIndex = 2
      end
      local changeItemStr
      if selectItemId then
        local tempData = TableData.GetConfig(selectItemId, "BaseItem")
        if tempData and tempData.type == ProtoEnum.ITEM_TYPE.SAME_NAME_CARD and tempData.effect_value then
          local arr = Split(tempData.effect_value, "|")
          if 2 == #arr then
            local cardId = tonumber(arr[1])
            if cardId then
              local tempCardData = TableData.GetConfig(cardId, "BaseCard")
              local info = CardData.GetCardDataById(cardId)
              local grade = info and info.grade and info.grade or 0
              if tempCardData and ActorData.GetItemCount(selectItemId) >= tempCardData.grade_max - grade then
                changeItemStr = {
                  arr[2]
                }
              end
            end
          end
        end
        if nil == tempData then
          tempData = TableData.GetConfig(selectItemId, "BaseCard")
          if tempData then
            local info = CardData.GetCardDataById(selectItemId)
            if info then
              changeItemStr = tempData.change_item_full
            end
          end
        end
      end
      local str = changeItemStr and ItemTipsWindow.GetMessageBoxTips(changeItemStr, true) or ""
      if changeItemStr and not string.isEmptyOrNil(str) then
        MessageBox.Show(T(1070, str), {touchCallback = callBack}, {})
      else
        callBack()
      end
    end
  end)
  UIUtil.SetBtnText(uis.Main.NumberModular.Popup_S_Black_Btn, T(10052), T(10053))
  uis.Main.NumberModular.Popup_S_Black_Btn.onClick:Set(function()
    if itemType and itemType == ProtoEnum.ITEM_TYPE.CHOSEN_PACKAGE then
      uis.Main.c1Ctr.selectedIndex = 1
    else
      isUse = false
      uis.Main.c1Ctr.selectedIndex = 0
    end
  end)
  UIUtil.SetBtnText(uis.Main.NumberModular.Popup_S_Green_Btn, T(302), T(303))
  uis.Main.NumberModular.Popup_S_Green_Btn.onClick:Set(function()
    local useLevel = itemConfig.useLevel or 0
    if useLevel > ActorData.GetLevel() then
      FloatTipsUtil.ShowWarnTips(T(116, useLevel))
      return
    end
    if 2 == uis.Main.c1Ctr.selectedIndex then
      if itemType == ProtoEnum.ITEM_TYPE.CHOSEN_PACKAGE then
        BagService.UseItemReq(itemInfo.itemUid, buyNum, selectIndex, function(msg)
          GetItemTips.Show(msg.items)
          if uis then
            ItemTipsWindow.CloseWindow(true)
          end
        end)
        return
      else
        if energyNum and energyMax then
          FloatTipsUtil.ShowWarnTips(T(735))
          return
        end
        BagService.UseItemReq(itemInfo.itemUid, buyNum, nil, function(msg)
          GetItemTips.Show(msg.items)
          if uis then
            ItemTipsWindow.CloseWindow(true)
          end
        end)
        return
      end
    end
  end)
end

function ItemTipsWindow.CheckIsEnergy()
  energyNum = nil
  if itemConfig.view_item and itemConfig.view_item[1] then
    local arr = Split(itemConfig.view_item[1], ":")
    if arr[2] and arr[3] and tonumber(arr[2]) == COMMON_ITEM_ID.ENERGY then
      energyNum = tonumber(arr[3])
    end
  end
end

function ItemTipsWindow.ConvertItem()
  UIUtil.SetBtnText(uis.Main.MainModular.Popup_B_Green_Btn, T(114), T(111))
  local str = Split(itemConfig.effect_value, "|")
  local num = tonumber(str[1])
  uis.Main.MainModular.Popup_B_Green_Btn.onClick:Set(function()
    uis.Main.c1Ctr.selectedIndex = 2
    local Modular = uis.Main.NumberModular
    Modular.NameTxt.text = itemConfig.name()
    
    function Modular.WordList.itemRenderer(i, item)
      UIUtil.SetText(item, itemConfig.remark(), "WordTxt")
      UIUtil.SetText(item, itemConfig.des(), "UseTxt")
    end
    
    Modular.WordList.numItems = 1
    Modular.NumberTxt.text = T(117, ActorData.GetItemCount(itemConfig.id))
    UIUtil.SetBtnText(Modular.Popup_S_Black_Btn, T(10052), T(10053))
    Modular.Popup_S_Black_Btn.onClick:Set(function()
      uis.Main.c1Ctr.selectedIndex = 0
    end)
    UIUtil.SetBtnText(Modular.Popup_S_Green_Btn, T(302), T(303))
    Modular.Popup_S_Green_Btn.onClick:Set(function()
      buyNum = buyNum or 1
      local sendNum = math.max(buyNum * num, num)
      if sendNum <= ActorData.GetItemCount(itemInfo.itemId) then
        BagService.UseItemReq(itemInfo.itemUid, sendNum, nil, function(msg)
          local card = {}
          local item = {}
          local AddNum = function(oneItem)
            local isFind = false
            for i, v in ipairs(item) do
              if v.itemId == oneItem.itemId then
                item[i].count = item[i].count + oneItem.count
                return
              end
            end
            if false == isFind then
              table.insert(item, SimpleCopy(oneItem))
            end
          end
          for i, v in pairs(msg.items) do
            if v.item.tupleType == ProtoEnum.TUPLE_TYPE.CARD then
              table.insert(card, v)
            elseif v.item.tupleType == ProtoEnum.TUPLE_TYPE.ITEM then
              AddNum(v.item)
            end
            for _, vv in pairs(v.changeItem) do
              AddNum(vv)
            end
          end
          if #card > 0 then
            OpenWindow(WinResConfig.LotteryPaintingShowWindow.name, nil, card, function()
              if #item > 0 then
                OpenWindow(WinResConfig.GetItemTipsWindow.name, nil, item)
              end
            end, true, true)
          elseif #item > 0 then
            OpenWindow(WinResConfig.GetItemTipsWindow.name, nil, item)
          end
          if uis then
            ItemTipsWindow.CloseWindow(true)
          end
        end)
      else
        FloatTipsUtil.ShowWarnTips(T(964))
      end
    end)
  end)
  ItemTipsWindow.LoadLookBtn()
  UIUtil.SetBtnText(uis.Main.DetailsModular.Popup_B_Green_Btn, T(680), T(681))
  uis.Main.DetailsModular.Popup_B_Green_Btn.onClick:Set(function()
    isUse = false
    isLook = nil
    uis.Main.c1Ctr.selectedIndex = 0
  end)
end

local SortFun = function(a, b)
  return a.sort > b.sort
end
local SortClientGoTo = function()
  if #wayData > 1 then
    table.sort(wayData, SortFun)
  end
end

function ItemTipsWindow.GetGoToData()
  local tb = {}
  for i, v in pairs(itemConfig.go_to_id) do
    local data = TableData.GetConfig(v, "BaseClientGoTo")
    if data then
      table.insert(tb, data)
    end
  end
  ItemTipsWindow.StageIsUnlock(tb)
end

function ItemTipsWindow.StageIsUnlock(goToData)
  jumpData = goToData
  local stageIds = {}
  local tempTb = {}
  wayData = {}
  for i, v in pairs(goToData) do
    if v.go_to_stage then
      if AdventureData.GetPassedStageInfo(v.go_to_stage) then
        table.insert(wayData, v)
      else
        tempTb[v.go_to_stage] = v
        table.insert(stageIds, v.go_to_stage)
      end
    elseif v.go_to_feature and EnterClampUtil.WhetherToEnter(v.go_to_feature, false) then
      table.insert(wayData, v)
    end
  end
  if #stageIds > 0 then
    ld("Adventure", function()
      AdventureService.GetOpenStagesReq(stageIds, function(param)
        local ids = param.openStageIds
        if ids then
          for i, v in pairs(ids) do
            table.insert(wayData, tempTb[v])
          end
        end
        if 2 == itemConfig.go_to_type then
          ItemTipsWindow.ShowAllGoTo()
        else
          SortClientGoTo()
          ItemTipsWindow.ShowGoTo()
        end
      end)
    end)
  elseif 2 == itemConfig.go_to_type then
    ItemTipsWindow.ShowAllGoTo()
  else
    SortClientGoTo()
    ItemTipsWindow.ShowGoTo()
  end
end

function ItemTipsWindow.ShowAllGoTo()
  local IsUnlock = function(id)
    for i, v in pairs(wayData) do
      if v.id == id then
        return true
      end
    end
  end
  local GetDataByType = function()
    local newTb = {}
    local shopTb = {}
    for i = 1, #jumpData do
      if 0 == jumpData[i].type then
        table.insert(newTb, jumpData[i])
      elseif 1 == jumpData[i].type then
        table.insert(shopTb, jumpData[i])
      end
    end
    return newTb, shopTb
  end
  local GetJumpList = function(listData)
    if #listData > 2 then
      local newTb = {}
      local tempIndex
      for i = 1, #listData do
        if IsUnlock(listData[i].id) then
          tempIndex = i
        elseif tempIndex then
          table.insert(newTb, listData[tempIndex])
          table.insert(newTb, listData[i])
          return newTb
        end
      end
      if tempIndex then
        table.insert(newTb, listData[#listData - 1])
        table.insert(newTb, listData[#listData])
        return newTb
      else
        table.insert(newTb, listData[1])
        table.insert(newTb, listData[2])
        return newTb
      end
    else
      return listData
    end
  end
  local GetShopData = function(listData)
    if 0 == #listData then
      return nil
    end
    if #listData > 1 then
      local newTb = {}
      local tempIndex
      for i = 1, #listData do
        if IsUnlock(listData[i].id) then
          tempIndex = i
        elseif tempIndex then
          return listData[i]
        end
      end
      if tempIndex then
        return listData[#listData]
      end
    else
      return listData[1]
    end
  end
  local itemJumpData, shopJumpData = GetDataByType()
  jumpData = GetJumpList(itemJumpData)
  local shopJump = GetShopData(shopJumpData)
  if shopJump then
    table.insert(jumpData, 1, shopJump)
  end
  local proShow = {
    T(704),
    T(703),
    T(848)
  }
  
  function uis.Main.MainModular.Way.GetStripList.itemRenderer(i, item)
    UIUtil.SetText(item, jumpData[i + 1].name(), "NameTxt")
    if jumpData[i + 1].pro_show then
      ChangeUIController(item, "c1", 1)
      UIUtil.SetText(item:GetChild("ItemLabelWord"), proShow[jumpData[i + 1].pro_show], "NameTxt")
    else
      ChangeUIController(item, "c1", 0)
    end
    if jumpData[i + 1].type then
      ChangeUIController(item, "c2", jumpData[i + 1].type)
    end
    if IsUnlock(jumpData[i + 1].id) and EnterClampUtil.WhetherToEnter(jumpData[i + 1].go_to_feature, false) then
      ChangeUIController(item, "lock", 0)
    else
      local lvLock, lockLv = ItemTipsWindow.GetCanLvLock(jumpData[i + 1].go_to_stage)
      if lvLock then
        UIUtil.SetText(item:GetChild("GetStripLock"), T(954), "WordTxt")
      elseif lockLv then
        UIUtil.SetText(item:GetChild("GetStripLock"), T(1303, lockLv), "WordTxt")
      end
      ChangeUIController(item, "lock", 1)
    end
    local featureData = TableData.GetConfig(jumpData[i + 1].go_to_feature, "BaseFeature")
    if featureData and jumpData[i + 1] then
      CurrencyReturnWindow.SetJumpFun(item, featureData, jumpData[i + 1], false)
    end
  end
  
  uis.Main.MainModular.Way.GetStripList.numItems = #jumpData > 3 and 3 or #jumpData
end

function ItemTipsWindow.GetCanLvLock(go_to_stage)
  local tempStageData = TableData.GetConfig(go_to_stage, "BaseStage")
  if tempStageData and tempStageData.open_condition then
    local arr = Split(tempStageData.open_condition, "|")
    for i = 1, #arr do
      local condition = Split(arr[i], ":")
      if 2 == #condition then
        local id = tonumber(condition[1])
        if CONDITION_ENUM.LV == id then
          local lv = tonumber(condition[2])
          if lv > ActorData.GetLevel() then
            return false, lv
          end
        end
      end
    end
  end
  return true
end

function ItemTipsWindow.ShowGoTo()
  local proShow = {
    T(704),
    T(703),
    T(848)
  }
  
  function uis.Main.MainModular.Way.GetStripList.itemRenderer(i, item)
    UIUtil.SetText(item, wayData[i + 1].name(), "NameTxt")
    if wayData[i + 1].pro_show then
      ChangeUIController(item, "c1", 1)
      UIUtil.SetText(item:GetChild("ItemLabelWord"), proShow[wayData[i + 1].pro_show], "NameTxt")
    else
      ChangeUIController(item, "c1", 0)
    end
    if wayData[i + 1].type then
      ChangeUIController(item, "c2", wayData[i + 1].type)
    end
    local featureData = TableData.GetConfig(wayData[i + 1].go_to_feature, "BaseFeature")
    if featureData and wayData[i + 1] then
      CurrencyReturnWindow.SetJumpFun(item, featureData, wayData[i + 1], false)
    end
  end
  
  uis.Main.MainModular.Way.GetStripList.numItems = #wayData > 3 and 3 or #wayData
  uis.Main.MainModular.Way.c1Ctr.selectedIndex = #wayData > 0 and 0 or 1
end

function ItemTipsWindow.UpdateExpireTime()
  if itemInfo then
    local time = itemInfo.expireStamp - LoginData.GetCurServerTime()
    if time > 0 then
      itemTime = UIMgr:CreateComponent("Message", "ItemTime")
      UIUtil.SetText(itemTime, TimeUtil.FormatEnTime(time), "TimeTxt")
      uis.Main.MainModular.InfoList:AddChild(itemTime)
    end
  end
end

function ItemTipsWindow.InitBtn()
  uis.TouchScreenBtn.onClick:Set(ItemTipsWindow.CloseWindow)
end

function ItemTipsWindow.CloseWindow(close)
  local tb = {
    [2] = 0,
    [4] = 3,
    [6] = 5,
    [5] = 0,
    [1] = 0,
    [3] = 0
  }
  if 0 == uis.Main.c1Ctr.selectedIndex or close then
    UIMgr:CloseWindow(WinResConfig.ItemTipsWindow.name)
  else
    if 1 == uis.Main.c1Ctr.selectedIndex then
      if isLook or isUse then
        uis.Main.c1Ctr.selectedIndex = 0
        isLook = nil
        isUse = nil
      end
      return
    end
    if 2 == uis.Main.c1Ctr.selectedIndex and itemType == ProtoEnum.ITEM_TYPE.CHOSEN_PACKAGE then
      uis.Main.c1Ctr.selectedIndex = 1
      return
    end
    uis.Main.c1Ctr.selectedIndex = tb[uis.Main.c1Ctr.selectedIndex]
  end
end

function ItemTipsWindow.OnShown()
end

function ItemTipsWindow.OnHide()
end

function ItemTipsWindow.OnClose()
  uis = nil
  contentPane = nil
  itemInfo = nil
  itemConfig = nil
  selectIndex = nil
  isLook = nil
  isUse = nil
  wayData = nil
  energyNum = nil
  energyMax = nil
  indexMap = nil
  jumpData = nil
  itemTime = nil
  buyNum = nil
  selectItemId = nil
  itemType = nil
  haveCount = nil
  viewOnly = nil
  sureCallback = nil
end

function ItemTipsWindow.HandleMessage(msgId, para)
  if msgId == WindowMsgEnum.Common.E_MSG_SERVER_TIME_CHANGE and itemTime and itemInfo then
    local time = itemInfo.expireStamp - LoginData.GetCurServerTime()
    if time > 0 then
      UIUtil.SetText(itemTime, TimeUtil.FormatEnTime(time), "TimeTxt")
    end
  end
end

return ItemTipsWindow
