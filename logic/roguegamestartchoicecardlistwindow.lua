require("RogueBuild01_StartChoiceCardListWindowByName")
local RogueGameStartChoiceCardListWindow = {}
local uis, contentPane, cardsBuffer, occupationsBuffer, selectedCards, templateSelectedCards
local CARD_MASK = -1
local recruitCallback, cost_lookup
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
local MaskCards = function()
  table.clear(cardsBuffer)
  local recruit = type(recruitCallback) == "function"
  local cardlist = RogueGameMgr.GetRecruitableCards()
  for i, v in pairs(cardlist) do
    local cardId = v.cardId
    local conf = TableData.GetConfig(cardId, "BaseCard")
    local c_type = conf.type
    local duplicate = false
    if recruit then
      duplicate = RogueGameData.GetCardInfo(cardId) ~= nil
    end
    if 0 ~= CARD_MASK & 1 << c_type and not duplicate then
      table.insert(cardsBuffer, v)
    end
  end
  table.sort(cardsBuffer, DefaultSort)
end
local RefreshCardInformationPanel = function(cardId)
  RogueGameMgr.UI_SetCardDetailsPanel(cardId, uis.Main.Info)
  if type(recruitCallback) == "function" then
    uis.Main.RecruitBtn.visible = nil ~= cardId
  end
  if cardId then
    local conf = TableData.GetConfig(cardId, "BaseCard")
    local cost = cost_lookup[conf.star]
    local cnt = ActorData.GetItemCount(cost.itemId) or 0
    local enough = cnt >= cost.count
    ChangeUIController(uis.Main.RecruitBtn, "c1", enough and 0 or 1)
    UIUtil.SetText(uis.Main.RecruitBtn:GetChild("Spend"), string.format("-%s", cost.count), "NumberTxt")
    uis.Main.RecruitBtn.visible = true
    local recruitBtnText = T(3)
    local itemConf = TableData.GetConfig(cost.itemId, "BaseItem")
    UIUtil.SetText(uis.Main.RecruitBtn, enough and recruitBtnText or T(81, itemConf.name()), "WordTxt")
  else
    uis.Main.RecruitBtn.visible = false
  end
end
local RefreshTipsText = function()
  uis.Main.ChoiceNumber.WordTxt.text = T(20476)
  local recruit = type(recruitCallback) == "function"
  uis.Main.ChoiceNumber.NumberTxt.text = T(20477, #templateSelectedCards, recruit and 1 or RogueGameData.GetInitialNumCards())
end
local CardItemRenderer = function(i, gcmp)
  local card = gcmp:GetChild("Card")
  local cardData = cardsBuffer[i + 1]
  local cardBg = card:GetChild("CardBg")
  local loader = cardBg:GetChild("PicLoader")
  local fashionId = 0 == cardData.fashionId and cardData.fashion_id or cardData.fashionId
  UIUtil.SetHeadByFaceId(fashionId, loader, HEAD_ICON_TYPE_ENUM.SQUARE)
  ChangeUIController(card, "choice", table.keyof(templateSelectedCards, cardData.cardId) and 1 or 0)
  UIUtil.ShowCardTips(cardData, card, function()
    local k = table.keyof(templateSelectedCards, cardData.cardId)
    if k then
      table.remove(templateSelectedCards, k)
      ChangeUIController(card, "choice", 0)
      RefreshCardInformationPanel(nil)
    else
      local cnt = #templateSelectedCards
      local needRemove = type(recruitCallback) == "function" and cnt >= 1 or cnt >= RogueGameData.GetInitialNumCards()
      if needRemove then
        local removed = table.remove(templateSelectedCards, 1)
        local j = table.keyof(cardsBuffer, removed, "cardId")
        if type(j) == "number" then
          local teamlist = uis.Main.TeamList
          local childIndex = teamlist:ItemIndexToChildIndex(j - 1)
          if childIndex >= 0 and childIndex < teamlist.numChildren then
            local o = teamlist:GetChildAt(childIndex):GetChild("Card")
            ChangeUIController(o, "choice", 0)
          end
        end
      end
      table.insert(templateSelectedCards, cardData.cardId)
      ChangeUIController(card, "choice", 1)
      RefreshCardInformationPanel(cardData.cardId)
      SoundUtil.PlayUISfx(SOUND_EVENT_ENUM.CARD_SELECT)
    end
    RefreshTipsText()
  end)
  local conf = TableData.GetConfig(cardData.cardId, "BaseCard")
  ChangeUIController(card, "c1", conf.star - 1)
end
local OccupationItemRenderer = function(i, gcmp)
  local item = occupationsBuffer[i + 1]
  ChangeUIController(gcmp, "c1", item.ctrlIndex)
  local occupationlist = uis.Main.Occupation.BtnList
  gcmp.onClick:Set(function()
    CARD_MASK = item.mask
    MaskCards()
    uis.Main.TeamList.numItems = #cardsBuffer
    occupationlist.selectedIndex = i
  end)
end

function RogueGameStartChoiceCardListWindow.ReInitData()
end

function RogueGameStartChoiceCardListWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.RogueGameStartChoiceCardListWindow.package, WinResConfig.RogueGameStartChoiceCardListWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetRogueBuild01_StartChoiceCardListWindowUis(contentPane)
    selectedCards = bridgeObj.argTable[1]
    recruitCallback = bridgeObj.argTable[2]
    RogueGameStartChoiceCardListWindow.UpdateInfo()
    RogueGameStartChoiceCardListWindow.InitBtn()
  end)
