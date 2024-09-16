require("Card_CardListWindowByName")
local CardListWindow = {}
local uis, contentPane
local CARD_LAYER_TYPE = {LIST = 0, GRID = 1}
local CHOOSE_TYPE = {
  NONE = 0,
  RED = 1,
  NEW = 2,
  ALL = 3
}
local list, url, listItemUrl, gridItemUrl, cardLayerType, cardListData, sortType, choiceData
local isInitPlayAnim = true
local listSpeed, gridSpeed, speed, elementTab, occupation, btnTb, jumpTb
local timeIndex = 0
local tempRedDotId, selected, chooseType, tableSortType, cardLvListData

function CardListWindow.ReInitData()
end

function CardListWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.CardListWindow.package, WinResConfig.CardListWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetCard_CardListWindowUis(contentPane)
    tableSortType = CARD_SROT_TYPE.STRENGRTH
    cardLvListData = CardData.GetSortCardList()
    listSpeed = Const.listSpeed
    gridSpeed = Const.gridSpeed
    CardListWindow.SetChooseType()
    listItemUrl = UIUtil.GetResUrl("Card:CardTipsAniA")
    gridItemUrl = UIUtil.GetResUrl("Card:CardTipsAniB")
    uis.Main.BackGround.BackGroundLoader.url = UIUtil.GetBackgroundUrl(FEATURE_ENUM.CARD_LIST)
    sortType = WindowMsgEnum.CardScreenWindow.E_MSG_NONE
    cardLayerType = PlayerPrefsUtil.GetInt(PLAYER_PREF_ENUM.CARD_TYPE)
    uis.Main.CardTypeChoice.ArrayBtn.selected = cardLayerType == CARD_LAYER_TYPE.GRID
    uis.Main.c1Ctr:SetSelectedIndex(cardLayerType)
    selected = false
    CardListWindow.UpdateInfo()
    CardListWindow.InitBtn()
    CardListWindow.UpdateTextDisplay()
    CardListWindow.ShowRedDotCtr()
    CardListWindow.InitRedDot()
  end)
end

function CardListWindow.InitRedDot()
  RedDotMgr.AddNode({
    windowName = WinResConfig.CardListWindow.name,
    com = uis.Main.BadgeBtn,
    visibleFunc = function()
      return RedDotBadge.CanShowHome()
    end,
    dataType = RED_DOT_DATA_TYPE.BADGE
  })
end

function CardListWindow.UpdateTextDisplay()
  UIUtil.SetBtnText(uis.Main.CardScreen.GatherChoice.AllBtn, T(50), T(51))
  UIUtil.SetBtnText(uis.Main.CardTypeChoice.ScreenBtn, T(48), T(49))
  UIUtil.SetText(uis.Main.BadgeBtn, T(8), "WordTxt")
  uis.Main.CardScreen.GatherChoice.OccupationChoice.NameTxt.text = T(45)
  uis.Main.CardScreen.GatherChoice.OccupationChoice.SubtitleTxt.text = T(49)
  uis.Main.CardScreen.GatherChoice.ElementChoice.NameTxt.text = T(46)
  uis.Main.CardScreen.GatherChoice.ElementChoice.SubtitleTxt.text = T(49)
  uis.Main.CardScreen.GatherChoice.WordTxt.text = T(1012)
  uis.Main.CardScreen.GatherChoice.Number1Txt.text = T(1013)
  UIUtil.SetText(uis.Main.CardScreen.GatherChoice.StrengthBtn, T(1179), "WordTxt")
  UIUtil.SetText(uis.Main.CardScreen.GatherChoice.RarityBtn, T(1180), "WordTxt")
  uis.Main.CardScreen.GatherChoice.SkillCDChoice.SubtitleTxt.text = T(1182)
  uis.Main.CardScreen.GatherChoice.SkillCDChoice.NameTxt.text = T(1181)
end

