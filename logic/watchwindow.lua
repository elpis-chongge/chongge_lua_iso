require("Watch_WatchWindowByName")
local WatchWindow = {}
local contain = table.contain
local uis, contentPane, cardId, curFaceId, cardInfo, lastItem, lastFashionId, currClothesIndex, clothesData, lastId, isPlayUp, sortInverted, sortCardList, reverseCardList, jumpTb, listFashion, tempFaceId, infoFaceId

function WatchWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.WatchWindow.package, WinResConfig.WatchWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetWatch_WatchWindowUis(contentPane)
    UIUtil.SetHolderCenter(uis.Main.BackGround.BackGroundHolder)
    UIUtil.SetEffectToUI("Assets/Art/Effects/Prefab/UI_prefab/NoiseUIBack/FX_ui_Watch_1000.prefab", uis.Main.BackGround.BackGroundHolder)
    sortInverted = false
    tempFaceId = 0
    lastFashionId = 0
    WatchWindow.InitBtn()
    WatchWindow.UpdateTextDisplay()
    CardService.GetAllShowFashionReq(function()
      WatchWindow.ShowMask()
      WatchWindow.ShowFace()
      local listData = WatchWindow.SetSelectCardFirst(CardData.GetSortCardList())
      if listData then
        WatchWindow.InitList(listData)
      end
    end)
  end)
end

function WatchWindow.SetSelectCardFirst(tb)
  for i = 1, #tb do
    if cardId == tb[i].cardId then
      local tempTb = SimpleCopy(tb[i])
      table.remove(tb, i)
      table.insert(tb, 1, tempTb)
      return tb
    end
  end
  return tb
end

function WatchWindow.ShowMask()
  local effect = UIUtil.SetEffectToUI("Assets/Art/Effects/Prefab/UI_prefab/NoiseUIBack/FX_ui_watch_1000_mask.prefab", uis.Main.ClothesSet.EffectHolder)
  local mask = LuaUtil.FindChild(effect.transform, "LookGirl_background", true)
  if mask then
    LuaUtil.SetLocalPos(mask.gameObject, 1.5, 0, 0)
  end
end

function WatchWindow.ShowFace(time)
  curFaceId = ActorData.GetFaceId()
  if curFaceId ~= tempFaceId then
    cardId = TableData.GetConfig(curFaceId, "BaseFashion").card_id
    infoFaceId = curFaceId
    lastFashionId = curFaceId
    tempFaceId = curFaceId
    UIUtil.SetCardShowSpineAutoAlpha(curFaceId, uis.Main.ClothesSet.Pic.PicLoader, uis.Main.ClothesSet.Pic.PicHolder, nil == time, nil, time)
  end
end

function WatchWindow.UpdateTextDisplay()
  UIUtil.SetBtnText(uis.Main.ClothesSet.Set.ClothesBtn, T(568), T(569))
  UIUtil.SetBtnText(uis.Main.ClothesSet.Set.PositionBtn, T(570), T(571))
end

function WatchWindow.InitList(CardList)
  local HeadList = uis.Main.ClothesSet.Set.HeadList
  HeadList:SetVirtual()
  HeadList.defaultItem = UIUtil.GetResUrl("Watch:CardHead")
  isPlayUp = true
  local tempI = 0
  local data, configData
  
  function HeadList.itemRenderer(i, item)
    configData = TableData.GetConfig(CardList[i + 1].cardId, "BaseCard")
    data = TableData.GetConfig(CardList[i + 1].fashionId, "BaseFashion")
    local btn = item:GetChild("CardHeadBtn")
    UIUtil.SetText(btn, configData.name(), "CardNameTxt")
    if data then
      btn:GetChild("CardHeadPic"):GetChild("CardLoader").url = UIUtil.GetResUrl(data.head_icon_square)
    end
    btn.soundFmod = SOUND_EVENT_ENUM.CARD_SELECT
    btn.changeStateOnClick = false
    btn.onClick:Set(function()
      if lastId and lastId ~= CardList[i + 1].cardId then
        ActorService.ChangeFaceReq(CardList[i + 1].fashionId, function()
          if uis then
            WatchWindow.ShowFace(0.2)
            uis.Main.ClothesSet.Set.HeadList.numItems = uis.Main.ClothesSet.Set.HeadList.numItems
            WatchWindow.SetCardInfo()
          end
        end)
      end
    end)
    if cardId == CardList[i + 1].cardId then
      lastId = CardList[i + 1].cardId
      btn.selected = true
    else
      btn.selected = false
    end
    if isPlayUp then
      btn.alpha = 0
      PlayUITrans(item, "up", nil, tempI * 0.05)
      tempI = tempI + 1
    end
    ChangeUIController(btn, "c1", configData.star - 1)
  end
  
  HeadList.numItems = #CardList
  WatchWindow.SetCardInfo()
  isPlayUp = nil
end

function WatchWindow.GetToViewIndex(tb)
  for i = 1, #tb do
    if cardId == tb[i].cardId then
      return i - 1
    end
  end
end

