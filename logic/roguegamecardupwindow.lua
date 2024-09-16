require("RogueBuild01_InsideCardUpWindowByName")
local RogueGameCardUpWindow = {}
local uis, contentPane, cardsBuffer, occupationsBuffer, selectedCardId, selectedAttributeId, cardFinalAttributes, CARD_MASK, revivalCallback, rewardId, changed_attribute, tweenCollect
local STRENGTHENABLE_ATTR = {
  CardAttribute.GetIdByName(ATTR_ENUM.atk),
  CardAttribute.GetIdByName(ATTR_ENUM.def),
  CardAttribute.GetIdByName(ATTR_ENUM.max_hp)
}
local DefaultSort = function(x, y)
  local a, b = x.info or x, y.info or y
  if a.level == b.level then
    local aData = CardData.GetBaseConfig(a.cardId)
    local bData = CardData.GetBaseConfig(b.cardId)
    if aData.star == bData.star then
      if a.grade == b.grade then
        if a.quality == b.quality then
          return a.cardId > b.cardId
        else
          return a.quality > b.quality
        end
      else
        return a.grade > b.grade
      end
    else
      return aData.star > bData.star
    end
  else
    return a.level > b.level
  end
end
local MaskCards = function(cardlist)
  table.clear(cardsBuffer)
  for i, v in pairs(cardlist) do
    local conf = TableData.GetConfig(v.cardId, "BaseCard")
    local c_type = conf.type
    if (type(revivalCallback) ~= "function" or not RogueGameMgr.IsLiving(v.cardId)) and 0 ~= CARD_MASK & 1 << c_type then
      table.insert(cardsBuffer, v)
    end
  end
  table.sort(cardsBuffer, DefaultSort)
end
local RefreshDetailPanel = function()
  local detailsPanel = uis.Main.Info2
  RogueGameMgr.UI_SetCardDetailsPanel(selectedCardId, detailsPanel, cardFinalAttributes)
end
local RefreshStrengthenPanel
local CalcCardFinalAttributes = function(cardId)
  if cardId then
    local rogueCardInfo = RogueGameData.GetCardInfo(cardId)
    if rogueCardInfo then
      cardFinalAttributes = CardData.CalculatorCardAttrForRogue(rogueCardInfo, RogueGameData.GetThemeInfo().talentIds, true)
    end
  end
end
local HasTween = function()
  return tweenCollect and _G.next(tweenCollect)
end
local AttributeItemRenderer = function(i, gcmp, rogueCardInfo)
  local changed = type(changed_attribute) == "number"
  local attrId = STRENGTHENABLE_ATTR[i]
  local levelMap = rogueCardInfo.attribLevels
  local level = levelMap and levelMap[attrId] or 0
  ChangeUIController(gcmp, "c1", i - 1)
  ChangeUIController(gcmp, "c2", level)
  ChangeUIController(gcmp, "choice", type(selectedAttributeId) == "number" and selectedAttributeId == attrId and 1 or 0)
  for j = 1, level - 1 do
    local prevImg = gcmp:GetChild(string.format("Lv%s", j))
    prevImg.fillAmount = 1
  end
  if level > 0 then
    local img = gcmp:GetChild(string.format("Lv%s", level))
    if changed and changed_attribute == attrId and selectedCardId == rogueCardInfo.cardId then
      img.fillAmount = 0
      tweenCollect = tweenCollect or {}
      local tweenId
      tweenId = LeanTween.value(0, 1, 0.2):setOnUpdate(function(val)
        img.fillAmount = val
      end):setOnComplete(function()
        local k = table.keyof(tweenCollect, tweenId)
        if k then
          table.remove(tweenCollect, k)
        end
        if #tweenCollect <= 0 then
          changed_attribute = nil
        end
      end).id
      table.insert(tweenCollect, tweenId)
    else
      img.fillAmount = 1
    end
  end
  local conf = TableData.GetConfig(attrId, "BaseAttribute")
  UIUtil.SetText(gcmp, conf.display_name(), "WordTxt")
  local cardConf = TableData.GetConfig(rogueCardInfo.cardId, "BaseCard")
  local info = RogueGameMgr.GetAttributeEnhanceInfo(attrId, cardConf.star, level)
  local num = info and info.add_attr and tonumber(Split(info.add_attr[1], ":")[3]) / 100 or 0
  UIUtil.SetText(gcmp, string.format("%s%%", math.floor(num)), "NumberTxt")
  gcmp.onClick:Set(function()
    if HasTween() then
      return
    end
    if type(selectedAttributeId) == "number" and selectedAttributeId == attrId then
      selectedAttributeId = nil
    else
      selectedAttributeId = attrId
    end
    RefreshStrengthenPanel()
  end)
