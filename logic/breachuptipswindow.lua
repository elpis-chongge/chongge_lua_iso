require("Card_BreachUpTipsWindowByName")
local BreachUpTipsWindow = {}
local uis, contentPane, lv, bgPrefab

function BreachUpTipsWindow.ReInitData()
end

function BreachUpTipsWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.BreachUpTipsWindow.package, WinResConfig.BreachUpTipsWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetCard_BreachUpTipsWindowUis(contentPane)
    if bridgeObj.argTable[1] then
      lv = bridgeObj.argTable[1]
    end
    uis.Main.root.visible = false
    bgPrefab = ResourceManager.Instantiate("Assets/Art/Effects/Prefab/UI_prefab/Char_Nurtures/FX_ui_break.prefab")
    local curSceneCamera = bgPrefab:GetComponentInChildren(typeof(Camera), true)
    curSceneCamera.gameObject:GetOrAddComponent(typeof(CS.AutoAdaptScreen))
    local flygGoup = LuaUtil.FindChild(bgPrefab.transform, "Flygroup", true)
    local x = CardBreachUpWindow.GetOffsetPosX()
    LuaUtil.SetLocalPos(flygGoup.gameObject, x, flygGoup.position.y, flygGoup.position.z)
    LeanTween.value(x, -0.1571, 0.8):setOnUpdate(function(value)
      if uis and flygGoup.gameObject then
        LuaUtil.SetLocalPos(flygGoup.gameObject, value, flygGoup.position.y, flygGoup.position.z)
      end
    end):setDelay(0.2):setOnComplete(function()
      LuaUtil.SetLocalPos(flygGoup.gameObject, -0.1571, flygGoup.position.y, flygGoup.position.z)
    end)
    local breach
    for i = 1, 3 do
      breach = LuaUtil.FindChild(bgPrefab.transform, "gread_" .. i, true)
      if breach then
        breach.gameObject:SetActive(i <= lv)
      end
    end
    LeanTween.delayedCall(3.45, function()
      BreachUpTipsWindow.UpdateTextDisplay()
      BreachUpTipsWindow.ShowInfoList()
      ResourceManager.DestroyGameObject(bgPrefab)
      bgPrefab = nil
      UIMgr:SendWindowMessage(WinResConfig.CardDetailsWindow.name, WindowMsgEnum.CardWindow.OPEN_BREACH_UP)
      BreachUpTipsWindow.InitBtn()
    end)
    LeanTween.delayedCall(2, function()
      uis.Main.BackGround.BackGroundLoader.url = UIUtil.GetBackgroundUrl(FEATURE_ENUM.CARD_STAR_UP_TIPS)
      BreachUpTipsWindow.LoadCardTexture()
      UIUtil.SetEffectToUI("Assets/Art/Effects/Prefab/UI_prefab/Common/FX_ui_break_levelup_eff.prefab", uis.Main.BackGroundHolder)
      uis.Main.root.visible = true
    end)
    SoundUtil.PlayUISfx(SOUND_EVENT_ENUM.CARD_BREACH_UP)
  end)
end

