CardLevelUpWindow = {}
local uis, levelUpItemID, tweener, firstOpen, tempAttribute
local lvUpItemCost = {}

function CardLevelUpWindow.Open(_uis)
  uis = _uis
  firstOpen = true
  tempAttribute = nil
  PlayUITrans(uis.root, "in")
  CardLevelUpWindow.InitData()
  UIUtil.SetHolderCenter(uis.EffectHolder)
  UIUtil.SetEffectToUI("Assets/Art/Effects/Prefab/UI_prefab/NoiseUIBack/FX_ui_charlevelup_front_eff.prefab", uis.EffectHolder)
  CardLevelUpWindow.UpdateTextDisplay()
  CardLevelUpWindow.OnInit()
  if EnterClampUtil.WhetherToEnter(10211, false) then
    CardLevelUpWindow.InitLongPressGesture()
  end
end

function CardLevelUpWindow.InitData()
  levelUpItemID = {}
  local fixedData = TableData.GetConfig(70010006, "BaseFixed")
  local arr = Split(fixedData.array_value, "|")
  for i = 1, #arr do
    levelUpItemID[i] = tonumber(arr[i])
  end
end

function CardLevelUpWindow.UpdateTextDisplay()
  UIUtil.SetBtnText(uis.LevelUp2.LevelUpBtn, T(992), T(993))
end

function CardLevelUpWindow.UpdateExpUI()
  uis.LevelUp3.LevelTxt.text = CardMgr.cardLevelUpData.level_show
  uis.LevelUp3.LevelAniTxt.text = CardMgr.cardLevelUpData.level_show
  if CardMgr.cardLevelUpData.level_show >= CardMgr.cardQualityUpData.card_level_max_show then
    if CardMgr.IsMaxLevel() then
      uis.LevelUp3.Level1Txt.text = CardMgr.cardQualityUpData.card_level_max_show
    else
      uis.LevelUp3.Level1Txt.text = T(999)
    end
  else
    uis.LevelUp3.Level1Txt.text = CardMgr.cardQualityUpData.card_level_max_show
  end
  uis.LevelUp3.LevelAniTxt.text = CardMgr.cardLevelUpData.level_show
  uis.LevelUp3.ExpProgressBar.max = CardMgr.cardQualityUpData.card_level_max_show
  uis.LevelUp3.ExpProgressBar.min = 1
  if firstOpen then
    if nil == tweener then
      uis.LevelUp3.ExpProgressBar.value = CardMgr.cardLevelUpData.level_show
    end
    firstOpen = nil
  else
    PlayUITrans(uis.LevelUp3.root, "up")
    CardLevelUpWindow.StopTween()
    tweener = LeanTween.value(uis.LevelUp3.ExpProgressBar.value, CardMgr.cardLevelUpData.level_show, 0.25):setOnUpdate(function(val)
      uis.LevelUp3.ExpProgressBar.value = val
    end):setOnComplete(function()
      tweener = nil
      uis.LevelUp3.ExpProgressBar.value = CardMgr.cardLevelUpData.level_show
    end)
  end
  local attributeTips = {
    T(880),
    T(881),
    T(882)
  }
  local attributeNun = {
    ProtoEnum.ATTR_ID.ATK,
    ProtoEnum.ATTR_ID.DEF,
    ProtoEnum.ATTR_ID.MAX_HP
  }
  local attributeIndex = {
    1,
    2,
    0
  }
  local attributeList = uis.LevelUp1.AttributeAddList
  local badgeAttribute = CardData.GetBadgeAddAttribute()
  
  function attributeList.itemRenderer(i, item)
    ChangeUIController(item, nil, attributeIndex[i + 1])
    item:GetChild("NameTxt").text = attributeTips[i + 1]
    local num = badgeAttribute[attributeNun[i + 1]] or 0
    item:GetChild("NumberTxt").text = CardMgr.cardInfoData.attributes[attributeNun[i + 1]] + num
    if tempAttribute and not firstOpen and CardMgr.cardInfoData.attributes[attributeNun[i + 1]] - tempAttribute[attributeNun[i + 1]] > 0 then
      local posCom = item:GetChild("SignImage")
      if posCom then
        local animCom = UIMgr:CreateComponent("Card", "AttributeAdd1")
        local pos = posCom:LocalToRoot(Vector2.zero, GRoot.inst.root)
        uis.root:AddChild(animCom)
        animCom:SetXY(pos.x - CardLevelUpWindow.GetScreenOffset(), pos.y)
        UIUtil.SetText(animCom, T(380, CardMgr.cardInfoData.attributes[attributeNun[i + 1]] - tempAttribute[attributeNun[i + 1]]), "Number1Txt")
        PlayUITrans(animCom, "up", function()
          animCom:Dispose()
          animCom = nil
        end)
      end
    end
  end
  
  attributeList.numItems = #attributeNun
  tempAttribute = SimpleCopy(CardMgr.cardInfoData.attributes)
