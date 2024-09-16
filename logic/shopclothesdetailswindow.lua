require("Shop_ClothesDetailsWindowByName")
local ShopClothesDetailsWindow = {}
local uis, contentPane, curId, fashionData, cardData, cost, jumpTb, data, productInfo, firstEnter

function ShopClothesDetailsWindow.OnInit(bridgeObj)
  curId = bridgeObj.argTable[1]
  bridgeObj:SetViewAsync(WinResConfig.ShopClothesDetailsWindow.package, WinResConfig.ShopClothesDetailsWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetShop_ClothesDetailsWindowUis(contentPane)
    uis.Main.BackGround.BackGroundLoader.url = UIUtil.GetBackgroundUrl(FEATURE_ENUM.SHOP_CLOTHES_BUY)
    ShopClothesDetailsWindow.InitBtn()
    firstEnter = true
    UIUtil.InitAssetsTips(uis.Main.AssetsTipsGroup.AssetsTipsList, {
      COMMON_ITEM_ID.RECHARGE_DIAMOND
    })
    ShopClothesDetailsWindow.InitList()
  end)
end

function ShopClothesDetailsWindow.InitList()
  data = SimpleCopy(ShopData.productInfo[ProtoEnum.PRODUCT_TYPE.PT_FASHION])
  table.sort(data, function(a, b)
    if a.owned or CardData.FashionIsContain(a.id) then
      if b.owned or CardData.FashionIsContain(b.id) then
        if a.sort == b.sort then
          return a.id < b.id
        else
          return a.sort < b.sort
        end
      else
        return false
      end
    elseif b.owned or CardData.FashionIsContain(b.id) then
      return true
    elseif a.sort == b.sort then
      return a.id < b.id
    else
      return a.sort < b.sort
    end
  end)
  table.insert(data, 1, 0)
  table.insert(data, 0)
  uis.Main.ClothesList.TipsList.scrollPane.touchEffect = false
  local lastItem
  
  function uis.Main.ClothesList.TipsList.itemRenderer(i, item)
    if data[i + 1] and 0 ~= data[i + 1] then
      local clothesData = TableData.GetConfig(data[i + 1].id, "BaseFashion")
      if clothesData then
        local tips = item:GetChild("ClothesTipsBtn")
        tips:GetChild("ClothesShowLoader").url = UIUtil.GetResUrl(clothesData.head_icon_banner)
        UIUtil.SetText(tips, T(698), "WordTxt")
        ChangeUIController(item, "c1", 1)
        ChangeUIController(tips, "c1", 1 == clothesData.is_senior and 1 or 0)
        local have = CardData.FashionIsContain(clothesData.id)
        if have then
          ChangeUIController(tips, "c2", 1)
        else
          ChangeUIController(tips, "c2", 0)
        end
        tips.onClick:Set(function()
          if lastItem then
            if lastItem == item then
              return
            end
            ChangeUIController(lastItem, "c1", 1)
            ChangeUIController(lastItem:GetChild("ClothesTipsBtn"), "c4", 0)
          end
          fashionData = clothesData
          productInfo = data[i + 1]
          cost = GetConfigItemList(fashionData.cost, true)
          if fashionData.buy_show and cost[1] then
            local itemConfig = TableData.GetConfig(cost[1].id, "BaseItem")
            if itemConfig then
              uis.Main.ClothesList.ClothesPrice.Price.PicLoader.url = UIUtil.GetResUrl(itemConfig.icon)
            end
            uis.Main.ClothesList.ClothesPrice.Price.NumberTxt.text = cost[1].value
            uis.Main.ClothesList.ClothesPrice.Price.WordTxt.text = T(1018)
          end
          ChangeUIController(item, "c1", 0)
          ChangeUIController(item:GetChild("ClothesTipsBtn"), "c4", 1)
          ChangeController(uis.Main.ClothesList.rightCtr, data[i + 2] and 0 ~= data[i + 2] and 1 or 0)
          ChangeController(uis.Main.ClothesList.leftCtr, i > 0 and data[i] and 0 ~= data[i] and 1 or 0)
          if firstEnter then
            ShopClothesDetailsWindow.ShowClothesInfo()
          else
            local trans = uis.Main.root:GetTransition("Switch")
            if trans then
              trans:SetHook("sign", function()
                ShopClothesDetailsWindow.ShowClothesInfo()
              end)
              trans:Play()
            end
          end
          lastItem = item
          uis.Main.ClothesList.TipsList.selectedIndex = i
          ShopClothesDetailsWindow.ShowAnimList(i)
          curId = clothesData.id
          if not have then
            UIUtil.SetBtnText(uis.Main.ClothesList.ClothesPrice.SureBtn, T(399), T(400))
            uis.Main.ClothesList.c1Ctr.selectedIndex = 0
            uis.Main.ClothesList.ClothesPrice.SureBtn.onClick:Set(ShopClothesDetailsWindow.BuyClothes)
          else
            local cardInfo = CardData.GetCardDataById(clothesData.card_id)
            if cardInfo then
              if cardInfo.fashionId == clothesData.id then
                uis.Main.ClothesList.c1Ctr.selectedIndex = 2
                uis.Main.ClothesList.Wearing.WordTxt.text = T(857)
              else
                uis.Main.ClothesList.c1Ctr.selectedIndex = 1
                UIUtil.SetBtnText(uis.Main.ClothesList.WearBtn, T(1040), T(1041))
                uis.Main.ClothesList.WearBtn.onClick:Set(function()
                  if clothesData.card_id then
                    CardService.ChangeCardFashionReq(clothesData.card_id, clothesData.id, function()
                      uis.Main.ClothesList.c1Ctr.selectedIndex = 2
                      uis.Main.ClothesList.Wearing.WordTxt.text = T(857)
                    end)
                  end
                end)
              end
            else
              uis.Main.ClothesList.c1Ctr.selectedIndex = 3
              uis.Main.ClothesList.NotHaveCard.WordTxt.text = T(1043)
              uis.Main.ClothesList.NotHaveCard.NameTxt.text = T(1042)
            end
          end
          if ShopData.NewIsShow(data[i + 1].id) then
            ShopData.SaveNew(data[i + 1].id)
            UIMgr:SendWindowMessage(WinResConfig.ShopWindow.name, WindowMsgEnum.ShopWindow.GET_CLOTHES)
          end
        end)
        if clothesData.id == curId then
          tips.onClick:Call()
        end
      end
      item.alpha = 1
    else
      item.onClick:Clear()
      item.alpha = 0
    end
  end
  
  uis.Main.ClothesList.TipsList.numItems = #data
  firstEnter = nil