function CardListWindow.SetChooseType()
  local red = LevelIsWithTheRange(70011114)
  local new = LevelIsWithTheRange(70011115)
  if new and red then
    chooseType = CHOOSE_TYPE.ALL
  elseif new then
    chooseType = CHOOSE_TYPE.NEW
  elseif red then
    chooseType = CHOOSE_TYPE.RED
  else
    chooseType = CHOOSE_TYPE.NONE
  end
end

function CardListWindow.UpdateInfo(listData)
  isInitPlayAnim = true
  tempRedDotId = {}
  if listData then
    cardListData = listData
  elseif sortType ~= WindowMsgEnum.CardScreenWindow.E_MSG_NONE then
    local tb, isChoice = CardData.GetChoiceListData(choiceData)
    if 0 == #tb and not isChoice then
      sortType = WindowMsgEnum.CardScreenWindow.E_MSG_NONE
      if tableSortType == CARD_SROT_TYPE.STRENGRTH then
        cardListData = CardData.GetSortCardList()
      else
        cardListData = CardData.GetSortCardListByStar()
      end
    elseif tableSortType == CARD_SROT_TYPE.STRENGRTH then
      cardListData = CardData.GetSortCardList(tb)
    else
      cardListData = CardData.GetSortCardListByStar(tb)
    end
  elseif tableSortType == CARD_SROT_TYPE.STRENGRTH then
    cardListData = CardData.GetSortCardList()
  else
    cardListData = CardData.GetSortCardListByStar()
  end
  uis.Main.CardA.CardAList.numItems = 0
  uis.Main.CardB.CardBList.numItems = 0
  if cardLayerType == CARD_LAYER_TYPE.LIST then
    list = uis.Main.CardA.CardAList
    url = listItemUrl
    speed = listSpeed
  elseif cardLayerType == CARD_LAYER_TYPE.GRID then
    list = uis.Main.CardB.CardBList
    url = gridItemUrl
    speed = gridSpeed
  end
  list:SetVirtual()
  timeIndex = 0
  tempRedDotId = {}
  list.itemRenderer = CardListWindow.RefreshCardItem
  list.defaultItem = url
  list.numItems = #cardListData
  isInitPlayAnim = nil
  PlayerPrefsUtil.SetInt(PLAYER_PREF_ENUM.CARD_TYPE, cardLayerType)
  CardData.SaveDetailsSortData(cardListData)
end

function CardListWindow.RefreshCardItem(index, item)
  local card = item:GetChild("CardTips")
  if isInitPlayAnim then
    card.alpha = 0
    PlayUITrans(item, "up", function()
      card.alpha = 1
    end, timeIndex * speed)
    TimerUtil.setTimeout(index * speed, function()
      if cardLayerType == CARD_LAYER_TYPE.LIST then
        SoundUtil.PlayUISfx(SOUND_EVENT_ENUM.CARD_LIST_MOVE)
      else
        SoundUtil.PlayUISfx(SOUND_EVENT_ENUM.CARD_LIST_MOVE_TWO)
      end
    end)
  end
  local id = cardListData[index + 1].cardId
  item.gameObjectName = id
  UIUtil.ShowCardTips(cardListData[index + 1], card, function()
    CardListWindow.ItemOnClick(id)
  end, nil, cardLayerType == CARD_LAYER_TYPE.GRID and HEAD_ICON_TYPE_ENUM.SQUARE or HEAD_ICON_TYPE_ENUM.BANNER)
  RedDotMgr.AddNode({
    windowName = WinResConfig.CardListWindow.name,
    com = card,
    visibleFunc = function()
      return RedDotCard.CannCardListGrowUp(id, cardLvListData)
    end,
    newFlagVisibleFunc = function()
      return RedDotCard.CanCardNew(id)
    end,
    dataType = RED_DOT_DATA_TYPE.CARD,
    onlyNew = true
  })
  if LevelIsWithTheRange(70011103) and CardListWindow.GetRank(index + 1) and RedDotCard.CanStarUp(id) then
    local starRedDot = card:GetChild("StarRedDot")
    UIUtil.SetText(starRedDot, T(1292), "WordTxt")
    starRedDot.visible = true
  else
    card:GetChild("StarRedDot").visible = false
  end
  timeIndex = timeIndex + 1
