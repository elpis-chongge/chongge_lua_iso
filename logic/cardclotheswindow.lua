CardClothesWindow = {}
local uis, clothesData, currClothesData, wrapper, cardShowObject, curItem, curQbName, listFashion, tempFaceId

function CardClothesWindow.Open(_uis)
  uis = _uis
  PlayUITrans(uis.root, "in")
  CardClothesWindow.UpdateTextDisplay()
  CardClothesWindow.InitBtn()
  curQbName = ""
  CardService.GetAllShowFashionReq(function()
    CardClothesWindow.OnInit()
  end)
end

function CardClothesWindow.UpdateTextDisplay()
  uis.ClothesModular.ClothesTips.WordTxt.text = T(625)
end

function CardClothesWindow.SetCardInfo()
  local info = uis.CardInfo
  local tempData = TableData.GetConfig(CardMgr.cardInfoData.cardId, "BaseCard")
  if tempData then
    info.c1Ctr.selectedIndex = tempData.star - 1
    info.NameTxt.text = tempData.name()
    info.SubtitleTxt.text = tempData.name_english()
    CardClothesWindow.SetFashionName()
  end
end

function CardClothesWindow.SetFashionName(fashionId)
  local id = fashionId or CardMgr.cardInfoData.fashionId
  local info = uis.CardInfo
  local fashionData = TableData.GetConfig(id, "BaseFashion")
  CardClothesWindow.UpdateModel(fashionData)
  if fashionData and fashionData.name then
    info.c2Ctr.selectedIndex = 1
    info.ClothesNameTxt.text = fashionData.name()
  else
    info.c2Ctr.selectedIndex = 0
  end
end

function CardClothesWindow.GetSelectedIndex()
  local len = #listFashion
  for i = 1, len do
    if listFashion[i] == tempFaceId then
      return i - 1
    end
  end
  return 0
end

function CardClothesWindow.OnInit()
  local effect = UIUtil.SetEffectToUI("Assets/Art/Effects/Prefab/UI_prefab/NoiseUIBack/FX_ui_watch_1000_mask.prefab", uis.EffectHolder)
  local mask = LuaUtil.FindChild(effect.transform, "LookGirl_background", true)
  if mask then
    LuaUtil.SetLocalPos(mask.gameObject, -2.95, 0, 0)
  end
  CardClothesWindow.SetCardInfo()
  clothesData = {}
  local list = uis.ClothesModular.PicList
  listFashion = CardMgr.GetCardAllFashionId(CardMgr.cardInfoData.cardId)
  for i = 1, 2 do
    table.insert(listFashion, 1, 0)
    table.insert(listFashion, 0)
  end
  list.itemRenderer = CardClothesWindow.PicListItemRenderer
  list.numItems = #listFashion
end

function CardClothesWindow.PicListItemRenderer(i, item)
  local ind = i + 1
  if listFashion[ind] and 0 ~= listFashion[ind] then
    item.alpha = 1
    clothesData[ind] = TableData.GetConfig(listFashion[ind], "BaseFashion")
    if CardMgr.cardInfoData.ownFashionIds[listFashion[ind]] then
      if listFashion[ind] == CardMgr.cardInfoData.fashionId then
        ChangeUIController(item, nil, 1)
      else
        ChangeUIController(item, nil, 0)
      end
    else
      item:GetChild("WordTxt").text = T(84)
      ChangeUIController(item, nil, 2)
    end
    if clothesData[ind] and clothesData[ind].name then
      UIUtil.SetText(item, clothesData[ind].name(), "NameTxt")
    else
      UIUtil.SetText(item, "", "NameTxt")
    end
    item:GetChild("ClothesPic"):GetChild("PicLoader").url = UIUtil.GetResUrl(clothesData[ind].head_icon_banner)
    item.onClick:Set(function()
      if tempFaceId ~= listFashion[ind] then
        tempFaceId = listFashion[ind]
        CardMgr.SaveEventNewReq({
          CardMgr.cardId
        }, {
          clothesData[ind].id
        })
        CardClothesWindow.ItemClick(clothesData[ind], item)
        CardClothesWindow.SetListSort()
      end
    end)
    if listFashion[ind] == CardMgr.cardInfoData.fashionId then
      item.onClick:Call()
    end
  else
    item.onClick:Clear()
    item.alpha = 0
  end