function WatchWindow.GetCardListByTime(inverted)
  local cardList = ActorData.GetCardList()
  local getTime = function(ownFashionIds)
    local time
    for i, v in pairs(ownFashionIds) do
      if nil == time then
        time = v
      elseif inverted then
        if v < time then
          time = v
        end
      elseif v > time then
        time = v
      end
    end
    time = time or 0
    return time
  end
  if #cardList > 1 then
    table.sort(cardList, function(a, b)
      local at = getTime(a.ownFashionIds)
      local bt = getTime(b.ownFashionIds)
      if at == bt then
        local aData = TableData.GetConfig(a.cardId, "BaseCard")
        local bData = TableData.GetConfig(b.cardId, "BaseCard")
        if aData.star and bData.star then
          if aData.star == bData.star then
            return a.cardId > b.cardId
          else
            return aData.star > bData.star
          end
        end
      elseif inverted then
        return at < bt
      else
        return at > bt
      end
    end)
  end
  return cardList
end

function WatchWindow.SetCardInfo()
  local info = uis.Main.ClothesSet.CardInfo
  local tempData = TableData.GetConfig(cardId, "BaseCard")
  if tempData then
    info.c1Ctr.selectedIndex = tempData.star - 1
    info.NameTxt.text = tempData.name()
    info.SubtitleTxt.text = tempData.name_english()
  end
end

function WatchWindow.SetFashionName(fashionId)
  local id = fashionId or ActorData.GetFaceId()
  local info = uis.Main.ClothesSet.CardInfo
  local fashionData = TableData.GetConfig(id, "BaseFashion")
  if fashionData and fashionData.name then
    info.c2Ctr.selectedIndex = 1
    info.ClothesNameTxt.text = fashionData.name()
  else
    info.c2Ctr.selectedIndex = 0
  end
end

function WatchWindow.InitClothes()
  clothesData = {}
  lastItem = nil
  WatchWindow.ShowList()
end

function WatchWindow.GetSelectedIndex()
  local initInd = 0
  for i = 1, #listFashion do
    if 0 ~= listFashion[i] and 0 == initInd then
      initInd = i - 1
    end
    if listFashion[i] == tempFaceId then
      return i - 1
    end
  end
  return initInd
end

function WatchWindow.ShowList()
  tempFaceId = 0
  uis.Main.ClothesSet.ClothesModular.PicList.scrollPane.touchEffect = false
  cardInfo = CardData.GetCardDataById(cardId)
  local list = uis.Main.ClothesSet.ClothesModular.PicList
  listFashion = CardMgr.GetCardAllFashionId(cardId)
  for i = 1, 2 do
    table.insert(listFashion, 1, 0)
    table.insert(listFashion, 0)
  end
  list.itemRenderer = WatchWindow.PicListItemRenderer
  list.numItems = #listFashion
  if 0 == tempFaceId then
    WatchWindow.SetListSort()
  end
  uis.Main.ClothesSet.ClothesModular.c1Ctr.selectedIndex = 1
end

function WatchWindow.SetListSort()
  local selectedIndex = WatchWindow.GetSelectedIndex()
  WatchWindow.ShowAnimList(selectedIndex)
  local targetNum = (selectedIndex - 2) * 60
  LeanTween.value(uis.Main.ClothesSet.ClothesModular.PicList.scrollPane.posX, targetNum, 0.25):setOnUpdate(function(value)
    if uis then
      uis.Main.ClothesSet.ClothesModular.PicList.scrollPane.posX = value
    end
  end):setOnComplete(function()
    if uis then
      uis.Main.ClothesSet.ClothesModular.PicList.scrollPane.posX = targetNum
    end
  end)
end

function WatchWindow.ShowAnimList(selectedIndex)
  local list = uis.Main.ClothesSet.ClothesModular.PicList
  local item, index
  for i = 0, list.numChildren - 1 do
    item = list:GetChildAt(i)
    if i == selectedIndex then
      index = 0
    elseif i < selectedIndex then
      index = selectedIndex - i
      if index > 2 then
        index = 2 or index
      end
    elseif selectedIndex < i then
      index = i - selectedIndex
      index = index > 2 and 2 or index
    end
    ChangeUIController(item, "c2", index)
    ChangeUIController(item:GetChild("ClothesPic"), "c1", index)
  end
end

function WatchWindow.PicListItemRenderer(i, item)
  local ind = i + 1
  if listFashion[ind] and 0 ~= listFashion[ind] then
    item.alpha = 1
    clothesData[ind] = TableData.GetConfig(listFashion[ind], "BaseFashion")
    item:GetChild("ClothesPic"):GetChild("PicLoader").url = UIUtil.GetResUrl(clothesData[ind].head_icon_banner)
    if clothesData[ind] and clothesData[ind].name then
      UIUtil.SetText(item, clothesData[ind].name(), "NameTxt")
    else
      UIUtil.SetText(item, "", "NameTxt")
    end
    item.onClick:Set(function()
      if tempFaceId ~= listFashion[ind] then
        tempFaceId = listFashion[ind]
        currClothesIndex = i + 1
        WatchWindow.SetListSort()
        WatchWindow.ItemClick(item, clothesData[ind])
      end
    end)
    if cardInfo.ownFashionIds[listFashion[ind]] and listFashion[ind] == curFaceId then
      item.onClick:Call()
    end
    item:GetChild("LineImage").visible = #listFashion - 1 == i
  else
    item.onClick:Clear()
    item.alpha = 0
  end
