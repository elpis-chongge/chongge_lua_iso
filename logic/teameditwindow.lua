require("Team_EditTeamWindowByName")
local TeamEditWindow = {}
local uis, contentPane, teamId, cardIndex, singleSelectCard
local curCardInfoList = {}
local selectCardType
local TEAM_EDIT_TYPE = {
  SINGLE = 1,
  QUICK = 2,
  ADD = 3
}
local curTeamEditType
local tempTeamInfo = {}
local lastSelectCardId, jumpTb, playAnim

function TeamEditWindow.ReInitData()
end

function TeamEditWindow.Init()
  uis.Main.BackGround.BackGroundLoader.url = UIUtil.GetBackgroundUrl(FEATURE_ENUM.HOME_TEAM)
end

function TeamEditWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.TeamEditWindow.package, WinResConfig.TeamEditWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    ld("Battle")
    uis = GetTeam_EditTeamWindowUis(contentPane)
    teamId, cardIndex = bridgeObj.argTable[1], bridgeObj.argTable[2]
    TeamEditWindow.Init()
    TeamEditWindow.UpdateInfo()
    TeamEditWindow.InitBtn()
  end)
end

function TeamEditWindow.IsSameCardType(cardId)
  local typeOk = true
  if selectCardType then
    local cardConfig = CardData.GetBaseConfig(cardId)
    typeOk = selectCardType == cardConfig.type
  else
    typeOk = true
  end
  return typeOk
end

function TeamEditWindow.GetCardList()
  local cardInfoList = {}
  local allCard = ActorData.GetCardList()
  if curTeamEditType == TEAM_EDIT_TYPE.QUICK then
    for _, v in ipairs(allCard) do
      local isInTeam, teamIndex = TeamData.IsCardInTeam(v.cardId, teamId, tempTeamInfo)
      if isInTeam then
        table.insert(cardInfoList, {
          card = v,
          isInTeam = true,
          teamIndex = teamIndex
        })
      elseif TeamEditWindow.IsSameCardType(v.cardId) then
        table.insert(cardInfoList, {
          card = v,
          isInTeam = false,
          teamIndex = 999
        })
      end
    end
  elseif curTeamEditType == TEAM_EDIT_TYPE.SINGLE then
    for _, v in ipairs(allCard) do
      if TeamData.IsCardInTeam(v.cardId, teamId, tempTeamInfo) == false and TeamEditWindow.IsSameCardType(v.cardId) then
        table.insert(cardInfoList, {
          card = v,
          isInTeam = false,
          teamIndex = 999
        })
      end
    end
    if singleSelectCard then
      table.insert(cardInfoList, 1, {
        card = CardData.GetCardDataById(singleSelectCard),
        isInTeam = true,
        teamIndex = cardIndex
      })
    end
  elseif curTeamEditType == TEAM_EDIT_TYPE.ADD then
    for _, v in ipairs(allCard) do
      if TeamData.IsCardInTeam(v.cardId, teamId) == false then
        local isInTeam, teamIndex = TeamData.IsCardInTeam(v.cardId, teamId, tempTeamInfo)
        if isInTeam then
          table.insert(cardInfoList, {
            card = v,
            isInTeam = true,
            teamIndex = teamIndex
          })
        elseif TeamEditWindow.IsSameCardType(v.cardId) then
          table.insert(cardInfoList, {
            card = v,
            isInTeam = false,
            teamIndex = 999
          })
        end
      end
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

