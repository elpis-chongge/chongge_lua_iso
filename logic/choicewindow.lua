require("PlayerInfo_ChoiceWindowByName")
local ChoiceWindow = {}
local uis, contentPane, sortType, cardListData, jumpTb, elementTab, occupation, btnTb, choiceData, choiceCards

function ChoiceWindow.ReInitData()
end

function ChoiceWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.ChoiceWindow.package, WinResConfig.ChoiceWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    choiceCards = bridgeObj.argTable[1] or {}
    uis = GetPlayerInfo_ChoiceWindowUis(contentPane)
    uis.Main.BackGround.BackGroundLoader.url = UIUtil.GetBackgroundUrl(FEATURE_ENUM.CARD_LIST)
    sortType = WindowMsgEnum.CardScreenWindow.E_MSG_NONE
    ChoiceWindow.UpdateInfo()
    ChoiceWindow.InitBtn()
  end)
end

function ChoiceWindow.GetCardDate()
  local cardList = ActorData.GetCardList()
  table.sort(cardList, function(a, b)
    local aIndex = ChoiceWindow.GetNumIndex(a.cardId)
    local bIndex = ChoiceWindow.GetNumIndex(b.cardId)
    if aIndex and bIndex then
      return aIndex < bIndex
    elseif aIndex and not bIndex then
      return true
    elseif not aIndex and bIndex then
      return false
    else
      return CardData.DefaultSort(a, b)
    end
  end)
  local t = {}
  for i, v in pairs(cardList) do
    table.insert(t, v)
  end
  return t
end

function ChoiceWindow.UpdateInfo()
  if sortType ~= WindowMsgEnum.CardScreenWindow.E_MSG_NONE then
    local tb, isChoice = CardData.GetChoiceListData(choiceData)
    if 0 == #tb and not isChoice then
      sortType = WindowMsgEnum.CardScreenWindow.E_MSG_NONE
      cardListData = ChoiceWindow.GetCardDate()
    else
      cardListData = tb
    end
  else
    cardListData = ChoiceWindow.GetCardDate()
  end
  uis.Main.ChoiceList.numItems = 0
  uis.Main.ChoiceList:SetVirtual()
  uis.Main.ChoiceList.itemRenderer = ChoiceWindow.RefreshCardItem
  uis.Main.ChoiceList.numItems = #cardListData
end

function ChoiceWindow.GetNumIndex(id)
  for i, v in pairs(choiceCards) do
    if v == id then
      return i
    end
  end
end

function ChoiceWindow.GetKey()
  for i = 1, 3 do
    if nil == choiceCards[i] then
      return i
    end
  end
end

function ChoiceWindow.RefreshCardItem(index, item)
  local card = item:GetChild("CardTips")
  local id = cardListData[index + 1].cardId
  local n = ChoiceWindow.GetNumIndex(id)
  item.soundFmod = SOUND_EVENT_ENUM.CARD_SELECT
  if n then
    UIUtil.SetText(item, LuaUtil.FormatNum(n, "00"), "NumberTxt")
    ChangeUIController(item, "button", 1)
  else
    UIUtil.SetText(item, "", "NumberTxt")
    ChangeUIController(item, "button", 0)
  end
  UIUtil.ShowCardTips(cardListData[index + 1], card, function()
    local k = ChoiceWindow.GetNumIndex(id)
    if k then
      ChangeUIController(item, "button", 0)
      table.remove(choiceCards, k)
      UIUtil.SetText(item, "", "NumberTxt")
      uis.Main.ChoiceList:RefreshVirtualList()
    else
      if table.getLen(choiceCards) >= 3 then
        FloatTipsUtil.ShowWarnTips(T(907))
        return
      end
      table.insert(choiceCards, id)
      ChangeUIController(item, "button", 1)
      UIUtil.SetText(item, LuaUtil.FormatNum(#choiceCards, "00"), "NumberTxt")
    end
    ActorService.SetProfileDisplayCardsReq(choiceCards)
  end, nil, HEAD_ICON_TYPE_ENUM.SQUARE)
end

function ChoiceWindow.ShowDefaultCard()
  sortType = WindowMsgEnum.CardScreenWindow.E_MSG_NONE
  ChangeUIController(uis.Main.CardTypeChoice.AllBtn, "c1", 0)
  ChoiceWindow.InitChoiceData()
  ChoiceWindow.UpdateInfo()
end

function ChoiceWindow.InitBtn()
  jumpTb = CurrencyReturnWindow.SetCurrencyReturn(WinResConfig.ChoiceWindow.name, uis.Main.CurrencyReturn)
  uis.Main.CardTypeChoice.AllBtn.onClick:Set(ChoiceWindow.ShowDefaultCard)
  UIUtil.SetBtnText(uis.Main.CardTypeChoice.ScreenBtn, T(48), T(49))
  uis.Main.CardScreen.GatherChoice.OccupationChoice.NameTxt.text = T(45)
  uis.Main.CardScreen.GatherChoice.OccupationChoice.SubtitleTxt.text = T(49)
  uis.Main.CardScreen.GatherChoice.ElementChoice.NameTxt.text = T(46)
  uis.Main.CardScreen.GatherChoice.ElementChoice.SubtitleTxt.text = T(49)
  uis.Main.CardTypeChoice.ScreenBtn.onClick:Set(function()
    PlayUITrans(uis.Main.CardScreen.root, "in")
    uis.Main.c1Ctr.selectedIndex = 1
  end)
  uis.Main.CardScreen.PopupCloseBtn.onClick:Set(function()
    if 1 == uis.Main.c1Ctr.selectedIndex then
      PlayUITrans(uis.Main.CardScreen.root, "out", function()
        uis.Main.c1Ctr.selectedIndex = 0
      end)
    end
  end)
  ChoiceWindow.InitCardScreenBtn()
end

function ChoiceWindow.RefreshCardScreenUI()
  sortType = WindowMsgEnum.CardScreenWindow.E_MSG_OCCUPATION
  ChoiceWindow.UpdateInfo()
  if ChoiceWindow.GetIsChoice() then
    ChangeUIController(uis.Main.CardTypeChoice.AllBtn, "c1", 1)
  else
    ChangeUIController(uis.Main.CardTypeChoice.AllBtn, "c1", 0)
  end
end

function ChoiceWindow.InitChoiceData()
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
end

function ChoiceWindow.InitCardScreenBtn()
  elementTab = uis.Main.CardScreen.GatherChoice.ElementChoice
  occupation = uis.Main.CardScreen.GatherChoice.OccupationChoice
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
    }
  }
  for i, v in pairs(btnTb) do
    UIUtil.SetText(v.btn, v.text)
    v.btn.selected = false
    v.btn.onClick:Set(function()
      choiceData[v.type][v.index] = v.btn.selected
      ChoiceWindow.RefreshCardScreenUI()
    end)
  end
  ChoiceWindow.InitChoiceData()
end

function ChoiceWindow.GetIsChoice()
  for i = 1, 2 do
    for ind = 1, 5 do
      if choiceData[i][ind] then
        return true
      end
    end
  end
end

function ChoiceWindow.OnClose()
  uis = nil
  contentPane = nil
  if jumpTb then
    jumpTb.Close()
    jumpTb = nil
  end
end

return ChoiceWindow