end

function WatchWindow.ItemClick(item, data)
  if lastItem then
    if lastFashionId == curFaceId then
      ChangeUIController(lastItem, nil, 1)
    else
      ChangeUIController(lastItem, nil, 0)
    end
  end
  if data.id ~= lastFashionId then
    infoFaceId = data.id
    lastFashionId = data.id
    UIUtil.SetCardShowSpineAutoAlpha(data.id, uis.Main.ClothesSet.Pic.PicLoader, uis.Main.ClothesSet.Pic.PicHolder, nil, nil, 0.2)
  end
  if cardInfo.ownFashionIds[data.id] then
    if data.id == curFaceId then
      UIUtil.SetBtnText(uis.Main.ClothesSet.ClothesModular.UseBtn, T(208), T(209))
      uis.Main.ClothesSet.ClothesModular.c1Ctr.selectedIndex = 1
      ChangeUIController(item, "c1", 1)
      item:GetChild("WordTxt").text = T(857)
    else
      UIUtil.SetBtnText(uis.Main.ClothesSet.ClothesModular.UseBtn, T(858), T(859))
      uis.Main.ClothesSet.ClothesModular.c1Ctr.selectedIndex = 0
      ChangeUIController(item, "c1", 0)
    end
  else
    item:GetChild("WordTxt").text = T(84)
    ChangeUIController(item, "c1", 2)
    uis.Main.ClothesSet.ClothesModular.c1Ctr.selectedIndex = 2
  end
  if data.lock_des then
    uis.Main.ClothesSet.ClothesModular.ClothesTips.WordTxt.text = data.lock_des()
  else
    uis.Main.ClothesSet.ClothesModular.ClothesTips.WordTxt.text = T(625)
  end
  WatchWindow.SetFashionName(data.id)
  lastItem = item
end

function WatchWindow.InitBtn()
  jumpTb = CurrencyReturnWindow.SetCurrencyReturn(WinResConfig.WatchWindow.name, uis.Main.CurrencyReturn, FEATURE_ENUM.HOME_LOOK_ROLE, function()
    if 1 == uis.Main.ClothesSet.c1Ctr.selectedIndex then
      WatchWindow.ShowFace()
      uis.Main.ClothesSet.c1Ctr.selectedIndex = 0
    else
      UIMgr:CloseWindow(WinResConfig.WatchWindow.name)
    end
  end)
  uis.Main.ClothesSet.Set.SortBtn.onClick:Set(function()
    if nil == sortCardList then
      sortCardList = WatchWindow.GetCardListByTime()
      sortCardList = WatchWindow.SetSelectCardFirst(sortCardList)
      reverseCardList = table.reverseTable(sortCardList)
      reverseCardList = WatchWindow.SetSelectCardFirst(reverseCardList)
    end
    if sortInverted then
      WatchWindow.InitList(reverseCardList)
    else
      WatchWindow.InitList(sortCardList)
    end
    sortInverted = not sortInverted
  end)
  uis.Main.ClothesSet.Set.ClothesBtn.onClick:Set(function()
    uis.Main.ClothesSet.c1Ctr.selectedIndex = 1
    WatchWindow.InitClothes()
  end)
  uis.Main.ClothesSet.Set.PositionBtn.onClick:Set(function()
    UIMgr:SendWindowMessage(WinResConfig.HomeWindow.name, WindowMsgEnum.HomeWindow.SETTING_LOOK_ROLE)
    UIMgr:CloseWindow(WinResConfig.WatchWindow.name)
  end)
  uis.Main.ClothesSet.ClothesModular.UseBtn.onClick:Set(function()
    if clothesData[currClothesIndex].id and clothesData[currClothesIndex].id ~= curFaceId then
      ActorService.ChangeFaceReq(clothesData[currClothesIndex].id, function()
        if uis then
          WatchWindow.ShowFace()
          uis.Main.ClothesSet.Set.HeadList.numItems = uis.Main.ClothesSet.Set.HeadList.numItems
          WatchWindow.InitClothes()
        end
      end)
    end
  end)
  uis.Main.ClothesSet.CardInfo.root.onClick:Set(function()
    if infoFaceId then
      OpenWindow(WinResConfig.ClothesGetShowWindow.name, nil, {
        {id = infoFaceId}
      })
    end
  end)
end

function WatchWindow.OnClose()
  uis = nil
  contentPane = nil
  cardId = nil
  curFaceId = nil
  cardInfo = nil
  lastItem = nil
  lastFashionId = nil
  currClothesIndex = nil
  clothesData = nil
  lastId = nil
  isPlayUp = nil
  sortInverted = nil
  sortCardList = nil
  reverseCardList = nil
  if jumpTb then
    jumpTb.Close()
    jumpTb = nil
  end
  listFashion = nil
  tempFaceId = nil
end

return WatchWindow
