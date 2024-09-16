require("Badge_ExchangeWindowByName")
local BadgeExchangeWindow = {}
local uis, contentPane, target

function BadgeExchangeWindow.ReInitData()
end

function BadgeExchangeWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.BadgeExchangeWindow.package, WinResConfig.BadgeExchangeWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    local cardId = bridgeObj.argTable[1]
    local targetBadgeUid = bridgeObj.argTable[2]
    local badgeUid = bridgeObj.argTable[3]
    uis = GetBadge_ExchangeWindowUis(contentPane)
    BadgeExchangeWindow.UpdateInfo(cardId, targetBadgeUid, badgeUid)
    BadgeExchangeWindow.InitBtn()
  end)
end

function BadgeExchangeWindow.ShowCard(cardInfo, card)
  local canExchange = {}
  UIUtil.SetHeadByFaceId(cardInfo.fashionId, card.CardBg.PicLoader, HEAD_ICON_TYPE_ENUM.RECT)
  local allDate = {}
  for i = 1, 3 do
    if cardInfo.wearBadgeUids[i] then
      local tempInfo = ActorData.GetBadgeInfoByUid(cardInfo.wearBadgeUids[i])
      local data = TableData.GetConfig(tempInfo.badgeId, "BaseBadge")
      if data and tempInfo then
        allDate[data.type] = {data = data, tempInfo = tempInfo}
      end
    end
  end
  for i = 1, 3 do
    local icon = card["Icon" .. i]
    if icon then
      if allDate[i] then
        ChangeController(icon.c1Ctr, allDate[i].data.star - 1)
        ChangeController(icon.c3Ctr, allDate[i].tempInfo.locked and 1 or 0)
        ChangeController(icon.c4Ctr, 0)
        ChangeController(icon.c6Ctr, 0 == allDate[i].tempInfo.level and 0 or 1)
        BadgeMgr.ShowLevel(icon.LevelTxt, allDate[i].tempInfo.level)
        BadgeMgr.ShowStar(icon.StarList, allDate[i].data.star)
        icon.IconLoader.url = UIUtil.GetResUrl(allDate[i].data.icon)
        canExchange[i] = true
      else
        ChangeController(icon.c4Ctr, 1)
      end
      ChangeController(icon.c5Ctr, i - 1)
    end
  end
  return canExchange
end

function BadgeExchangeWindow.UpdateInfo(cardId, targetBadgeUid, badgeUid)
  local targetInfo = ActorData.GetBadgeInfoByUid(targetBadgeUid)
  if targetInfo.wearCardId and 0 ~= targetInfo.wearCardId then
    local tips = uis.Main.PrimaryAttributeTips
    tips.TitleTxt.text = T(1243)
    UIUtil.SetText(tips.ChoiceRegion.AllBtn, T(1353), "WordTxt")
    local selfCardInfo = CardData.GetCardDataById(cardId)
    local selfState = BadgeExchangeWindow.ShowCard(selfCardInfo, tips.Card1)
    local targetState = {}
    local targetCardInfo = CardData.GetCardDataById(targetInfo.wearCardId)
    targetState = BadgeExchangeWindow.ShowCard(targetCardInfo, tips.Card2)
    local targetCardData = TableData.GetConfig(targetInfo.wearCardId, "BaseCard")
    if targetCardData then
      tips.WordTxt.text = T(1244, targetCardData.name())
    end
    for i = 1, 3 do
      if selfState[i] and targetState[i] then
        ChangeUIController(tips.ChoiceRegion[string.format("Position%dBtn", i)], "c1", 0)
      elseif not selfState[i] and targetState[i] then
        ChangeUIController(tips.ChoiceRegion[string.format("Position%dBtn", i)], "c1", 1)
      elseif selfState[i] and not targetState[i] then
        ChangeUIController(tips.ChoiceRegion[string.format("Position%dBtn", i)], "c1", 2)
      else
        ChangeUIController(tips.ChoiceRegion[string.format("Position%dBtn", i)], "c1", 3)
      end
    end
    local InitButton = function(bol)
      tips.ChoiceRegion.Position1Btn.selected = bol
      tips.ChoiceRegion.Position2Btn.selected = bol
      tips.ChoiceRegion.Position3Btn.selected = bol
    end
    local GetSend = function()
      local sendType = {}
      for i = 1, 3 do
        local btn = tips.ChoiceRegion[string.format("Position%dBtn", i)]
        local controller = btn:GetController("c1")
        if btn.selected and 3 ~= controller.selectedIndex then
          table.insert(sendType, i)
        end
      end
      return sendType
    end
    local ShowTxt = function(bol)
      local tb = GetSend()
      local len = table.getLen(tb)
      tips.WordTxt.visible = len > 0
      tips.ChoiceRegion.AllBtn.selected = 3 == len
    end
    tips.ChoiceRegion.AllBtn.onClick:Set(function()
      InitButton(tips.ChoiceRegion.AllBtn.selected)
      ShowTxt()
    end)
    tips.ChoiceRegion.Position1Btn.onClick:Set(ShowTxt)
    tips.ChoiceRegion.Position2Btn.onClick:Set(ShowTxt)
    tips.ChoiceRegion.Position3Btn.onClick:Set(ShowTxt)
    InitButton(false)
    ShowTxt()
    tips.SureBtn.onClick:Set(function()
      local types = GetSend()
      if table.getLen(types) > 0 then
        BadgeService.SwitchBadgeReq(cardId, targetInfo.wearCardId, types, function()
          UIMgr:SendWindowMessage(WinResConfig.BadgeWindow.name, WindowMsgEnum.BadgeWindow.PLAY_WEAR_EFFECT)
          UIMgr:SendWindowMessage(WinResConfig.BadgeWindow.name, WindowMsgEnum.BadgeWindow.REFRESH_WEAR_BADGE)
          BadgeExchangeWindow.CloseWindow()
        end)
      end
    end)
  end
end

function BadgeExchangeWindow.ShowHead(loader, cardId)
  if headShow then
    local cardInfo = CardData.GetCardDataById(cardId)
    local loader = headShow:GetChild("HeadShowBg"):GetChild("PicLoader")
    if cardInfo then
      UIUtil.SetHeadByFaceId(cardInfo.fashionId, loader, HEAD_ICON_TYPE_ENUM.RECT)
    end
  end
end

function BadgeExchangeWindow.InitBtn()
  uis.Main.TouchScreenBtn.onClick:Set(BadgeExchangeWindow.CloseWindow)
  uis.Main.PrimaryAttributeTips.CloseBtn.onClick:Set(BadgeExchangeWindow.CloseWindow)
  uis.Main.PrimaryAttributeTips.ClearBtn.onClick:Set(BadgeExchangeWindow.CloseWindow)
  UIUtil.SetText(uis.Main.PrimaryAttributeTips.ClearBtn, T(10052), "NameTxt")
  UIUtil.SetText(uis.Main.PrimaryAttributeTips.SureBtn, T(302), "NameTxt")
end

function BadgeExchangeWindow.CloseWindow()
  UIMgr:CloseWindow(WinResConfig.BadgeExchangeWindow.name)
end

function BadgeExchangeWindow.OnClose()
  uis = nil
  contentPane = nil
end

return BadgeExchangeWindow