end

function CardLevelUpWindow.GetScreenOffset()
  return (GRoot.inst.root.width - uis.root.width) / 2
end

function CardLevelUpWindow.StopTween()
  if tweener then
    LeanTween.cancel(tweener.uniqueId)
    tweener = nil
  end
end

function CardLevelUpWindow.OnInit()
  UIUtil.InitAssetsTips(uis.AssetsTipsList, levelUpItemID)
  CardLevelUpWindow.UpdateExpUI()
  if CardMgr.IsMaxLevel() then
    uis.LevelUp2.LevelUp4.NameTxt.text = T(997)
    uis.LevelUp2.LevelUp4.SubtitleTxt.text = T(999)
    uis.LevelUp2.c1Ctr.selectedIndex = 1
    return
  else
    if CardMgr.cardLevelUpData.level_show >= CardMgr.cardQualityUpData.card_level_max_show then
      if EnterClampUtil.WhetherToEnter(FEATURE_ENUM.CARD_STAR, false) then
        uis.LevelUp2.LevelUp4.NameTxt.text = T(1000)
        uis.LevelUp2.LevelUp4.SubtitleTxt.text = T(1001)
        uis.LevelUp2.c1Ctr.selectedIndex = 1
        uis.LevelUp2.LevelUp4.lockCtr.selectedIndex = 0
        CardData.RemoveJump(CardMgr.cardInfoData.cardId)
        uis.LevelUp2.LevelUp4.root.onClick:Set(function()
          if EnterClampUtil.WhetherToEnter(FEATURE_ENUM.CARD_STAR) and not CardMgr.StarIsMax() then
            CardData.SaveJump(CardMgr.cardInfoData.cardId)
            UIMgr:SendWindowMessage(WinResConfig.CardDetailsWindow.name, WindowMsgEnum.CardWindow.OPEN_BREACH_UP)
          end
        end)
      else
        uis.LevelUp2.LevelUp4.NameTxt.text = T(1031)
        local data = TableData.GetConfig(FEATURE_ENUM.CARD_STAR, "BaseFeature")
        if data and data.level then
          uis.LevelUp2.LevelUp4.LockTxt.text = T(1249, data.level)
          uis.LevelUp2.LevelUp4.root.onClick:Set(function()
            FloatTipsUtil.ShowWarnTips(data.unlock_des())
          end)
        end
        uis.LevelUp2.c1Ctr.selectedIndex = 1
        uis.LevelUp2.LevelUp4.lockCtr.selectedIndex = 1
      end
      return
    end
    uis.LevelUp2.c1Ctr.selectedIndex = 0
  end
  lvUpItemCost = {}
  local tipsTxt
  local itemNum = {}
  for i, v in pairs(levelUpItemID) do
    if v ~= COMMON_ITEM_ID.GAME_COIN then
      local itemInfo = ActorData.GetItemInfoById(v)
      local itemData = TableData.GetConfig(v, "BaseItem")
      if itemData and itemData.effect_value and CardMgr.cardLevelUpCostData then
        local effectValue = math.ceil((CardMgr.cardLevelUpCostData.next_exp - CardMgr.cardInfoData.exp) / tonumber(itemData.effect_value))
        itemNum[itemData.id] = effectValue
        itemNum[COMMON_ITEM_ID.GAME_COIN] = effectValue * CardMgr.cardLevelUpCostData.cost_money
        if itemInfo and effectValue <= itemInfo.count then
        else
          itemNum[itemData.id] = T(995, effectValue)
          tipsTxt = T(81, itemData.name())
        end
        if ActorData.GetItemCount(COMMON_ITEM_ID.GAME_COIN) >= itemNum[COMMON_ITEM_ID.GAME_COIN] then
          if nil == tipsTxt then
            lvUpItemCost[itemInfo.itemUid] = effectValue
          end
        else
          itemNum[COMMON_ITEM_ID.GAME_COIN] = T(995, itemNum[COMMON_ITEM_ID.GAME_COIN])
          tipsTxt = T(80)
        end
      end
    end
  end
  uis.LevelUp2.LevelUpBtn.onClick:Set(function()
    for i, v in pairs(lvUpItemCost) do
      print(i, v, ">>>>>>\229\141\135\231\186\167>>>>>>>>>>")
    end
    if CardMgr.cardLevelUpData.level_show >= CardMgr.cardQualityUpData.card_level_max_show then
      return
    end
    if table.getLen(lvUpItemCost) < 1 then
      if tipsTxt then
        FloatTipsUtil.ShowWarnTips(tipsTxt)
      end
      print("lvUpItemCost >>>>>>\230\182\136\232\128\151\228\184\186nil>>>>>>>>>>")
      return
    end
    SoundUtil.PlayUISfx(SOUND_EVENT_ENUM.CARD_LV_UP_LONG_ADD)
    CardService.LevelupCardReq(CardMgr.cardId, lvUpItemCost, function()
      CardLevelUpWindow.OnInit()
    end)
  end)
  local spend = {
    uis.LevelUp2.ItemSpend1Btn,
    uis.LevelUp2.ItemSpend2Btn
  }
  for i = 1, #levelUpItemID do
    if spend[i] then
      if itemNum[levelUpItemID[i]] then
        UIUtil.SetText(spend[i], itemNum[levelUpItemID[i]], "NumberTxt")
      end
      UIUtil.SetIconById(spend[i]:GetChild("PicLoader"), levelUpItemID[i])
      spend[i].onClick:Set(function()
        OpenWindow(WinResConfig.ItemGetTipsWindow.name, nil, {
          id = levelUpItemID[i]
        })
      end)
    end
  end
