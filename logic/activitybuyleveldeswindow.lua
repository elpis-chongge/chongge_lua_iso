require("ActivityDungeon1_BuyLevelDesWindowByName")
local ActivityBuyLevelDesWindow = {}
local uis, contentPane, lvData, curLv, buyNum, itemId, lvMax, waitFun, rewardData, itemSort, transPlay, firstPlay, tatalGold, passInfo

function ActivityBuyLevelDesWindow.ReInitData()
end

function ActivityBuyLevelDesWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.ActivityBuyLevelDesWindow.package, WinResConfig.ActivityBuyLevelDesWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetActivityDungeon1_BuyLevelDesWindowUis(contentPane)
    passInfo = PassportData.GetActivityPassport()
    if passInfo then
      local passportData = TableData.GetConfig(passInfo.passPortId, "BaseBattlePassport")
      if passportData then
        lvMax = passportData.level_max
      end
      transPlay = {}
      firstPlay = true
      curLv = passInfo.lv
      ActivityBuyLevelDesWindow.GetRewardLvData()
      ActivityBuyLevelDesWindow.GetLvData(passportData.grow_model_id, curLv)
      ActivityBuyLevelDesWindow.UpdateTextDisplay()
      ActivityBuyLevelDesWindow.ShowAssetsTips()
      ActivityBuyLevelDesWindow.Init()
      SoundUtil.PlayUISfx(SOUND_EVENT_ENUM.POPUP_WINDOW_SHOW)
      firstPlay = nil
      ActivityBuyLevelDesWindow.InitBtn()
    end
  end)
end

function ActivityBuyLevelDesWindow.ShowAssetsTips()
  tatalGold = ActorData.GetItemCount(COMMON_ITEM_ID.BIND_DIAMOND)
  UIUtil.InitAssetsTips(uis.Main.AssetsTipsList, {
    COMMON_ITEM_ID.BIND_DIAMOND
  })
end

function ActivityBuyLevelDesWindow.UpdateTextDisplay()
  UIUtil.SetBtnText(uis.Main.BuyLevelDes1.BuyLevelBtn, T(302), T(303))
  uis.Main.BuyLevelDes1.TitleTxt.text = T(1086)
  uis.Main.BuyLevelDes1.BuyPriceNumber.WordTxt.text = T(1088)
end

function ActivityBuyLevelDesWindow.Init()
  if lvData then
    if lvData[1] then
      UIUtil.SetPrice(lvData[1].next_cost[1], nil, uis.Main.BuyLevelDes1.BuyPriceNumber.PicLoader)
    end
    local numberStrip = uis.Main.BuyLevelDes1.NumberStrip
    local totalNum = #lvData
    local UpdateBuyNum = function()
      numberStrip.ChoiceNumberTxt.text = T(1025, buyNum, totalNum)
      uis.Main.BuyLevelDes1.WordTxt.text = T(1087, buyNum + curLv)
      local costGold = ActivityBuyLevelDesWindow.GetGold(buyNum)
      if costGold < tatalGold then
        uis.Main.BuyLevelDes1.BuyPriceNumber.NumberTxt.text = costGold
      else
        uis.Main.BuyLevelDes1.BuyPriceNumber.NumberTxt.text = T(995, costGold)
      end
      ChangeUIController(numberStrip.MaxBtn, "c1", buyNum == totalNum and 1 or 0)
      ChangeUIController(numberStrip.AddBtn, "c1", buyNum == totalNum and 1 or 0)
      ChangeUIController(numberStrip.ReduceBtn, "c1", 1 == buyNum and 1 or 0)
      ChangeUIController(numberStrip.MinBtn, "c1", 1 == buyNum and 1 or 0)
      ActivityBuyLevelDesWindow.ShowReward()
    end
    buyNum = 1
    local longSpeed = 1
    UIUtil.SetText(numberStrip.MaxBtn, T(1024))
    UIUtil.SetText(numberStrip.MinBtn, T(1023))
    numberStrip.MaxBtn.onClick:Set(function()
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
    end)
    numberStrip.ReduceBtn.onClick:Set(function()
      buyNum = math.max(buyNum - 1, 1)
      UpdateBuyNum()
    end)
    local spNum = 1
    local gesture = LongPressGesture.GetLongPressGesture(numberStrip.AddBtn)
    gesture.trigger = 0.5
    gesture.interval = 0.2
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
    local gestureReduce = LongPressGesture.GetLongPressGesture(numberStrip.ReduceBtn)
    gestureReduce.trigger = 0.5
    gestureReduce.interval = 0.2
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
end

