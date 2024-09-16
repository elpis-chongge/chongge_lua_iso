require("ClothesGetShow_ClothesGetShowWindowByName")
local ClothesGetShowWindow = {}
local uis, contentPane, fashionId, closeCallback, index, fullScreenClose

function ClothesGetShowWindow.ReInitData()
end

function ClothesGetShowWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.ClothesGetShowWindow.package, WinResConfig.ClothesGetShowWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetClothesGetShow_ClothesGetShowWindowUis(contentPane)
    fashionId = bridgeObj.argTable[1]
    closeCallback = bridgeObj.argTable[2]
    fullScreenClose = bridgeObj.argTable[3]
    uis.Main.BackGround.BackGroundLoader.url = UIUtil.GetBackgroundUrl(FEATURE_ENUM.CLOTHES_GET)
    index = 1
    if fashionId[index].effect then
      UIUtil.SetEffectToUI("Assets/Art/Effects/Prefab/UI_prefab/Common/FX_ui_get_skin.prefab", uis.Main.GetEffectHolder)
      LeanTween.delayedCall(0.31, function()
        ClothesGetShowWindow.UpdateInfo()
        ClothesGetShowWindow.InitBtn()
        PlayUITrans(uis.Main.root, "in1")
        SoundUtil.PlayUISfx(SOUND_EVENT_ENUM.FASHION_BUY)
      end)
    else
      ClothesGetShowWindow.UpdateInfo()
      ClothesGetShowWindow.InitBtn()
      PlayUITrans(uis.Main.root, "in1")
      SoundUtil.PlayUISfx(SOUND_EVENT_ENUM.FASHION_BUY)
    end
  end)
end

function ClothesGetShowWindow.UpdateInfo()
  local clothesData = TableData.GetConfig(fashionId[index].id, "BaseFashion")
  if clothesData then
    local cardData = TableData.GetConfig(clothesData.card_id, "BaseCard")
    if cardData then
      uis.Main.CardName.NameTxt.text = cardData.name()
      uis.Main.CardName.SubtitleTxt.text = cardData.name_english()
      ChangeController(uis.Main.CardName.c1Ctr, cardData.star - 1)
    end
    local callback
    if not fullScreenClose then
      function callback(obj)
        CS.CardSpineTouchEvent.SetEnableSpineInteraction(obj, true)
      end
    end
    UIUtil.SetCardShowSpineAutoAlpha(clothesData.id, uis.Main.CardShow.CardShowLoader, uis.Main.CardShow.CardShowHolder, nil, callback)
  end
  if fashionId[index].new == false then
    function uis.Main.TipsList.itemRenderer(i, item)
      UIUtil.SetText(item, T(1567), "NameTxt")
      
      UIUtil.SetText(item, T(1568), "WordTxt")
      item.alpha = 0
      PlayUITrans(item, "up", nil, i * 0.1)
    end
    
    uis.Main.TipsList.numItems = 1
  end
end

function ClothesGetShowWindow.CloseWindow()
  index = index + 1
  if fashionId[index] then
    uis.Main.TouchScreenBtn.touchable = false
    ClothesGetShowWindow.UpdateInfo()
    PlayUITrans(uis.Main.root, "in", function()
      uis.Main.TouchScreenBtn.touchable = true
    end)
  else
    UIMgr:CloseWindow(WinResConfig.ClothesGetShowWindow.name)
    SoundUtil.PlayUISfx(SOUND_EVENT_ENUM.POPUP_WINDOW_CLOSE)
    if closeCallback then
      closeCallback()
      closeCallback = nil
    end
  end
end

function ClothesGetShowWindow.InitBtn()
  if fullScreenClose then
    uis.Main.ReturnBtn.visible = false
    uis.Main.root.onClick:Set(ClothesGetShowWindow.CloseWindow)
  else
    uis.Main.ReturnBtn.onClick:Set(ClothesGetShowWindow.CloseWindow)
  end
end

function ClothesGetShowWindow.OnClose()
  uis = nil
  contentPane = nil
  fullScreenClose = nil
  index = nil
  fashionId = nil
end

return ClothesGetShowWindow