end

function RogueGameStartChoiceCardListWindow.UpdateInfo()
  uis.Main.BackGround.BackGroundLoader.url = UIUtil.GetResUrl(TableData.GetConfig(12018, "BaseFeature").back_ground)
  uis.Main.c1Ctr.selectedIndex = type(recruitCallback) == "function" and 0 or 1
  cardsBuffer = {}
  templateSelectedCards = {}
  if selectedCards then
    for i, v in ipairs(selectedCards) do
      table.insert(templateSelectedCards, v)
    end
  end
  uis.Main.c1Ctr.selectedIndex = type(recruitCallback) == "function" and 1 or 0
  CARD_MASK = -1
  MaskCards()
  local teamlist = uis.Main.TeamList
  teamlist:SetVirtual()
  teamlist.itemRenderer = CardItemRenderer
  teamlist.numItems = #cardsBuffer
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
  local occupationlist = uis.Main.Occupation.BtnList
  occupationlist.itemRenderer = OccupationItemRenderer
  occupationlist.numItems = #occupationsBuffer
  occupationlist.selectedIndex = 0
  RefreshCardInformationPanel()
  RefreshTipsText()
  RogueGameMgr.UI_SetAssetList(uis.Main.AssetsList)
  RogueGameMgr.UI_SetFunctionDetailsBtn(FEATURE_ENUM.ROGUE_GAME_RECRUIT_LIST, uis.Main.FunctionDetailsBtn, uis.Main.root)
  local sureBtnText = T(302)
  local sureBtnSubText = T(303)
  UIUtil.SetBtnText(uis.Main.SureBtn, sureBtnText, sureBtnSubText)
  local themeConf = TableData.GetConfig(RogueGameData.GetThemeInfo().themeId, "BaseRogueTheme")
  cost_lookup = {}
  for i, v in pairs(themeConf.card_cost) do
    local splits = Split(v, ":")
    local itemId = tonumber(splits[2])
    local count = tonumber(splits[3])
    cost_lookup[i] = {itemId = itemId, count = count}
  end
  for i = 0, teamlist.numChildren - 1 do
    local child = teamlist:GetChildAt(i)
    local card = child:GetChild("Card")
    card.alpha = 0
    PlayUITrans(child, "up", nil, i * 0.03)
    TimerUtil.setTimeout(i * 0.03, function()
      SoundUtil.PlayUISfx(SOUND_EVENT_ENUM.CARD_LIST_MOVE_TWO)
    end)
  end
end

function RogueGameStartChoiceCardListWindow.InitBtn()
  uis.Main.ReturnBtn.onClick:Set(function()
    UIMgr:CloseWindow(WinResConfig.RogueGameStartChoiceCardListWindow.name)
  end)
  uis.Main.SureBtn.onClick:Set(function()
    table.clear(selectedCards)
    for i, v in ipairs(templateSelectedCards) do
      table.insert(selectedCards, v)
    end
    UIMgr:CloseWindow(WinResConfig.RogueGameStartChoiceCardListWindow.name)
  end)
  uis.Main.RecruitBtn.onClick:Set(function()
    if type(recruitCallback) == "function" then
      recruitCallback(templateSelectedCards[1], function()
        UIMgr:CloseWindow(WinResConfig.RogueGameStartChoiceCardListWindow.name)
      end)
    end
  end)
end

function RogueGameStartChoiceCardListWindow.OnClose()
  uis = nil
  contentPane = nil
end

return RogueGameStartChoiceCardListWindow