end

function CardListWindow.GetRank(rank)
  local config = TableData.GetConfig(70011104, "BaseFixed")
  if config and config.int_value and rank and rank <= config.int_value then
    return true
  end
end

function CardListWindow.ItemOnClick(cardId)
  local cardData = TableData.GetConfig(cardId, "BaseCard")
  if cardData then
    CardMgr.SaveEventNewReq({cardId}, {
      cardData.fashion_id
    })
  end
  CardMgr.InitCtrIndex()
  OpenWindow(WinResConfig.CardDetailsWindow.name, nil, cardId)
end

function CardListWindow.GetAllRedNum()
  local id = {}
  local cardData = ActorData.GetCardList()
  for i, v in pairs(cardData) do
    if chooseType == CHOOSE_TYPE.RED then
      if RedDotCard.CanGrowUp(v.cardId) then
        table.insert(id, v.cardId)
      end
    elseif chooseType == CHOOSE_TYPE.NEW then
      if RedDotCard.CanCardNew(v.cardId) then
        table.insert(id, v.cardId)
      end
    elseif chooseType == CHOOSE_TYPE.ALL and (RedDotCard.CanCardNew(v.cardId) or RedDotCard.CanGrowUp(v.cardId)) then
      table.insert(id, v.cardId)
    end
  end
  return id
end

function CardListWindow.ShowRedDotCtr(change)
  local ids = CardListWindow.GetAllRedNum()
  local num = #ids
  UIUtil.SetText(uis.Main.CardTypeChoice.GreenBtn, num, "NumberTxt")
  ChangeController(uis.Main.CardTypeChoice.c1Ctr, num > 0 and 1 or 0)
  local UpdateList = function()
    local newCardData = {}
    for i, v in pairs(ids) do
      table.insert(newCardData, CardData.GetCardDataById(v))
    end
    if tableSortType == CARD_SROT_TYPE.STRENGRTH then
      CardListWindow.UpdateInfo(CardData.GetSortCardList(newCardData))
    else
      CardListWindow.UpdateInfo(CardData.GetSortCardListByStar(newCardData))
    end
  end
  uis.Main.CardTypeChoice.GreenBtn.onClick:Set(function()
    if selected then
      CardListWindow.UpdateInfo()
      selected = false
    else
      selected = true
      if num > 0 then
        UpdateList()
      end
    end
  end)
  if change then
    if 0 == num then
      CardListWindow.UpdateInfo()
      selected = false
    elseif selected and num > 0 then
      UpdateList()
    end
  end
end

function CardListWindow.RefreshUI()
  list:RefreshVirtualList()
  CardListWindow.ShowRedDotCtr(true)
end

