require("Clothes_ClothesDetailsWindowByName")
local ClothesDetailsWindow = {}
local uis, contentPane, curId, fashionData, cardData, jumpTb

function ClothesDetailsWindow.ReInitData()
end

function ClothesDetailsWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.ClothesDetailsWindow.package, WinResConfig.ClothesDetailsWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    curId = bridgeObj.argTable[1]
    uis = GetClothes_ClothesDetailsWindowUis(contentPane)
    uis.Main.BackGround.BackGroundLoader.url = UIUtil.GetBackgroundUrl(FEATURE_ENUM.CLOTHES_PREVIEW)
    ClothesDetailsWindow.InitBtn()
    ClothesDetailsWindow.UpdateInfo()
  end)
end

function ClothesDetailsWindow.UpdateInfo()
  fashionData = TableData.GetConfig(curId, "BaseFashion")
  cardData = TableData.GetConfig(fashionData.card_id, "BaseCard")
  ClothesDetailsWindow.SetFashionName()
  if fashionData.buy_show then
    uis.Main.PicLoader.url = UIUtil.GetResUrl(fashionData.buy_show)
  end
  if fashionData.des then
    uis.Main.WordTxtTxt.text = fashionData.des()
  end
  UIUtil.SetCardShowSpineAutoAlpha(curId, uis.Main.CardShow.CardShowLoader, uis.Main.CardShow.CardShowHolder)
  ClothesDetailsWindow.UpdateModel()
end

function ClothesDetailsWindow.SetFashionName()
  local info = uis.Main.ClothesCardInfo
  if fashionData and fashionData.name then
    info.c2Ctr.selectedIndex = 1
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

function ClothesDetailsWindow.UpdateModel()
  UIUtil.SetCardBattleSpine(ModelUtil.GetFullPath(fashionData.spd), uis.Main.CardQB.QBHolder, SPINE_STATE_ENUM.IDLE, true, Const.cardScale * fashionData.spd_scale / 10000, true, function(spineModel)
    SkeletonAnimationUtil.SetFlip(spineModel, false, false)
    SkeletonAnimationUtil.SetShaderEffectEnable(spineModel, false, false)
  end)
  PlayUITrans(uis.Main.CardQB.root, "up")
end

function ClothesDetailsWindow.InitBtn()
  jumpTb = CurrencyReturnWindow.SetCurrencyReturn(WinResConfig.ClothesDetailsWindow.name, uis.Main.CurrencyReturn)
end

function ClothesDetailsWindow.OnClose()
  uis = nil
  contentPane = nil
  curId = nil
  fashionData = nil
  cardData = nil
  if jumpTb then
    jumpTb.Close()
    jumpTb = nil
  end
end

return ClothesDetailsWindow