end

function ShopClothesDetailsWindow.ShowAnimList(selectedIndex)
  local list = uis.Main.ClothesList.TipsList
  local item, index, w, tips, ctr2
  for i = 0, list.numChildren - 1 do
    item = list:GetChildAt(i)
    tips = item:GetChild("ClothesTipsBtn")
    ctr2 = tips:GetController("c2")
    if i == selectedIndex then
      ChangeUIController(tips, "c3", 0)
    else
      ChangeUIController(tips, "c3", 1 == ctr2.selectedIndex and 2 or 1)
    end
    if i == selectedIndex then
      index = 0
    elseif i < selectedIndex then
      index = selectedIndex - i
      if index > 1 then
        index = 1 or index
      end
    elseif selectedIndex < i then
      index = i - selectedIndex
      index = index > 1 and 1 or index
    end
    ChangeUIController(item, "c1", index)
    w = item.width
  end
  w = w + list.lineGap
  local targetNum = (selectedIndex - 1) * w
  LeanTween.value(list.scrollPane.posX, targetNum, 0.25):setOnUpdate(function(value)
    if uis then
      list.scrollPane.posX = value
    end
  end):setOnComplete(function()
    if uis then
      list.scrollPane.posX = targetNum
    end
  end)
end

function ShopClothesDetailsWindow.ShowClothesInfo()
  cardData = TableData.GetConfig(fashionData.card_id, "BaseCard")
  ShopClothesDetailsWindow.SetFashionName()
  UIUtil.SetCardShowSpineAutoAlpha(fashionData.id, uis.Main.CardShow.CardShowLoader, uis.Main.CardShow.CardShowHolder, true)
  ShopClothesDetailsWindow.UpdateModel()