function CardListWindow.InitBtn()
  jumpTb = CurrencyReturnWindow.SetCurrencyReturn(WinResConfig.CardListWindow.name, uis.Main.CurrencyReturn, FEATURE_ENUM.CARD_LIST)
  uis.Main.CardTypeChoice.ArrayBtn.onClick:Set(function()
    CardListWindow.ChangeList(uis.Main.CardTypeChoice.ArrayBtn.selected)
  end)
  uis.Main.CardScreen.GatherChoice.AllBtn.onClick:Set(function()
    sortType = WindowMsgEnum.CardScreenWindow.E_MSG_NONE
    ChangeUIController(uis.Main.CardScreen.GatherChoice.AllBtn, "c1", 0)
    CardListWindow.InitChoiceData()
    CardListWindow.UpdateInfo()
    uis.Main.CardScreen.GatherChoice.NumberTxt.text = #cardListData
    uis.Main.CardScreen.GatherChoice.c1Ctr.selectedIndex = CardListWindow.GetIsChoice() and 1 or 0
  end)
  uis.Main.CardTypeChoice.ScreenBtn.onClick:Set(function()
    uis.Main.CardScreen.GatherChoice.NumberTxt.text = #cardListData
    uis.Main.CardScreen.GatherChoice.c1Ctr.selectedIndex = CardListWindow.GetIsChoice() and 1 or 0
    uis.Main.c2Ctr.selectedIndex = 1
    PlayUITrans(uis.Main.CardScreen.root, "in")
  end)
  uis.Main.CardScreen.PopupCloseBtn.onClick:Set(function()
    if 1 == uis.Main.c2Ctr.selectedIndex then
      PlayUITrans(uis.Main.CardScreen.root, "out", function()
        uis.Main.c2Ctr.selectedIndex = 0
      end)
    end
  end)
  uis.Main.CardTypeChoice.TeamBtn.onClick:Set(function()
    ld("Team", function()
      OpenWindow(WinResConfig.TeamWindow.name)
    end)
  end)
  uis.Main.BadgeBtn.onClick:Set(function()
    if EnterClampUtil.WhetherToEnter(FEATURE_ENUM.HOME_BADGE) then
      OpenWindow(WinResConfig.BadgeWindow.name)
    end
  end)
  CardListWindow.InitCardScreenBtn()
end

function CardListWindow.UpdateFuncUnlock()
  EnterClampUtil.UpdateEntranceState(FEATURE_ENUM.HOME_BADGE, function(isUnlock)
    ChangeUIController(uis.Main.BadgeBtn, "lock", isUnlock and 0 or 1)
  end)
end

function CardListWindow.InitChoiceData()
  choiceData = {}
  for i = 1, 2 do
    choiceData[i] = {}
    for ind = 1, 5 do
      choiceData[i][ind] = false
    end
  end
  for i, v in pairs(btnTb) do
    v.btn.selected = false
  end
  choiceData[3] = {}
end

function CardListWindow.InitCardScreenBtn()
  elementTab = uis.Main.CardScreen.GatherChoice.ElementChoice
  occupation = uis.Main.CardScreen.GatherChoice.OccupationChoice
  local cdCom = uis.Main.CardScreen.GatherChoice.SkillCDChoice
  local str = TableData.GetConfig(70010027, "BaseFixed").array_value
  local arr = Split(str, "|")
  btnTb = {
    {
      btn = elementTab.ShuiBtn,
      text = T(611),
      index = 1,
      type = 1
    },
    {
      btn = elementTab.HuoBtn,
      text = T(612),
      index = 2,
      type = 1
    },
    {
      btn = elementTab.MuBtn,
      text = T(613),
      index = 3,
      type = 1
    },
    {
      btn = elementTab.AnBtn,
      text = T(614),
      index = 4,
      type = 1
    },
    {
      btn = elementTab.GuangBtn,
      text = T(615),
      index = 5,
      type = 1
    },
    {
      btn = occupation.FangYuBtn,
      text = T(616),
      index = 1,
      type = 2
    },
    {
      btn = occupation.JinZhanBtn,
      text = T(617),
      index = 2,
      type = 2
    },
    {
      btn = occupation.FaShiBtn,
      text = T(619),
      index = 4,
      type = 2
    },
    {
      btn = occupation.GongJianBtn,
      text = T(620),
      index = 5,
      type = 2
    },
    {
      btn = cdCom.Time20Btn,
      text = T(1183, arr[1]),
      index = tonumber(arr[1]),
      type = 3
    },
    {
      btn = cdCom.Time45Btn,
      text = T(1183, arr[2]),
      index = tonumber(arr[2]),
      type = 3
    },
    {
      btn = cdCom.Time70Btn,
      text = T(1183, arr[3]),
      index = tonumber(arr[3]),
      type = 3
    }
  }
  for i, v in pairs(btnTb) do
    UIUtil.SetText(v.btn, v.text)
    v.btn.selected = false
    v.btn.onClick:Set(function()
      choiceData[v.type][v.index] = v.btn.selected
      CardListWindow.RefreshCardScreenUI()
    end)
  end
  uis.Main.CardScreen.GatherChoice.RarityBtn.onClick:Set(function()
    tableSortType = CARD_SROT_TYPE.RARITY
    CardListWindow.RefreshCardScreenUI()
  end)
  uis.Main.CardScreen.GatherChoice.StrengthBtn.onClick:Set(function()
    tableSortType = CARD_SROT_TYPE.STRENGRTH
    CardListWindow.RefreshCardScreenUI()
  end)
  CardListWindow.InitChoiceData()
