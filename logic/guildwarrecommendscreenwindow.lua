require("GuildBoss_RecommendScreenWindowByName")
local GuildWarRecommendScreenWindow = {}
local uis, contentPane
local filterCardIdList = {}

function GuildWarRecommendScreenWindow.ReInitData()
end

function GuildWarRecommendScreenWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.GuildWarRecommendScreenWindow.package, WinResConfig.GuildWarRecommendScreenWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetGuildBoss_RecommendScreenWindowUis(contentPane)
    if bridgeObj.argTable[1] then
      filterCardIdList = SimpleCopy(bridgeObj.argTable[1])
    end
    GuildWarRecommendScreenWindow.UpdateInfo()
    GuildWarRecommendScreenWindow.InitBtn()
    GuildWarRecommendScreenWindow.InitText()
  end)
end

function GuildWarRecommendScreenWindow.InitText()
  uis.Main.Tips.Title1.TitleTxt.text = T(11733)
  uis.Main.Tips.Title2.TitleTxt.text = T(11734)
  UIUtil.SetBtnText(uis.Main.Tips.Popup_S_Black_Btn, T(11720))
  UIUtil.SetBtnText(uis.Main.Tips.Popup_S_Green_Btn, T(11721))
end

function GuildWarRecommendScreenWindow.UpdateInfo(scrollToEnd)
  GuildWarRecommendScreenWindow.UpdateAllCards()
  GuildWarRecommendScreenWindow.UpdateSelectCards(scrollToEnd)
end

function GuildWarRecommendScreenWindow.GetFilterCardList()
  local formations = GuildWarData.GetRecommendFormations()
  local filterCardList = {}
  local tempCardIdMap = {}
  local selfAllCard = ActorData.GetCardList()
  local cardList
  for _, v in ipairs(formations) do
    cardList = v.cardInfos
    for _, cardInfo in ipairs(cardList) do
      if tempCardIdMap[cardInfo.cardId] == nil then
        tempCardIdMap[cardInfo.cardId] = 1
        local cardConfig = TableData.GetConfig(cardInfo.cardId, "BaseCard")
        table.insert(filterCardList, {
          cardId = cardInfo.cardId,
          fashionId = cardConfig.fashion_id,
          cardConfig = cardConfig
        })
      end
    end
  end
  for _, cardInfo in ipairs(selfAllCard) do
    if tempCardIdMap[cardInfo.cardId] == nil then
      tempCardIdMap[cardInfo.cardId] = 1
      local cardConfig = TableData.GetConfig(cardInfo.cardId, "BaseCard")
      table.insert(filterCardList, {
        cardId = cardInfo.cardId,
        fashionId = cardConfig.fashion_id,
        cardConfig = cardConfig
      })
    end
  end
  table.sort(filterCardList, function(a, b)
    if a.cardConfig.star ~= b.cardConfig.star then
      return a.cardConfig.star > b.cardConfig.star
    else
      return a.cardId > b.cardId
    end
  end)
  return filterCardList
end

function GuildWarRecommendScreenWindow.UpdateAllCards()
  local allCards = GuildWarRecommendScreenWindow.GetFilterCardList()
  local cardList = uis.Main.Tips.CardList
  
  function cardList.itemRenderer(index, item)
    local cardBtn = item:GetChild("CardHeadBtn")
    local info = allCards[index + 1]
    local cardId = info.cardId
    ChangeUIController(item, "c1", 0)
    local contain, i = table.contain(filterCardIdList, cardId)
    UIUtil.ShowCardTips(info, cardBtn, function()
      if contain then
        table.remove(filterCardIdList, i)
        GuildWarRecommendScreenWindow.UpdateInfo()
      else
        table.insert(filterCardIdList, cardId)
        GuildWarRecommendScreenWindow.UpdateInfo(true)
      end
    end, nil, HEAD_ICON_TYPE_ENUM.RECT)
    if contain then
      ChangeUIController(cardBtn, "c3", 1)
    else
      ChangeUIController(cardBtn, "c3", 0)
    end
    local state = GuildWarData.GetCardState(cardId)
    if state == GUILD_WAR_CARD_STATE.USED_TODAY then
      ChangeUIController(cardBtn, "c2", 1)
      cardBtn:GetChild("State"):GetChild("WordTxt").text = T(11718)
    else
      ChangeUIController(cardBtn, "c2", 0)
    end
  end
  
  cardList.numItems = #allCards
end

function GuildWarRecommendScreenWindow.UpdateSelectCards(scrollToEnd)
  local screenList = uis.Main.Tips.ScreenList
  
  function screenList.itemRenderer(index, item)
    local cardId = filterCardIdList[index + 1]
    if cardId then
      local info = CardData.GetCardDataById(cardId)
      local cardBtn = item:GetChild("CardHeadBtn")
      UIUtil.ShowCardTips(info, cardBtn, function()
        for i, v in ipairs(filterCardIdList) do
          if v == cardId then
            table.remove(filterCardIdList, i)
            GuildWarRecommendScreenWindow.UpdateInfo()
            return
          end
        end
      end, nil, HEAD_ICON_TYPE_ENUM.RECT)
      ChangeUIController(item, "c1", 0)
      local state = GuildWarData.GetCardState(cardId)
      if state == GUILD_WAR_CARD_STATE.USED_TODAY then
        ChangeUIController(cardBtn, "c2", 1)
        cardBtn:GetChild("State"):GetChild("WordTxt").text = T(11718)
      else
        ChangeUIController(cardBtn, "c2", 0)
      end
    else
      ChangeUIController(item, "c1", 1)
    end
  end
  
  screenList.numItems = math.max(#filterCardIdList, 10)
  if scrollToEnd and screenList.numItems > 0 then
    screenList:ScrollToView(screenList.numItems - 1, true)
  end
end

function GuildWarRecommendScreenWindow.InitBtn()
  uis.Main.TouchScreenBtn.onClick:Set(function()
    UIMgr:CloseWindow(WinResConfig.GuildWarRecommendScreenWindow.name)
  end)
  uis.Main.Tips.CloseBtn.onClick:Set(function()
    UIMgr:CloseWindow(WinResConfig.GuildWarRecommendScreenWindow.name)
  end)
  uis.Main.Tips.Popup_S_Black_Btn.onClick:Set(function()
    filterCardIdList = {}
    GuildWarRecommendScreenWindow.UpdateInfo()
  end)
  uis.Main.Tips.Popup_S_Green_Btn.onClick:Set(function()
    UIMgr:SendWindowMessage(WinResConfig.GuildWarRecommendWindow.name, WindowMsgEnum.GuildWarRecommendWindow.UPDATE_FILTER, SimpleCopy(filterCardIdList))
    UIMgr:CloseWindow(WinResConfig.GuildWarRecommendScreenWindow.name)
  end)
end

function GuildWarRecommendScreenWindow.OnClose()
  uis = nil
  contentPane = nil
  filterCardIdList = {}
end

return GuildWarRecommendScreenWindow