end

local tempLv, tempExp, longStop, tempCardInfo, tempShowLv, longPress

function CardLevelUpWindow.InitLongPressData()
  tempShowLv = CardMgr.cardLevelUpData.level_show
  tempLv = CardMgr.cardInfoData.level
  tempExp = CardMgr.cardInfoData.exp
  longStop = nil
  tempCardInfo = SimpleCopy(CardMgr.cardInfoData)
  lvUpItemCost = {}
end

function CardLevelUpWindow.InitLongPressGesture()
  local longSpeed, spNum, itemNum, listItem
  local gesture = CardLevelUpWindow.GetGesture(uis.LevelUp2.LevelUpBtn)
  listItem = {}
  for i = 1, #levelUpItemID do
    listItem[levelUpItemID[i]] = uis.AssetsTipsList:GetChildAt(i - 1)
  end
  local SendFun = function()
    print("longStop = true >>>>>>>SendFun>>>>>>>>>>>>>>>>>>>")
    gesture:Cancel()
    uis.LevelUp2.LevelUpBtn.onClick:Call()
  end
  gesture.onAction:Set(function()
    if longStop then
      return
    end
    SoundUtil.PlayUISfx(SOUND_EVENT_ENUM.CARD_LV_UP_LONG_ADD)
    local lvId = CardMgr.cardConfigData.grow_cost_model_id * 1000 + tempLv
    local costData = TableData.GetConfig(lvId, "BaseCardLevelUpCost")
    for i, v in pairs(levelUpItemID) do
      if v ~= COMMON_ITEM_ID.GAME_COIN then
        local itemInfo = ActorData.GetItemInfoById(v)
        local itemData = TableData.GetConfig(v, "BaseItem")
        if itemData and itemData.effect_value and costData and itemInfo then
          local num = lvUpItemCost[itemInfo.itemUid] or 0
          local effectValue = math.ceil((costData.next_exp - tempExp) / tonumber(itemData.effect_value))
          local curLvCost = effectValue * CardMgr.cardLevelUpCostData.cost_money
          if itemInfo.count < num + effectValue then
            UIUtil.SetText(uis.LevelUp2.ItemSpend2Btn, T(995, effectValue), "NumberTxt")
            if curLvCost <= ActorData.GetItemCount(COMMON_ITEM_ID.GAME_COIN) then
              UIUtil.SetText(uis.LevelUp2.ItemSpend1Btn, curLvCost, "NumberTxt")
            else
              UIUtil.SetText(uis.LevelUp2.ItemSpend1Btn, T(995, curLvCost), "NumberTxt")
            end
            FloatTipsUtil.ShowWarnTips(T(81, itemData.name()))
            longStop = true
            SendFun()
            UIUtil.SetText(listItem[itemData.id], UIUtil.GetFormatCount(itemInfo.count - num), "NumberTxt")
            if 0 == num then
              UIUtil.SetText(listItem[COMMON_ITEM_ID.GAME_COIN], UIUtil.GetFormatCount(ActorData.GetItemCount(COMMON_ITEM_ID.GAME_COIN)), "NumberTxt")
            else
              UIUtil.SetText(listItem[COMMON_ITEM_ID.GAME_COIN], UIUtil.GetFormatCount(ActorData.GetItemCount(COMMON_ITEM_ID.GAME_COIN) - curLvCost), "NumberTxt")
            end
            return
          end
          local coinCost = (num + effectValue) * CardMgr.cardLevelUpCostData.cost_money
          if coinCost <= ActorData.GetItemCount(COMMON_ITEM_ID.GAME_COIN) then
            UIUtil.SetText(uis.LevelUp2.ItemSpend2Btn, effectValue, "NumberTxt")
            UIUtil.SetText(uis.LevelUp2.ItemSpend1Btn, curLvCost, "NumberTxt")
            UIUtil.SetText(listItem[itemData.id], UIUtil.GetFormatCount(itemInfo.count - (num + effectValue)), "NumberTxt")
            UIUtil.SetText(listItem[COMMON_ITEM_ID.GAME_COIN], UIUtil.GetFormatCount(ActorData.GetItemCount(COMMON_ITEM_ID.GAME_COIN) - coinCost), "NumberTxt")
          else
            UIUtil.SetText(uis.LevelUp2.ItemSpend1Btn, T(995, curLvCost), "NumberTxt")
            UIUtil.SetText(uis.LevelUp2.ItemSpend2Btn, effectValue, "NumberTxt")
            FloatTipsUtil.ShowWarnTips(T(80))
            longStop = true
            SendFun()
            UIUtil.SetText(listItem[itemData.id], UIUtil.GetFormatCount(itemInfo.count - num), "NumberTxt")
            UIUtil.SetText(listItem[COMMON_ITEM_ID.GAME_COIN], UIUtil.GetFormatCount(ActorData.GetItemCount(COMMON_ITEM_ID.GAME_COIN) - num * CardMgr.cardLevelUpCostData.cost_money), "NumberTxt")
            return
          end
          if lvUpItemCost[itemInfo.itemUid] == nil then
            lvUpItemCost[itemInfo.itemUid] = 0
          end
          lvUpItemCost[itemInfo.itemUid] = effectValue + lvUpItemCost[itemInfo.itemUid]
        end
      end
    end
    tempLv = tempLv + 1
    tempShowLv = tempShowLv + 1
    tempExp = 0
    CardLevelUpWindow.UpdateLongPressUI(tempShowLv)
    firstOpen = true
    if tempShowLv >= CardMgr.cardQualityUpData.card_level_max_show then
      FloatTipsUtil.ShowWarnTips(T(79))
      longStop = true
      SendFun()
      return
    end
  end)
  gesture.onBegin:Set(function(data)
    print(longStop, "onBegin >>>>>>>>>>>>>>>>>>>>>>>>>>")
    Stage.inst:CancelClick(data.inputEvent.touchId)
    CardLevelUpWindow.InitLongPressData()
    itemNum = {}
    longSpeed = 1
    spNum = 1
  end)
  gesture.onEnd:Set(function()
    print("LongPressonEnd>>>>>", longStop)
    if not longStop then
      print("LongPressonEnd>>>\229\143\145\233\128\129>>")
      gesture:Cancel()
      uis.LevelUp2.LevelUpBtn.onClick:Call()
    end
    longSpeed = 1
    spNum = 1
    tempLv = nil
    tempExp = nil
    longStop = nil
    tempCardInfo = nil
    tempShowLv = nil
  end)