function ActivityBuyLevelDesWindow.GetGold(lv)
  local gold = 0
  for i = 1, lv do
    if lvData[i] then
      local arr = Split(lvData[i].next_cost[1], ":")
      if 3 == #arr then
        gold = gold + tonumber(arr[3])
        if not itemId then
          itemId = tonumber(arr[2])
        end
      end
    end
  end
  return gold
end

function ActivityBuyLevelDesWindow.ShowReward()
  local data = ActivityBuyLevelDesWindow.GetRewardItem()
  local list = uis.Main.BuyLevelDes1.ItemList
  local allFrame, clickHand, loader, itemConfig
  
  function list.itemRenderer(index, item)
    local i = index + 1
    allFrame = item:GetChild("Item")
    if ProtoEnum.TUPLE_TYPE.ITEM == data[i].type then
      ChangeUIController(allFrame, "c2", 0)
      UIUtil.ShowItemFrame(data[i].id, item:GetChild("Item"):GetChild("ItemFrame"), data[i].value)
    elseif ProtoEnum.TUPLE_TYPE.T_FASHION == data[i].type then
      local cardItem = allFrame:GetChild("CardFrame")
      ChangeUIController(allFrame, "c2", 1)
      ChangeUIController(cardItem, "c2", 1)
      clickHand = cardItem:GetChild("ItemCardPic")
      loader = clickHand:GetChild("ItemLoader")
      itemConfig = TableData.GetConfig(data[i].id, "BaseFashion")
      if itemConfig then
        if itemConfig.head_icon_rect then
          loader.url = UIUtil.GetResUrl(itemConfig.head_icon_rect)
        end
        if itemConfig.card_id then
          local cardData = TableData.GetConfig(itemConfig.card_id, "BaseCard")
          if cardData then
            ChangeUIController(cardItem, "c1", cardData.star - 1)
          end
        end
      end
    end
    if transPlay[data[i].id] then
      if not firstPlay then
        PlayUITrans(item, "add")
      end
      transPlay[data[i].id] = false
    end
  end
  
  list.numItems = #data
end

function ActivityBuyLevelDesWindow.GetRewardItem()
  local reward
  local item = {}
  for i = 1, #rewardData do
    for j = curLv, buyNum + curLv do
      reward = rewardData[i][j]
      if reward then
        for k = 1, #reward do
          local addAttr = Split(reward[k], ":")
          if addAttr and #addAttr > 1 and 3 == #addAttr then
            local type = tonumber(addAttr[1])
            local id = tonumber(addAttr[2])
            local count = tonumber(addAttr[3])
            if nil == item[id] then
              item[id] = {
                type = type,
                id = id,
                value = count
              }
            else
              item[id].value = item[id].value + count
            end
          end
        end
      end
    end
  end
  itemSort = itemSort or {}
  local last = SimpleCopy(transPlay)
  transPlay = {}
  local newSortItem = {}
  for i, v in pairs(item) do
    if nil == itemSort[v.id] then
      local data = TableData.GetConfig(v.id, "BaseItem")
      itemSort[v.id] = data and data.sort or 0
    end
    transPlay[v.id] = (last[v.id] == true or nil == last[v.id]) and true or false
    table.insert(newSortItem, v)
  end
  table.sort(newSortItem, function(a, b)
    return itemSort[a.id] > itemSort[b.id]
  end)
  return newSortItem
end