end
local CalcEnhanceCost = function(rawVal, level)
  local themeInfo = RogueGameData.GetThemeInfo()
  local cost = themeInfo.starAttribPointAddCosts[level]
  return math.floor(rawVal + cost)
end

function RefreshStrengthenPanel()
  local strengthenPanel = uis.Main.Info1
  if selectedCardId then
    strengthenPanel.c1Ctr.selectedIndex = 0
    local rogueCardInfo = RogueGameData.GetCardInfo(selectedCardId)
    local cardInfo = rogueCardInfo.info
    local conf = TableData.GetConfig(selectedCardId, "BaseCard")
    strengthenPanel.Info1.NameTxt.text = conf.name()
    strengthenPanel.Info1.Occupation.c1Ctr.selectedIndex = conf.type - 1
    local starList = strengthenPanel.Info1.StarList
    UIUtil.ShowStarList(starList, cardInfo, conf)
    local elementList = strengthenPanel.Info1.ElementList
    UIUtil.ShowElementList(elementList, conf)
    local breach = strengthenPanel.Info1.CardBreach.root
    ChangeUIController(breach, "c1", cardInfo.quality)
    ChangeUIController(strengthenPanel.Info1.root, "c1", conf.star - 1)
    if conf.grow_model_id then
      local lvId = conf.grow_model_id * 1000 + cardInfo.level
      local lvData = TableData.GetConfig(lvId, "BaseCardLevelUp")
      strengthenPanel.Info1.LevelTxt.text = T(10062, lvData.level_show)
    end
    local basicAttributes = CardData.CalculatorCardAttrForRogue(rogueCardInfo, RogueGameData.GetThemeInfo().talentIds)
    RogueGameMgr.UI_SetCardAttributeList(strengthenPanel.Info2.AttributeList, basicAttributes, STRENGTHENABLE_ATTR, cardFinalAttributes)
    local attributeStrengthenPanel = strengthenPanel.Info3
    local attributeText = T(31)
    attributeStrengthenPanel.Title.NameTxt.text = attributeText
    for i = 1, #STRENGTHENABLE_ATTR do
      local attributeItem = attributeStrengthenPanel[string.format("Attribute%s", i)]
      AttributeItemRenderer(i, attributeItem.root, rogueCardInfo)
    end
    local strengthenText = T(20372)
    local notEnoughText = T(20373)
    local maxText = T(20374)
    local freeTipsText = T(20375)
    UIUtil.SetText(attributeStrengthenPanel.UpBtn, strengthenText, "WordTxt")
    UIUtil.SetText(attributeStrengthenPanel.NoUpBtn.root, notEnoughText, "WordTxt")
    ChangeUIController(attributeStrengthenPanel.NoUpBtn.root:GetChild("Spend"), "c1", 1)
    UIUtil.SetText(attributeStrengthenPanel.Max.root, maxText, "WordTxt")
    local map = rogueCardInfo.attribLevels
    local level = map and map[selectedAttributeId] or 0
    attributeStrengthenPanel.UpBtn.onClick:Set(function()
      if HasTween() then
        return
      end
      if selectedCardId and selectedAttributeId then
        RogueGameService.EnhanceRogueCardAttribReq(selectedCardId, selectedAttributeId, function(msg)
          UIMgr:SendWindowMessage(WinResConfig.RogueGameCardUpWindow.name, WindowMsgEnum.RogueGame.REFRESH_CARD_ATTRIBUTE, selectedAttributeId)
        end)
      end
    end)
    if selectedAttributeId then
      attributeStrengthenPanel.UpBtn.visible = true
      attributeStrengthenPanel.NoUpBtn.root.visible = true
      attributeStrengthenPanel.Max.root.visible = true
      if level >= 5 then
        attributeStrengthenPanel.c1Ctr.selectedIndex = 2
      else
        local info = RogueGameMgr.GetAttributeEnhanceInfo(selectedAttributeId, conf.star, level)
        local cost = info.cost[1]
        local splits = Split(cost, ":")
        local id, cnt = tonumber(splits[2]), tonumber(splits[3])
        local val = CalcEnhanceCost(cnt, conf.star)
        local costText = string.format("-%s", val)
        UIUtil.SetText(attributeStrengthenPanel.UpBtn:GetChild("Spend"), costText, "NumberTxt")
        UIUtil.SetText(attributeStrengthenPanel.NoUpBtn.root:GetChild("Spend"), costText, "NumberTxt")
        local freeCnt = RogueGameData.GetThemeInfo().freeEnhanceCardTimes
        if freeCnt > 0 then
          attributeStrengthenPanel.c1Ctr.selectedIndex = 0
          UIUtil.SetText(attributeStrengthenPanel.UpBtn:GetChild("Spend"), freeTipsText, "NumberTxt")
        else
          local count = ActorData.GetItemCount(id) or 0
          if val > count then
            attributeStrengthenPanel.c1Ctr.selectedIndex = 1
          else
            attributeStrengthenPanel.c1Ctr.selectedIndex = 0
          end
        end
      end
    else
      attributeStrengthenPanel.UpBtn.visible = false
      attributeStrengthenPanel.NoUpBtn.root.visible = false
      attributeStrengthenPanel.Max.root.visible = false
    end
  else
    local nonSelectCardTipsText = T(20445)
    strengthenPanel.c1Ctr.selectedIndex = 1
    strengthenPanel.Info4.WordTxt.text = nonSelectCardTipsText
  end
