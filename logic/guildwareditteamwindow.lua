require("TeamCardChoice_EditTeamWindowByName")
local GuildWarEditTeamWindow = {}
local uis, contentPane
local curCardInfoList = {}
local selectCardType
local tempTeamInfo = {}
local lastSelectCardId, jumpTb, curCardId, playAnim

function GuildWarEditTeamWindow.ReInitData()
end

function GuildWarEditTeamWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.GuildWarEditTeamWindow.package, WinResConfig.GuildWarEditTeamWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetTeamCardChoice_EditTeamWindowUis(contentPane)
    curCardId = bridgeObj.argTable[1]
    lastSelectCardId = bridgeObj.argTable[2]
    uis.Main.BackGround.BackGroundLoader.url = UIUtil.GetBackgroundUrl(FEATURE_ENUM.HOME_TEAM)
    GuildWarEditTeamWindow.UpdateInfo()
    GuildWarEditTeamWindow.InitBtn()
  end)
end

function GuildWarEditTeamWindow.IsSameCardType(cardId)
  local typeOk = true
  if selectCardType then
    local cardConfig = CardData.GetBaseConfig(cardId)
    typeOk = selectCardType == cardConfig.type
  else
    typeOk = true
  end
  return typeOk
end

function GuildWarEditTeamWindow.GetCardList()
  local cardInfoList = {}
  local allCard = ActorData.GetCardList()
  for _, v in ipairs(allCard) do
    local isInTeam, teamIndex = table.contain(curCardId, v.cardId)
    if isInTeam then
      table.insert(cardInfoList, {
        card = v,
        isInTeam = true,
        teamIndex = teamIndex
      })
    elseif GuildWarEditTeamWindow.IsSameCardType(v.cardId) then
      table.insert(cardInfoList, {
        card = v,
        isInTeam = false,
        teamIndex = 999
      })
    end
  end
  table.sort(cardInfoList, function(a, b)
    if a.teamIndex == b.teamIndex then
      return CardData.DefaultSort(a.card, b.card)
    else
      return a.teamIndex < b.teamIndex
    end
  end)
  return cardInfoList
end

function GuildWarEditTeamWindow.UpdateInfo()
  GuildWarEditTeamWindow.UpdateOccupationRegion()
  tempTeamInfo = {cardIds = curCardId}
  local teamList = uis.Main.TeamList
  ChangeUIController(uis.Main.root, "c1", 1)
  teamList.selectionMode = ListSelectionMode.Multiple_SingleClick
  teamList:SetVirtual()
  teamList.itemRenderer = GuildWarEditTeamWindow.RefreshCard
  GuildWarEditTeamWindow.UpdateTeamList()
  GuildWarEditTeamWindow.UpdateCardNum()
  GuildWarEditTeamWindow.UpdateCardDetail()
end