function ActivityBuyLevelDesWindow.GetLvData(type, lv)
  lvData = {}
  local config = TableData.GetTable("BaseBattlePassLevel")
  for i, v in pairs(config) do
    if v.type == type and lv < v.level then
      table.insert(lvData, v)
    end
  end
end

function ActivityBuyLevelDesWindow.GetRewardLvData()
  local passPortConfig = TableData.GetConfig(passInfo.passPortId, "BaseBattlePassport")
  rewardData = {}
  if passPortConfig then
    for i = 1, #passPortConfig.pass_ids do
      if table.contain(passInfo.openList, passPortConfig.pass_ids[i]) then
        rewardData[i] = ActivityBuyLevelDesWindow.GetRewardByPhaseId(passPortConfig.pass_ids[i])
      end
    end
  end
end

function ActivityBuyLevelDesWindow.GetRewardByPhaseId(phaseId)
  local data = {}
  local config = TableData.GetTable("BaseBattlePassReward")
  for i, v in pairs(config) do
    if v.pass_id == phaseId and v.level > curLv then
      data[v.level] = v.reward
    end
  end
  return data
end

function ActivityBuyLevelDesWindow.BuyLevelRsp(msg)
  if msg.level then
    passInfo.lv = msg.level
    UIMgr:SendWindowMessage(WinResConfig.ActivityPassportWindow.name, WindowMsgEnum.Passport.BUY, msg.level)
    UIMgr:CloseWindow(WinResConfig.ActivityBuyLevelDesWindow.name)
    OpenWindow(WinResConfig.ActivityPassportLevelUpTipsWindow.name, nil, msg.level)
  end
  RedDotMgr.UpdateNode(RED_DOT_DATA_TYPE.ACTIVITY_DUNGENON)
end

function ActivityBuyLevelDesWindow.InitBtn()
  uis.Main.TouchScreenBtn.onClick:Set(function()
    UIMgr:CloseWindow(WinResConfig.ActivityBuyLevelDesWindow.name)
    SoundUtil.PlayUISfx(SOUND_EVENT_ENUM.POPUP_WINDOW_CLOSE)
  end)
  uis.Main.BuyLevelDes1.BuyLevelBtn.onClick:Set(function()
    local tGold = ActivityBuyLevelDesWindow.GetGold(buyNum)
    local gold = ActorData.GetItemCount(itemId)
    if tGold <= gold then
      PassportService.BattlePassBuyLevelReq(passInfo.passPortId, buyNum, function(msg)
        ActivityBuyLevelDesWindow.BuyLevelRsp(msg)
      end)
    else
      if itemId == COMMON_ITEM_ID.BIND_DIAMOND then
        local targetArr = GetDiamondConvertValue()
        if targetArr and targetArr.value then
          local count = tGold - ActorData.GetItemCount(itemId)
          local num = math.ceil(count / targetArr.value)
          OpenWindow(WinResConfig.OpalExchangeWindow.name, nil, num, function()
            function waitFun()
              PassportService.BattlePassBuyLevelReq(passInfo.passPortId, buyNum, function(msg)
                ActivityBuyLevelDesWindow.BuyLevelRsp(msg)
              end)
              waitFun = nil
            end
          end, 1057)
        end
        return
      end
      local itemConfig = TableData.GetConfig(itemId, "BaseItem")
      if itemConfig then
        FloatTipsUtil.ShowWarnTips(T(366, itemConfig.name()))
      end
    end
  end)
end

function ActivityBuyLevelDesWindow.HandleMessage(msgId, para)
  if msgId == WindowMsgEnum.Common.E_MSG_ITEM_CHANGE then
    ActivityBuyLevelDesWindow.ShowAssetsTips()
  end
end

function ActivityBuyLevelDesWindow.OnShown()
  if uis and waitFun then
    waitFun()
  end
end

function ActivityBuyLevelDesWindow.OnClose()
  uis = nil
  contentPane = nil
  lvData = nil
  curLv = nil
  buyNum = nil
  lvMax = nil
  rewardData = nil
  itemSort = nil
  transPlay = nil
  tatalGold = nil
  passInfo = nil
end

return ActivityBuyLevelDesWindow