end

function CardLevelUpWindow.UpdateLongPressUI(tempLv)
  uis.LevelUp3.LevelTxt.text = tempLv
  uis.LevelUp3.LevelAniTxt.text = tempLv
  if tempLv >= CardMgr.cardQualityUpData.card_level_max_show then
    if CardMgr.StarIsMax() then
      uis.LevelUp3.Level1Txt.text = CardMgr.cardQualityUpData.card_level_max_show
    else
      uis.LevelUp3.Level1Txt.text = T(999)
    end
  else
    uis.LevelUp3.Level1Txt.text = CardMgr.cardQualityUpData.card_level_max_show
  end
  uis.LevelUp3.LevelAniTxt.text = tempLv
  uis.LevelUp3.ExpProgressBar.max = CardMgr.cardQualityUpData.card_level_max_show
  uis.LevelUp3.ExpProgressBar.min = 1
  CardLevelUpWindow.StopTween()
  tweener = LeanTween.value(uis.LevelUp3.ExpProgressBar.value, tempLv, 0.25):setOnUpdate(function(val)
    uis.LevelUp3.ExpProgressBar.value = val
  end):setOnComplete(function()
    tweener = nil
    uis.LevelUp3.ExpProgressBar.value = tempLv
  end)
  local attributeTips = {
    T(880),
    T(881),
    T(882)
  }
  local attributeNun = {
    ProtoEnum.ATTR_ID.ATK,
    ProtoEnum.ATTR_ID.DEF,
    ProtoEnum.ATTR_ID.MAX_HP
  }
  local attributeIndex = {
    1,
    2,
    0
  }
  local attributeList = uis.LevelUp1.AttributeAddList
  tempCardInfo.level = tempCardInfo.level + 1
  local cardAttribute = CardData.CalculatorCardAttr(tempCardInfo)
  
  function attributeList.itemRenderer(i, item)
    ChangeUIController(item, nil, attributeIndex[i + 1])
    item:GetChild("NameTxt").text = attributeTips[i + 1]
    item:GetChild("NumberTxt").text = cardAttribute[attributeNun[i + 1]]
    if tempAttribute and cardAttribute[attributeNun[i + 1]] - tempAttribute[attributeNun[i + 1]] > 0 then
      local posCom = item:GetChild("SignImage")
      if posCom then
        local animCom = UIMgr:CreateComponent("Card", "AttributeAdd1")
        local pos = posCom:LocalToRoot(Vector2.zero, GRoot.inst.root)
        uis.root:AddChild(animCom)
        animCom:SetXY(pos.x - CardLevelUpWindow.GetScreenOffset(), pos.y)
        UIUtil.SetText(animCom, T(380, cardAttribute[attributeNun[i + 1]] - tempAttribute[attributeNun[i + 1]]), "Number1Txt")
        PlayUITrans(animCom, "up", function()
          animCom:Dispose()
          animCom = nil
        end)
      end
    end
  end
  
  attributeList.numItems = #attributeNun
  tempAttribute = SimpleCopy(cardAttribute)
end

function CardLevelUpWindow.GetGesture(btn)
  local gesture = LongPressGesture.GetLongPressGesture(btn)
  gesture.trigger = 0.5
  gesture.interval = 0.125
  return gesture
end

function CardLevelUpWindow.RefreshLvUp()
  CardLevelUpWindow.OnInit()
end

function CardLevelUpWindow.HandleMessage(msgId, para)
end

function CardLevelUpWindow.QuitHide()
end

function CardLevelUpWindow.OnClose()
  uis = nil
  levelUpItemID = nil
  tempAttribute = nil
  CardLevelUpWindow.StopTween()
end

return CardLevelUpWindow