function GuildWarEditTeamWindow.GetTeamEndCardId()
  return tempTeamInfo.cardIds[#tempTeamInfo.cardIds]
end

function GuildWarEditTeamWindow.UpdateOccupationRegion()
  local list = uis.Main.OccupationRegion.BtnList
  local cardTypeList = {
    {
      type = nil,
      name = T(50),
      subName = T(51),
      index = 0
    },
    {
      type = BATTLE_UNIT_TYPE.DEFENSE,
      name = T(219),
      subName = T(220),
      index = 1
    },
    {
      type = BATTLE_UNIT_TYPE.MELEE_ATTACK,
      name = T(221),
      subName = T(222),
      index = 2
    },
    {
      type = BATTLE_UNIT_TYPE.SUPPORT,
      name = T(227),
      subName = T(228),
      index = 4
    },
    {
      type = BATTLE_UNIT_TYPE.RANGED_ATTACK,
      name = T(225),
      subName = T(226),
      index = 5
    }
  }
  for i, v in ipairs(cardTypeList) do
    local hand = list:AddItemFromPool()
    UIUtil.SetBtnText(hand, v.name, v.subName)
    hand.soundFmod = SOUND_EVENT_ENUM.TAB_TAG2
    hand.selected = selectCardType == v.type
    ChangeUIController(hand, "c1", v.index)
    hand.onClick:Add(function()
      if selectCardType ~= v.type then
        selectCardType = v.type
        playAnim = true
        GuildWarEditTeamWindow.UpdateTeamList()
        playAnim = false
      end
    end)
  end
end

function GuildWarEditTeamWindow.UpdateTeamList()
  curCardInfoList = GuildWarEditTeamWindow.GetCardList()
  local teamList = uis.Main.TeamList
  teamList.numItems = #curCardInfoList
  teamList:ScrollToView(0)
end

function GuildWarEditTeamWindow.GetTeamCardLimitNum()
  return TableData.GetConfig(70011407, "BaseFixed").int_value
end

function GuildWarEditTeamWindow.UpdateCardNum()
  uis.Main.Number.WordTxt.text = T(10045)
  uis.Main.Number.NumberTxt.text = T(10047, #tempTeamInfo.cardIds, GuildWarEditTeamWindow.GetTeamCardLimitNum())
end

function GuildWarEditTeamWindow.UpdateCardDetail()
  local cardId = lastSelectCardId
  local info1 = uis.Main.Info.Info1
  local info2 = uis.Main.Info.Info2
  local info3 = uis.Main.Info.Info3
  if cardId then
    uis.Main.Info.c1Ctr.selectedIndex = 0
    local cardInfo = CardData.GetCardDataById(cardId)
    local baseConfig = CardData.GetBaseConfig(cardId)
    local cardLevelConfig = CardData.GetCardLevelUpConfig(baseConfig.grow_model_id, cardInfo.level)
    info1.NameTxt.text = baseConfig.name()
    info1.LevelTxt.text = T(10062, cardLevelConfig.level_show)
    UIUtil.ShowStarList(info1.StarList, cardInfo, baseConfig)
    info1.c1Ctr.selectedIndex = baseConfig.star - 1
    local elementList = info1.ElementList
    UIUtil.ShowElementList(elementList, baseConfig)
    info1.Occupation.c1Ctr.selectedIndex = baseConfig.type - 1
    info1.CardBreach.c1Ctr.selectedIndex = cardInfo.quality
    UIUtil.SetText(info1.UpBtn, T(1093), "WordTxt")
    UIUtil.SetBtnText(info2.TitleBtn, T(31), T(33))
    local cardAttributeList = info2.AttributeList
    local displayAttributeTable = {
      {
        id = ProtoEnum.ATTR_ID.ATK,
        name = T(80000103),
        index = 1
      },
      {
        id = ProtoEnum.ATTR_ID.DEF,
        name = T(80000104),
        index = 2
      },
      {
        id = ProtoEnum.ATTR_ID.MAX_HP,
        name = T(80000102),
        index = 0
      }
    }
    local attrData = CardData.CalculatorCardAttr(cardInfo)
    cardAttributeList:RemoveChildrenToPool()
    for i, v in ipairs(displayAttributeTable) do
      local attribute = cardAttributeList:AddItemFromPool()
      attribute:GetChild("NameTxt").text = v.name
      attribute:GetChild("NumberTxt").text = attrData[v.id]
      ChangeUIController(attribute, nil, v.index)
    end
    UIUtil.SetBtnText(info3.TitleBtn, T(32), T(34))
    local skillList = info3.SkillList
    skillList:RemoveChildrenToPool()
    local skill2Level = cardInfo.skill2Level
    local displaySkillTable = {
      baseConfig.special_skill,
      baseConfig.burst_skill
    }
    for _, v in ipairs(displaySkillTable) do
      local item = skillList:AddItemFromPool()
      UIUtil.ShowCardSkill(item, v, skill2Level[v])
    end
  else
    uis.Main.Info.c1Ctr.selectedIndex = 1
    uis.Main.Info.Info4.WordTxt.text = T(10057)
  end
end

function GuildWarEditTeamWindow.RefreshCard(index, itemAni)
  local cardInfo = curCardInfoList[index + 1]
  if cardInfo and itemAni then
    local item = itemAni:GetChild("EditTipsBtn")
    local teamList = uis.Main.TeamList
    PlayUITransToComplete(itemAni, "up")
    if playAnim then
      item.alpha = 0
      PlayUITrans(itemAni, "up", nil, 0.03 * index)
    end
    local inTeamIndex = GuildWarEditTeamWindow.UpdateInTeamIndex(cardInfo.card.cardId)
    if inTeamIndex then
      item:GetChild("NumberTxt").text = LuaUtil.FormatNum(inTeamIndex, "00")
    else
      item:GetChild("NumberTxt").text = ""
    end
    if cardInfo.isInTeam then
      ChangeUIController(item, "c1", 1)
    else
      ChangeUIController(item, "c1", 0)
    end
    local id = cardInfo.card.cardId
    UIUtil.ShowCardTips(cardInfo.card, item:GetChild("CardTips"), function()
      if cardInfo.isInTeam == false then
        if #tempTeamInfo.cardIds >= GuildWarEditTeamWindow.GetTeamCardLimitNum() then
          FloatTipsUtil.ShowWarnTips(T(10055))
          return
        end
        table.insert(tempTeamInfo.cardIds, id)
      else
        for i, cardId in ipairs(tempTeamInfo.cardIds) do
          if id == cardId then
            table.remove(tempTeamInfo.cardIds, i)
            break
          end
        end
      end
      lastSelectCardId = GuildWarEditTeamWindow.GetTeamEndCardId()
      if cardInfo.isInTeam then
        ChangeUIController(item, "c1", 0)
      else
        ChangeUIController(item, "c1", 1)
      end
      cardInfo.isInTeam = not cardInfo.isInTeam
      GuildWarEditTeamWindow.UpdateCardNum()
      GuildWarEditTeamWindow.UpdateAllIndex()
      GuildWarEditTeamWindow.UpdateCardDetail()
      SoundUtil.PlayUISfx(SOUND_EVENT_ENUM.CARD_SELECT)
    end, nil, HEAD_ICON_TYPE_ENUM.SQUARE)
  end
end

function GuildWarEditTeamWindow.UpdateAllIndex(clearIndex)
  local teamList = uis.Main.TeamList
  local numChildren = teamList.numChildren
  local cardInfo
  for i = 1, numChildren do
    local itemIndex = teamList:ChildIndexToItemIndex(i)
    cardInfo = curCardInfoList[itemIndex]
    local item = teamList:GetChildAt(i - 1):GetChild("EditTipsBtn")
    local inTeamIndex = GuildWarEditTeamWindow.UpdateInTeamIndex(cardInfo.card.cardId)
    if inTeamIndex then
      item:GetChild("NumberTxt").text = LuaUtil.FormatNum(inTeamIndex, "00")
    else
      item:GetChild("NumberTxt").text = ""
    end
    if clearIndex and nil == inTeamIndex then
      ChangeUIController(item, "c1", 0)
    end
  end
end

function GuildWarEditTeamWindow.UpdateInTeamIndex(cardId)
  local index
  for i, id in ipairs(tempTeamInfo.cardIds) do
    if id == cardId then
      index = i
      break
    end
  end
  return index
end

function GuildWarEditTeamWindow.InitBtn()
  jumpTb = CurrencyReturnWindow.SetCurrencyReturn(WinResConfig.GuildWarEditTeamWindow.name, uis.Main.CurrencyReturn)
  uis.Main.SureBtn.onClick:Add(GuildWarEditTeamWindow.ClickSureBtn)
  uis.Main.CancelBtn.onClick:Add(GuildWarEditTeamWindow.ClickCancelBtn)
  UIUtil.SetBtnText(uis.Main.SureBtn, T(302), T(303))
  UIUtil.SetBtnText(uis.Main.CancelBtn, T(10052), T(10053))
  uis.Main.DeleteBtn.visible = false
end

function GuildWarEditTeamWindow.ClickCancelBtn()
  UIMgr:CloseWindow(WinResConfig.GuildWarEditTeamWindow.name)
end

function GuildWarEditTeamWindow.ClickSureBtn()
  GuildWarService.SetGuildWarAssistCardReq(curCardId, function()
    GuildWarEditTeamWindow.ClickCancelBtn()
  end)
end

function GuildWarEditTeamWindow.UpdateCardInfoList()
  if curCardInfoList then
    for i, v in ipairs(curCardInfoList) do
      v.card = CardData.GetCardDataById(v.card.cardId)
    end
  end
end

function GuildWarEditTeamWindow.OnShown()
  if uis then
    GuildWarEditTeamWindow.UpdateCardInfoList()
    local teamList = uis.Main.TeamList
    teamList:RefreshVirtualList()
    GuildWarEditTeamWindow.UpdateCardDetail()
  end
end

function GuildWarEditTeamWindow.OnClose()
  uis = nil
  contentPane = nil
  curCardInfoList = {}
  selectCardType = nil
  tempTeamInfo = nil
  lastSelectCardId = nil
  if jumpTb then
    jumpTb.Close()
    jumpTb = nil
  end
  curCardId = nil
  playAnim = nil
end

return GuildWarEditTeamWindow