end

local RefreshCardInformationPanel = function()
  if type(selectedCardId) == "number" then
    CalcCardFinalAttributes(selectedCardId)
  else
    cardFinalAttributes = nil
  end
  RefreshDetailPanel()
  RefreshStrengthenPanel()
  if type(revivalCallback) == "function" then
    if selectedCardId then
      local rogueCardInfo = RogueGameData.GetCardInfo(selectedCardId)
      local info = rogueCardInfo.info
      local map = info.attributes
      local hp = CardAttribute.GetIdByName(ATTR_ENUM.hp)
      if map[hp] and 0 == map[hp] then
        uis.Main.ReviveBtn.visible = true
      else
        uis.Main.ReviveBtn.visible = false
      end
      if rewardId then
        local conf = TableData.GetConfig(rewardId, "BaseRogueNodeReward")
        local splits = Split(conf.parameter, "|")
        local cnt = RogueGameMgr.GetCurrentThemeAttrPointCount()
        local cardConf = TableData.GetConfig(info.cardId, "BaseCard")
        local cost = tonumber(splits[cardConf.star])
        UIUtil.SetText(uis.Main.ReviveBtn:GetChild("Spend"), string.format("-%s", cost), "NumberTxt")
        ChangeUIController(uis.Main.ReviveBtn, "c1", cnt >= tonumber(cost) and 0 or 1)
      end
    else
      uis.Main.ReviveBtn.visible = false
    end
  end