end

function CardListWindow.GetIsChoice()
  for i, v in pairs(choiceData[3]) do
    if v then
      return true
    end
  end
  for i = 1, 2 do
    for ind = 1, 5 do
      if choiceData[i][ind] then
        return true
      end
    end
  end
end

function CardListWindow.RefreshCardScreenUI()
  sortType = WindowMsgEnum.CardScreenWindow.E_MSG_OCCUPATION
  CardListWindow.UpdateInfo()
  uis.Main.CardScreen.GatherChoice.NumberTxt.text = #cardListData
  uis.Main.CardScreen.GatherChoice.c1Ctr.selectedIndex = CardListWindow.GetIsChoice() and 1 or 0
end

function CardListWindow.ChangeList(bol)
  if bol then
    cardLayerType = CARD_LAYER_TYPE.GRID
    CardListWindow.UpdateInfo()
    ChangeUIController(uis.Main.root, nil, 1)
  else
    cardLayerType = CARD_LAYER_TYPE.LIST
    CardListWindow.UpdateInfo()
    ChangeUIController(uis.Main.root, nil, 0)
  end
end

function CardListWindow.ClearAllNew()
  local cardData = ActorData.GetCardList()
  local info = {}
  for i, v in pairs(cardData) do
    if RedDotCard.CanCardNew(v.cardId) then
      local config = TableData.GetConfig(v.cardId, "BaseCard")
      table.insert(info, {
        cardId = v.cardId,
        eventIds = {
          config.fashion_id
        }
      })
    end
  end
  if #info > 0 then
    CardService.ClickCardStoryEventReportReq(info, function()
      for i, v in pairs(info) do
        CardMgr.UpdateOneClickedEventId(v.cardId, v.eventIds)
      end
      RedDotMgr.UpdateNode(RED_DOT_DATA_TYPE.CARD)
    end)
  end
end

function CardListWindow.OnHide()
  CardListWindow.ClearAllNew()
end

function CardListWindow.OnClose()
  RedDotMgr.RemoveNode(WinResConfig.CardListWindow.name)
  CardData.ClearDetailsSortData()
  uis = nil
  contentPane = nil
  list.numItems = 0
  list = nil
  url = nil
  listItemUrl = nil
  gridItemUrl = nil
  sortType = nil
  choiceData = nil
  cardListData = nil
  isInitPlayAnim = nil
  speed = nil
  elementTab = nil
  occupation = nil
  btnTb = nil
  tempRedDotId = nil
  selected = nil
  cardLvListData = nil
  CardMgr.OnClose()
  if jumpTb then
    jumpTb.Close()
    jumpTb = nil
  end
end

function CardListWindow.HandleMessage(msgId, para)
  if msgId == WindowMsgEnum.COM_TYPE.INFO then
    CardListWindow.RefreshUI()
  elseif msgId == WindowMsgEnum.Common.E_MSG_GUIDE_SCROLL_TO_VIEW then
    local id = tonumber(para)
    if id and cardListData and list then
      local teamCard
      cardListData = CardData.GetSortCardList()
      for i, v in pairs(cardListData) do
        if v.cardId == id and 1 ~= i then
          teamCard = SimpleCopy(v)
          table.remove(cardListData, i)
          break
        end
      end
      if teamCard then
        table.insert(cardListData, 1, teamCard)
        list.numItems = #cardListData
      end
    end
  end
end

return CardListWindow