end

function CardClothesWindow.SetListSort()
  local selectedIndex = CardClothesWindow.GetSelectedIndex()
  CardClothesWindow.ShowAnimList(selectedIndex)
  local targetNum = (selectedIndex - 2) * 60
  LeanTween.value(uis.ClothesModular.PicList.scrollPane.posX, targetNum, 0.25):setOnUpdate(function(value)
    if uis then
      uis.ClothesModular.PicList.scrollPane.posX = value
    end
  end):setOnComplete(function()
    if uis then
      uis.ClothesModular.PicList.scrollPane.posX = targetNum
    end
  end)
end

function CardClothesWindow.ShowAnimList(selectedIndex)
  local list = uis.ClothesModular.PicList
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

function CardClothesWindow.ItemClick(data, item)
  currClothesData = data
  UIMgr:SendWindowMessage(WinResConfig.CardDetailsWindow.name, WindowMsgEnum.CardWindow.CLOTHES_PREVIEW, data.id)
  if CardMgr.cardInfoData.ownFashionIds[data.id] then
    if data.id == CardMgr.cardInfoData.fashionId then
      ChangeUIController(item, nil, 1)
      UIUtil.SetBtnText(uis.ClothesModular.UseBtn, T(208), T(209))
      uis.ClothesModular.c1Ctr.selectedIndex = 1
    else
      UIUtil.SetBtnText(uis.ClothesModular.UseBtn, T(214), T(213))
      ChangeUIController(item, nil, 0)
      uis.ClothesModular.c1Ctr.selectedIndex = 0
    end
    item:GetChild("WordTxt").text = T(210)
    curItem = item
  else
    ChangeUIController(item, nil, 2)
    item:GetChild("WordTxt").text = T(84)
    uis.ClothesModular.c1Ctr.selectedIndex = 2
  end
  if data.lock_des then
    uis.ClothesModular.ClothesTips.WordTxt.text = data.lock_des()
  else
    uis.ClothesModular.ClothesTips.WordTxt.text = T(625)
  end
  CardClothesWindow.SetFashionName(data.id)
end

function CardClothesWindow.UpdateModel(fashionData)
  if curQbName ~= fashionData.spd then
    UIUtil.SetCardBattleSpine(ModelUtil.GetFullPath(fashionData.spd), uis.CardQB.QBHolder, SPINE_STATE_ENUM.IDLE, true, Const.cardScale * fashionData.spd_scale / 10000, true, function(spineModel)
      SkeletonAnimationUtil.SetFlip(spineModel, false, false)
      SkeletonAnimationUtil.SetShaderEffectEnable(spineModel, false, false)
    end)
    PlayUITrans(uis.CardQB.root, "up")
    curQbName = fashionData.spd
  end
end

function CardClothesWindow.InitBtn()
  uis.ClothesModular.UseBtn.onClick:Set(function()
    if currClothesData.id == CardMgr.cardInfoData.fashionId then
      FloatTipsUtil.ShowWarnTips(T(212))
      return
    end
    if CardMgr.cardInfoData.ownFashionIds[currClothesData.id] then
      CardService.ChangeCardFashionReq(CardMgr.cardId, currClothesData.id)
    else
      FloatTipsUtil.ShowWarnTips(currClothesData.unlock_des())
    end
  end)
  uis.CardInfo.root.onClick:Set(function()
    if currClothesData and currClothesData.id then
      OpenWindow(WinResConfig.ClothesGetShowWindow.name, nil, {
        {
          id = currClothesData.id
        }
      })
    end
  end)
end

function CardClothesWindow.UpdateCardInfo()
  if curItem then
    ChangeUIController(curItem, nil, 1)
  end
  uis.ClothesModular.c1Ctr.selectedIndex = 1
end

function CardClothesWindow.OnClose()
  uis = nil
  cardShowObject = nil
  wrapper = nil
  clothesData = nil
  listFashion = nil
  tempFaceId = nil
end

return CardClothesWindow