end
local CardItemRenderer = function(i, gcmp)
  local card = gcmp:GetChild("Card")
  local rogueCardInfo = cardsBuffer[i + 1]
  local attribLevelMap = rogueCardInfo.attribLevels
  for j = 1, 3 do
    local attrCmp = card:GetChild(string.format("Attribute%s", j))
    ChangeUIController(attrCmp, "c1", j - 1)
    local level = attribLevelMap and attribLevelMap[STRENGTHENABLE_ATTR[j]]
    ChangeUIController(attrCmp, "c2", level and level or 0)
  end
  ChangeUIController(card, "choice", type(selectedCardId) == "number" and selectedCardId == rogueCardInfo.cardId and 1 or 0)
  local hp_key = CardAttribute.GetIdByName(ATTR_ENUM.hp)
  local map = rogueCardInfo.info.attributes
  local hp = map[hp_key]
  local dead = hp and 0 == hp
  ChangeUIController(card, "c1", dead and 1 or 0)
  local hpProgressBar = card:GetChild("HpProgressBar")
  hpProgressBar.value = 0
  UIUtil.SetText(card:GetChild("DieSign"), T(20431), "WordTxt")
  local cardInfo = rogueCardInfo.info
  local cardBg = card:GetChild("CardBg")
  local loader = cardBg:GetChild("PicLoader")
  local fashionId = 0 == cardInfo.fashionId and cardInfo.fashion_id or cardInfo.fashionId
  local conf = TableData.GetConfig(rogueCardInfo.cardId, "BaseCard")
  UIUtil.SetHeadByFaceId(fashionId, loader, HEAD_ICON_TYPE_ENUM.SQUARE)
  local starList = card:GetChild("StarList")
  UIUtil.ShowStarList(starList, cardInfo, conf)
  UIUtil.SetText(card, conf.name(), "CardNameTxt")
  for j = 1, #STRENGTHENABLE_ATTR do
    AttributeItemRenderer(j, card:GetChild(string.format("Attribute%s", j)), rogueCardInfo)
  end
  card.onClick:Set(function()
    if HasTween() then
      return
    end
    local teamlist = uis.Main.TeamList
    if type(selectedCardId) == "number" and selectedCardId == rogueCardInfo.cardId then
      selectedCardId = nil
      selectedAttributeId = nil
      for j = 1, teamlist.numItems do
        local index = j - 1
        local childIndex = teamlist:ItemIndexToChildIndex(index)
        if childIndex >= 0 and childIndex < teamlist.numChildren then
          local child = teamlist:GetChildAt(childIndex)
          ChangeUIController(child:GetChild("Card"), "choice", 0)
        end
      end
    else
      selectedCardId = rogueCardInfo.cardId
      for j = 1, teamlist.numItems do
        local index = j - 1
        local childIndex = teamlist:ItemIndexToChildIndex(index)
        if childIndex >= 0 and childIndex < teamlist.numChildren then
          local child = teamlist:GetChildAt(childIndex)
          ChangeUIController(child:GetChild("Card"), "choice", index == i and 1 or 0)
        end
      end
      SoundUtil.PlayUISfx(SOUND_EVENT_ENUM.CARD_SELECT)
    end
    RefreshCardInformationPanel()
  end)
end
local OccupationItemRenderer = function(i, gcmp)
  local item = occupationsBuffer[i + 1]
  ChangeUIController(gcmp, "c1", item.ctrlIndex)
  local occupationlist = uis.Main.Occupation.BtnList
  gcmp.onClick:Set(function()
    if HasTween() then
      return
    end
    CARD_MASK = item.mask
    MaskCards(RogueGameData.GetCardInfoList())
    uis.Main.TeamList.numItems = #cardsBuffer
    occupationlist.selectedIndex = i
  end)
end

function RogueGameCardUpWindow.ReInitData()
end

function RogueGameCardUpWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.RogueGameCardUpWindow.package, WinResConfig.RogueGameCardUpWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetRogueBuild01_InsideCardUpWindowUis(contentPane)
    revivalCallback = bridgeObj.argTable[1]
    rewardId = bridgeObj.argTable[2]
    RogueGameCardUpWindow.UpdateInfo()
    RogueGameCardUpWindow.InitBtn()
  end)
end