end

function ShopClothesDetailsWindow.SetFashionName()
  local info = uis.Main.ClothesCardInfo
  if fashionData and fashionData.name then
    info.c2Ctr.selectedIndex = 1
    uis.Main.ClothesList.ClothesName.NameTxt.text = fashionData.name()
    info.ClothesNameTxt.text = fashionData.name()
  else
    info.c2Ctr.selectedIndex = 0
  end
  if cardData then
    info.c1Ctr.selectedIndex = cardData.star - 1
    info.NameTxt.text = cardData.name()
    info.SubtitleTxt.text = cardData.name_english()
  end
end

function ShopClothesDetailsWindow.UpdateModel()
  UIUtil.SetCardBattleSpine(ModelUtil.GetFullPath(fashionData.spd), uis.Main.CardQB.QBHolder, SPINE_STATE_ENUM.IDLE, true, Const.cardScale * fashionData.spd_scale / 10000, true, function(spineModel)
    SkeletonAnimationUtil.SetFlip(spineModel, false, false)
    SkeletonAnimationUtil.SetShaderEffectEnable(spineModel, false, false)
  end)
  PlayUITrans(uis.Main.CardQB.root, "up")
end

function ShopClothesDetailsWindow.InitBtn()
  jumpTb = CurrencyReturnWindow.SetCurrencyReturn(WinResConfig.ShopClothesDetailsWindow.name, uis.Main.CurrencyReturn, nil, function()
    ShopClothesDetailsWindow.CloseWindow()
  end)
end

function ShopClothesDetailsWindow.CloseWindow()
  if UIMgr:IsWindowInList(WinResConfig.ShopWindow.name) then
    UIMgr:CloseWindow(WinResConfig.ShopClothesDetailsWindow.name)
  else
    OpenWindow(WinResConfig.ShopWindow.name, nil, 4)
    UIMgr:CloseWindow(WinResConfig.ShopClothesDetailsWindow.name, true, true)
  end
end

function ShopClothesDetailsWindow.BuyClothes()
  if productInfo and productInfo.endStamp > 0 and productInfo.endStamp < LoginData.GetCurServerTime() then
    local name = fashionData and fashionData.name()
    if name then
      FloatTipsUtil.ShowWarnTips(T(1064, name))
    else
      FloatTipsUtil.ShowWarnTips(T(556))
    end
    ShopClothesDetailsWindow.CloseWindow()
    return
  end
  if cost[1] then
    local gold = ActorData.GetItemCount(cost[1].id)
    if gold >= cost[1].value then
      ShopService.FashionBuyReq(fashionData.id, function(msg)
        CardData.SaveOneFashion(msg.buyFashionId)
        OpenWindow(WinResConfig.ClothesGetShowWindow.name, nil, {
          {
            id = msg.buyFashionId,
            effect = true
          }
        }, nil, true)
        UIUtil.InitAssetsTips(uis.Main.AssetsTipsGroup.AssetsTipsList, {
          COMMON_ITEM_ID.RECHARGE_DIAMOND
        })
        ShopClothesDetailsWindow.InitList()
      end)
    else
      if cost[1].id == COMMON_ITEM_ID.RECHARGE_DIAMOND then
        OpenWindow(WinResConfig.DiamondWindow.name)
        return
      end
      local itemConfig = TableData.GetConfig(cost[1].id, "BaseItem")
      if itemConfig then
        FloatTipsUtil.ShowWarnTips(T(366, itemConfig.name()))
      end
    end
  end
end

function ShopClothesDetailsWindow.OnClose()
  uis = nil
  contentPane = nil
  curId = nil
  fashionData = nil
  cardData = nil
  cost = nil
  data = nil
  productInfo = nil
  if jumpTb then
    jumpTb.Close()
    jumpTb = nil
  end
end

return ShopClothesDetailsWindow