function BreachUpTipsWindow.ShowInfoList()
  if uis.Main.InfoList.numItems > 0 then
    for i = 1, uis.Main.InfoList.numItems do
      uis.Main.InfoList:RemoveChildAt(0, true)
    end
  end
  local upData = CardMgr.cardQualityUpData
  if upData then
    local addValue = {}
    for i = 1, #upData.add_attr do
      local arr = Split(upData.add_attr[i], ":")
      addValue[tonumber(arr[2])] = arr[3]
    end
    local widthItem = UIMgr:CreateComponent("Card", "BreachUpSkill")
    UIUtil.SetText(widthItem, T(1143, addValue[CardAttribute.GetIdByName(ATTR_ENUM.atk)], addValue[CardAttribute.GetIdByName(ATTR_ENUM.def)], addValue[CardAttribute.GetIdByName(ATTR_ENUM.max_hp)]), "NameTxt")
    widthItem:GetChild("Ani").alpha = 0
    local time = 0.2
    local tips
    if upData.card_level_max_show and upData.card_level_max_show > 0 then
      tips = UIMgr:CreateComponent("Card", "BreachUpLevel")
      tips.width = widthItem.width
      tips:GetChild("Ani").alpha = 0
      UIUtil.SetText(tips, T(845), "WordTxt")
      UIUtil.SetText(tips, upData.card_level_max_show, "ResultTxt")
      uis.Main.InfoList:AddChild(tips)
      PlayUITrans(tips, "up", nil, time)
    end
    if upData.unlock_fashion_id and upData.unlock_fashion_id > 0 then
      tips = UIMgr:CreateComponent("Card", "BreachUpClothes")
      tips.width = widthItem.width
      tips:GetChild("Ani").alpha = 0
      UIUtil.SetText(tips, T(847), "WordTxt")
      uis.Main.InfoList:AddChild(tips)
      time = time + 0.2
      PlayUITrans(tips, "up", nil, time)
    end
    if 1 == CardMgr.cardInfoData.quality then
      local item = UIMgr:CreateComponent("Card", "BreachUpSkill1")
      UIUtil.SetText(item, T(1318), "WordTxt")
      UIUtil.SetText(item, T(1309), "ResultTxt")
      item.width = widthItem.width
      item:GetChild("Ani").alpha = 0
      uis.Main.InfoList:AddChild(item)
      time = time + 0.2
      PlayUITrans(item, "up", nil, time)
    end
    uis.Main.InfoList:AddChild(widthItem)
    time = time + 0.2
    PlayUITrans(widthItem, "up", nil, time)
    if uis.Main.InfoList.numChildren > 0 then
      tips = uis.Main.InfoList:GetChildAt(uis.Main.InfoList.numChildren - 1)
      if tips then
        local lineImage = tips:GetChild("LineImage")
        if lineImage then
          lineImage.visible = false
        end
      end
    end
  end
end

function BreachUpTipsWindow.LoadCardTexture()
  local fashionId = CardMgr.cardInfoData.fashionId
  local fashionConfig = TableData.GetConfig(fashionId, "BaseFashion")
  if fashionConfig.show_spine then
    UIUtil.SetCardShowSpineAutoAlpha(fashionId, uis.Main.CardShow.CardShowHolder, uis.Main.CardShow.CardShowHolder, true)
  elseif fashionConfig.show_texture then
    UIUtil.SetCardShowTexture(uis.Main.CardShow.CardShowLoader, fashionId)
  end
end

function BreachUpTipsWindow.UpdateTextDisplay()
  local effect = ResourceManager.Instantiate("Assets/Art/Effects/Prefab/UI_prefab/Common/FX_ui_break_level.prefab")
  UIUtil.SetObjectToUI(effect, uis.Main.EffectBreach.EffectHolder)
  LuaUtil.SetScale(effect, 1.5, 1.5, 1.5, true)
  local breachLv
  for i = 1, 3 do
    breachLv = LuaUtil.FindChild(effect.transform, "level_grp_" .. i, true)
    if breachLv then
      breachLv.gameObject:SetActive(i <= lv)
    end
  end
  local effect2 = ResourceManager.Instantiate("Assets/Art/Effects/Prefab/UI_prefab/Common/FX_ui_break_levelup.prefab")
  UIUtil.SetObjectToUI(effect2, uis.Main.EffectBreach.Effect1Holder)
end

function BreachUpTipsWindow.InitBtn()
  uis.Main.TouchScreenBtn.onClick:Set(function()
    UIMgr:CloseWindow(WinResConfig.BreachUpTipsWindow.name)
  end)
end

function BreachUpTipsWindow.OnShown()
end

function BreachUpTipsWindow.OnHide()
end

function BreachUpTipsWindow.OnClose()
  uis = nil
  contentPane = nil
  lv = nil
end

function BreachUpTipsWindow.HandleMessage(msgId, para)
end

return BreachUpTipsWindow