function TeamEditWindow.UpdateInfo()
  TeamEditWindow.UpdateOccupationRegion()
  local teamInfo = TeamData.GetTeamInfoById(teamId)
  if teamInfo then
    tempTeamInfo = SimpleCopy(teamInfo)
  else
    tempTeamInfo = {
      teamId = teamId,
      name = T(10043, teamId),
      cardIds = {}
    }
  end
  local teamList = uis.Main.TeamList
  if nil == cardIndex then
    curTeamEditType = TEAM_EDIT_TYPE.QUICK
    ChangeUIController(uis.Main.root, "c1", 1)
    teamList.selectionMode = ListSelectionMode.Multiple_SingleClick
    lastSelectCardId = tempTeamInfo.cardIds[#tempTeamInfo.cardIds]
  else
    ChangeUIController(uis.Main.root, "c1", 0)
    teamList.selectionMode = ListSelectionMode.Single
    if teamInfo and teamInfo.cardIds[cardIndex] then
      curTeamEditType = TEAM_EDIT_TYPE.SINGLE
      singleSelectCard = teamInfo.cardIds[cardIndex]
      lastSelectCardId = singleSelectCard
    else
      curTeamEditType = TEAM_EDIT_TYPE.ADD
      lastSelectCardId = nil
    end
  end
  teamList:SetVirtual()
  teamList.itemRenderer = TeamEditWindow.RefreshCard
  TeamEditWindow.UpdateTeamList()
  TeamEditWindow.UpdateCardNum()
  TeamEditWindow.UpdateCardDetail()
end

function TeamEditWindow.GetTeamEndCardId()
  return tempTeamInfo.cardIds[#tempTeamInfo.cardIds]
end

function TeamEditWindow.UpdateOccupationRegion()
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
        TeamEditWindow.UpdateTeamList()
        playAnim = false
      end
    end)
  end
end

function TeamEditWindow.UpdateTeamList()
  curCardInfoList = TeamEditWindow.GetCardList()
  local teamList = uis.Main.TeamList
  teamList.numItems = #curCardInfoList
  teamList:ScrollToView(0)
end

function TeamEditWindow.UpdateCardNum()
  local teamList = uis.Main.TeamList
  if teamList.selectionMode == ListSelectionMode.Single then
    return
  end
  uis.Main.Number.WordTxt.text = T(10045)
  uis.Main.Number.NumberTxt.text = T(10047, #tempTeamInfo.cardIds, TeamData.GetTeamCardLimitNum())
end

function TeamEditWindow.UpdateCardDetail()
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
    info1.UpBtn.onClick:Set(function()
      CardMgr.InitCtrIndex()
      OpenWindow(WinResConfig.CardDetailsWindow.name, nil, cardId)
    end)
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

function TeamEditWindow.RefreshCard(index, itemAni)
  local cardInfo = curCardInfoList[index + 1]
  if cardInfo and itemAni then
    local item = itemAni:GetChild("EditTipsBtn")
    local teamList = uis.Main.TeamList
    PlayUITransToComplete(itemAni, "up")
    if playAnim then
      item.alpha = 0
      PlayUITrans(itemAni, "up", nil, 0.03 * index)
    end
    local inTeamIndex = TeamEditWindow.UpdateInTeamIndex(cardInfo.card.cardId)
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
      if teamList.selectionMode == ListSelectionMode.Single then
        if cardInfo.isInTeam == false then
          if singleSelectCard then
            for i, cardId in ipairs(tempTeamInfo.cardIds) do
              if singleSelectCard == cardId then
                tempTeamInfo.cardIds[i] = id
                for lastSelectIndex, info in ipairs(curCardInfoList) do
                  if info.card.cardId == singleSelectCard then
                    info.isInTeam = false
                    local childIndex = teamList:ItemIndexToChildIndex(lastSelectIndex - 1)
                    if childIndex >= 0 and childIndex < teamList.numChildren then
                      local child = teamList:GetChildAt(childIndex):GetChild("EditTipsBtn")
                      ChangeUIController(child, "c1", 0)
                    end
                  end
                end
                break
              end
            end
          else
            table.insert(tempTeamInfo.cardIds, id)
          end
          ChangeUIController(item, "c1", 1)
          singleSelectCard = id
          lastSelectCardId = id
          cardInfo.isInTeam = true
        else
          ChangeUIController(item, "c1", 0)
          cardInfo.isInTeam = false
          singleSelectCard = nil
          lastSelectCardId = nil
          for i, cardId in ipairs(tempTeamInfo.cardIds) do
            if cardId == id then
              table.remove(tempTeamInfo.cardIds, i)
              break
            end
          end
        end
      else
        if cardInfo.isInTeam == false then
          if #tempTeamInfo.cardIds >= TeamData.GetTeamCardLimitNum() then
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
        lastSelectCardId = TeamEditWindow.GetTeamEndCardId()
        if cardInfo.isInTeam then
          ChangeUIController(item, "c1", 0)
        else
          ChangeUIController(item, "c1", 1)
        end
        cardInfo.isInTeam = not cardInfo.isInTeam
      end
      TeamEditWindow.UpdateCardNum()
      TeamEditWindow.UpdateAllIndex()
      TeamEditWindow.UpdateCardDetail()
    end, nil, HEAD_ICON_TYPE_ENUM.SQUARE)
  end
end

function TeamEditWindow.UpdateAllIndex(clearIndex)
  local teamList = uis.Main.TeamList
  local numChildren = teamList.numChildren
  local cardInfo
  for i = 1, numChildren do
    local itemIndex = teamList:ChildIndexToItemIndex(i)
    cardInfo = curCardInfoList[itemIndex]
    local item = teamList:GetChildAt(i - 1):GetChild("EditTipsBtn")
    local inTeamIndex = TeamEditWindow.UpdateInTeamIndex(cardInfo.card.cardId)
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

function TeamEditWindow.UpdateInTeamIndex(cardId)
  local index
  for i, id in ipairs(tempTeamInfo.cardIds) do
    if id == cardId then
      index = i
      break
    end
  end
  return index
end

function TeamEditWindow.InitBtn()
  jumpTb = CurrencyReturnWindow.SetCurrencyReturn(WinResConfig.TeamEditWindow.name, uis.Main.CurrencyReturn)
  uis.Main.DeleteBtn.onClick:Add(TeamEditWindow.ClickDeleteBtn)
  uis.Main.SureBtn.onClick:Add(TeamEditWindow.ClickSureBtn)
  uis.Main.CancelBtn.onClick:Add(TeamEditWindow.ClickCancelBtn)
  UIUtil.SetBtnText(uis.Main.SureBtn, T(302), T(303))
  UIUtil.SetBtnText(uis.Main.CancelBtn, T(10052), T(10053))
  if curTeamEditType == TEAM_EDIT_TYPE.QUICK then
    uis.Main.DeleteBtn.visible = true
  else
    uis.Main.DeleteBtn.visible = false
  end
end

function TeamEditWindow.ClickDeleteBtn()
  MessageBox.Show(T(10048), {
    touchCallback = function()
      tempTeamInfo.cardIds = {}
      for _, info in ipairs(curCardInfoList) do
        info.isInTeam = false
      end
      TeamEditWindow.UpdateAllIndex(true)
      TeamEditWindow.UpdateCardNum()
    end
  }, {})
end

function TeamEditWindow.ClickCancelBtn()
  UIMgr:CloseWindow(WinResConfig.TeamEditWindow.name)
end

function TeamEditWindow.ClickSureBtn()
  TeamService.SetCardTeamReq(tempTeamInfo.teamId, tempTeamInfo.cardIds, tempTeamInfo.name)
end

function TeamEditWindow.UpdateCardInfoList()
  if curCardInfoList then
    for i, v in ipairs(curCardInfoList) do
      v.card = CardData.GetCardDataById(v.card.cardId)
    end
  end
end

function TeamEditWindow.OnShown()
  if uis then
    TeamEditWindow.UpdateCardInfoList()
    local teamList = uis.Main.TeamList
    teamList:RefreshVirtualList()
    TeamEditWindow.UpdateCardDetail()
  end
end

function TeamEditWindow.OnHide()
end

function TeamEditWindow.OnClose()
  lastSelectCardId = nil
  curTeamEditType = nil
  selectCardType = nil
  singleSelectCard = nil
  tempTeamInfo = {}
  curCardInfoList = {}
  uis = nil
  contentPane = nil
  if jumpTb then
    jumpTb.Close()
    jumpTb = nil
  end
  playAnim = nil
end

function TeamEditWindow.HandleMessage(msgId, para)
end

return TeamEditWindow