function RogueGameCardUpWindow.UpdateInfo()
  uis.Main.BackGround.BackGroundLoader.url = UIUtil.GetResUrl(TableData.GetConfig(12018, "BaseFeature").back_ground)
  local ctrl = uis.Main.SwitchBtn:GetController("button")
  local strengthenText = T(20369)
  local detailText = T(20370)
  local reviveBtnText = T(20371)
  UIUtil.SetText(uis.Main.SwitchBtn, strengthenText, "WordTxt")
  UIUtil.SetText(uis.Main.SwitchBtn, detailText, "Word1Txt")
  local teamlist = uis.Main.TeamList
  local occupationlist = uis.Main.Occupation.BtnList
  UIUtil.SetText(uis.Main.ReviveBtn, reviveBtnText, "Word1Txt")
  ctrl.onChanged:Set(function()
    if 0 == ctrl.selectedIndex then
      uis.Main.c1Ctr.selectedIndex = 0
      CARD_MASK = occupationsBuffer[1].mask
      occupationlist.selectedIndex = 0
      local cardInfoList = RogueGameData.GetCardInfoList()
      MaskCards(cardInfoList)
      teamlist.numItems = #cardsBuffer
    else
      uis.Main.c1Ctr.selectedIndex = 1
      RefreshDetailPanel()
    end
  end)
  if type(revivalCallback) == "function" then
    uis.Main.c1Ctr.selectedIndex = 2
  else
    uis.Main.c1Ctr.selectedIndex = 0
    ctrl.selectedIndex = 0
  end
  occupationsBuffer = {
    {ctrlIndex = 0, mask = -1}
  }
  for i, v in pairs(BATTLE_UNIT_TYPE) do
    table.insert(occupationsBuffer, {
      ctrlIndex = v,
      mask = 1 << v
    })
  end
  table.sort(occupationsBuffer, function(x, y)
    return x.ctrlIndex < y.ctrlIndex
  end)
  cardsBuffer = {}
  teamlist.itemRenderer = CardItemRenderer
  teamlist:SetVirtual()
  occupationlist.itemRenderer = OccupationItemRenderer
  occupationlist.numItems = #occupationsBuffer
  CARD_MASK = occupationsBuffer[1].mask
  occupationlist.selectedIndex = 0
  local cardInfoList = RogueGameData.GetCardInfoList()
  MaskCards(cardInfoList)
  selectedCardId = cardsBuffer[1].cardId
  selectedAttributeId = STRENGTHENABLE_ATTR[1]
  teamlist.numItems = #cardsBuffer
  RefreshCardInformationPanel()
  for i = 0, teamlist.numChildren - 1 do
    local child = teamlist:GetChildAt(i)
    local card = child:GetChild("Card")
    card.alpha = 0
    PlayUITrans(child, "up", nil, i * 0.03)
    TimerUtil.setTimeout(i * 0.03, function()
      SoundUtil.PlayUISfx(SOUND_EVENT_ENUM.CARD_LIST_MOVE_TWO)
    end)
  end
  RogueGameMgr.UI_SetAssetList(uis.Main.AssetsList)
  RogueGameMgr.UI_SetFunctionDetailsBtn(FEATURE_ENUM.ROGUE_GAME_CARD_LIST, uis.Main.FunctionDetailsBtn, uis.Main.root)
end

function RogueGameCardUpWindow.InitBtn()
  uis.Main.ReturnBtn.onClick:Set(function()
    if type(revivalCallback) == "function" then
      MessageBox.Show(T(20474), {
        touchCallback = function()
          UIMgr:CloseWindow(WinResConfig.RogueGameCardUpWindow.name)
        end
      }, {})
    else
      UIMgr:CloseWindow(WinResConfig.RogueGameCardUpWindow.name)
    end
  end)
  uis.Main.ReviveBtn.onClick:Set(function()
    if type(revivalCallback) == "function" then
      revivalCallback(selectedCardId)
    end
  end)
end

function RogueGameCardUpWindow.OnClose()
  uis = nil
  contentPane = nil
  selectedCardId = nil
  selectedAttributeId = nil
  if tweenCollect then
    for _, v in pairs(tweenCollect) do
      LeanTween.cancel(v)
    end
  end
  tweenCollect = nil
  changed_attribute = nil
  cardFinalAttributes = nil
end

function RogueGameCardUpWindow.HandleMessage(msgId, para)
  if msgId == WindowMsgEnum.RogueGame.REFRESH_CARD_ATTRIBUTE then
    local cardInfoList = RogueGameData.GetCardInfoList()
    MaskCards(cardInfoList)
    local teamlist = uis.Main.TeamList
    local numCards = #cardsBuffer
    if numCards > 0 then
      if not table.keyof(cardsBuffer, selectedCardId, "cardId") then
        selectedCardId = cardsBuffer[1].cardId
      end
      changed_attribute = para
      SoundUtil.PlayUISfx("event:/sfx/sfx_ui/ui_sys/ui_yuantu_honor_lvup")
    else
      selectedCardId = nil
      selectedAttributeId = nil
    end
    teamlist.numItems = numCards
    RefreshCardInformationPanel()
  elseif msgId == WindowMsgEnum.Common.E_MSG_ITEM_CHANGE then
    uis.Main.AssetsList.numItems = 2
  elseif msgId == WindowMsgEnum.RogueGame.REFRESH_CARD_LIST then
    local cardInfoList = RogueGameData.GetCardInfoList()
    MaskCards(cardInfoList)
    local teamlist = uis.Main.TeamList
    teamlist.numItems = #cardsBuffer
  end
end

return RogueGameCardUpWindow
