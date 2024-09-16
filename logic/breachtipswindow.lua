require("Message_BreachTipsWindowByName")
local BreachTipsWindow = {}
local uis, contentPane, cardId, quality

function BreachTipsWindow.ReInitData()
end

function BreachTipsWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.BreachTipsWindow.package, WinResConfig.BreachTipsWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetMessage_BreachTipsWindowUis(contentPane)
    cardId = bridgeObj.argTable[1]
    quality = bridgeObj.argTable[2]
    BreachTipsWindow.InitBtn()
    BreachTipsWindow.Init()
  end)
end

function BreachTipsWindow.Init()
  uis.Main.BreachBtnList.selectedIndex = -1
  if nil == quality then
    local cardInfo = CardData.GetCardDataById(cardId)
    if cardInfo then
      quality = cardInfo.quality
      if quality > 2 then
        quality = 2
      end
    end
  end
  
  function uis.Main.BreachBtnList.itemRenderer(i, item)
    ChangeUIController(item:GetChild("CardBreach"), "c1", i + 1)
    item.onClick:Set(function()
      if uis.Main.BreachBtnList.selectedIndex ~= i then
        if -1 ~= uis.Main.BreachBtnList.selectedIndex then
          PlayUITrans(uis.Main.root, "up")
          LeanTween.delayedCall(0.31, function()
            if uis then
              BreachTipsWindow.ListOnClick(i + 1)
            end
          end)
        else
          BreachTipsWindow.ListOnClick(i + 1)
        end
        uis.Main.BreachBtnList.selectedIndex = i
      end
    end)
    if i == quality then
      item.onClick:Call()
    end
  end
  
  uis.Main.BreachBtnList.numItems = 3
end

function BreachTipsWindow.ListOnClick(i)
  ChangeController(uis.Main.CardBreach.c1Ctr, i)
  local numTxt = {
    T(890),
    T(891),
    T(892)
  }
  uis.Main.NumberTxt.text = numTxt[i]
  if uis.Main.InfoList.numItems > 0 then
    for i = 1, uis.Main.InfoList.numItems do
      uis.Main.InfoList:RemoveChildAt(0, true)
    end
  end
  local upData = TableData.GetConfig(cardId * 1000 + i, "BaseCardQualityUp")
  if upData then
    local tips
    if upData.card_level_max_show and upData.card_level_max_show > 0 then
      tips = UIMgr:CreateComponent("Message", "BreachLevel")
      UIUtil.SetText(tips, T(845), "WordTxt")
      UIUtil.SetText(tips, upData.card_level_max_show, "LevelTxt")
      uis.Main.InfoList:AddChild(tips)
    end
    if upData.unlock_fashion_id and upData.unlock_fashion_id > 0 then
      tips = UIMgr:CreateComponent("Message", "BreachClothes")
      UIUtil.SetText(tips, T(847), "WordTxt")
      uis.Main.InfoList:AddChild(tips)
    end
    local word = {
      [ProtoEnum.ATTR_ID.ATK] = 80000103,
      [ProtoEnum.ATTR_ID.DEF] = 80000104,
      [ProtoEnum.ATTR_ID.MAX_HP] = 80000102
    }
    local addValue = {}
    for i = 1, #upData.add_attr do
      local arr = Split(upData.add_attr[i], ":")
      addValue[tonumber(arr[2])] = arr[3]
    end
    tips = UIMgr:CreateComponent("Message", "BreachAttribute")
    UIUtil.SetText(tips, T(1101), "WordTxt")
    UIUtil.SetText(tips, T(1155), "LevelTxt")
    UIUtil.SetText(tips:GetChild("BreachSkillContent"), T(1156, addValue[CardAttribute.GetIdByName(ATTR_ENUM.atk)], addValue[CardAttribute.GetIdByName(ATTR_ENUM.def)], addValue[CardAttribute.GetIdByName(ATTR_ENUM.max_hp)]), "WordTxt")
    if 1 == i then
      local item = UIMgr:CreateComponent("Message", "BreachSkill")
      UIUtil.SetText(item, T(1318), "WordTxt")
      UIUtil.SetText(item, T(1309), "SkillTxt")
      item.width = tips.width
      uis.Main.InfoList:AddChild(item)
    end
    uis.Main.InfoList:AddChild(tips)
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

function BreachTipsWindow.InitBtn()
  uis.Main.TouchScreenBtn.onClick:Set(function()
    UIMgr:CloseWindow(WinResConfig.BreachTipsWindow.name)
  end)
end

function BreachTipsWindow.OnShown()
end

function BreachTipsWindow.OnHide()
end

function BreachTipsWindow.OnClose()
  uis = nil
  contentPane = nil
  cardId = nil
  quality = nil
end

function BreachTipsWindow.HandleMessage(msgId, para)
end

return BreachTipsWindow
