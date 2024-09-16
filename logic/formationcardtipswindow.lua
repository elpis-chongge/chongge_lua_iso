require("Formation_CardTipsWindowByName")
local FormationCardTipsWindow = {}
local uis, contentPane

function FormationCardTipsWindow.ReInitData()
end

local cardInfo, closeCallback, params, page, sceneType, curShowSkillId, allBadges

function FormationCardTipsWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.FormationCardTipsWindow.package, WinResConfig.FormationCardTipsWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    cardInfo, closeCallback, params, page, sceneType = bridgeObj.argTable[1], bridgeObj.argTable[2], bridgeObj.argTable[3], bridgeObj.argTable[4], bridgeObj.argTable[5]
    uis = GetFormation_CardTipsWindowUis(contentPane)
    if sceneType == ProtoEnum.SCENE_TYPE.ROGUE then
      ld("Rogue")
      local rogueInfo = RogueData.GetRogueInfo()
      if rogueInfo and cardInfo then
        for i = 1, #rogueInfo.allCards do
          if rogueInfo.allCards[i].cardId == cardInfo.cardId then
            cardInfo = rogueInfo.allCards[i]
            break
          end
        end
        for i = 1, #rogueInfo.cardBadges do
          if rogueInfo.cardBadges[i].cardId == cardInfo.cardId then
            allBadges = rogueInfo.cardBadges[i].badges
            break
          end
        end
        FormationCardTipsWindow.UpdateInfo()
      end
    elseif cardInfo then
      if 0 == cardInfo.uin then
        FormationCardTipsWindow.UpdateInfo()
      elseif cardInfo.uin == ActorData.GetUin() then
        cardInfo = CardData.GetCardDataById(cardInfo.cardId)
        if params and params.rogueData and params.rogueAttributes then
          cardInfo = SimpleCopy(cardInfo)
          cardInfo.rogueAttributes = params.rogueAttributes
        end
        FormationCardTipsWindow.UpdateInfo()
      else
        FormationService.GetOtherCardInfoReq(cardInfo.uid or cardInfo.cardUid, cardInfo.uin, function(msg)
          if uis then
            local wearBadgeUids = {}
            local badgeInfo = msg.badgeInfos
            for i, v in pairs(badgeInfo) do
              table.insert(wearBadgeUids, v.badgeUid)
            end
            cardInfo = SimpleCopy(msg.cardInfo)
            cardInfo.badgeInfo = badgeInfo
            cardInfo.wearBadgeUids = wearBadgeUids
            FormationCardTipsWindow.UpdateInfo()
          end
        end)
      end
    end
    FormationCardTipsWindow.InitBtn()
  end)
end

function FormationCardTipsWindow.UpdateInfo()
  local cardPicBg = uis.Main.CardPicBg
  UIUtil.SetHeadByFaceId(cardInfo.fashionId, cardPicBg.PicLoader, HEAD_ICON_TYPE_ENUM.BANNER)
  local cardId = cardInfo.cardId or cardInfo.id
  local config = TableData.GetConfig(cardId, "BaseCard")
  local cardInfoCom = uis.Main.CardInfo
  cardInfoCom.NameTxt.text = config.name()
  local elementList = cardInfoCom.ElementList
  UIUtil.ShowElementList(elementList, config)
  cardInfoCom.ElementTxt.text = CardData.GetElementTxt(config.element_type)
  local occupation = cardInfoCom.Occupation
  occupation.c1Ctr.selectedIndex = config.type - 1
  cardInfoCom.OccupationTxt.text = CardData.GetOccupationTxt(config.type)
  local starList = cardInfoCom.StarList
  UIUtil.ShowStarList(starList, cardInfo, config)
  local levelTxt = cardInfoCom.LevelTxt
  local lvId = config.grow_model_id * 1000 + cardInfo.level
  local lvData = TableData.GetConfig(lvId, "BaseCardLevelUp")
  levelTxt.text = T(535, lvData.level_show)
  local cardBreach = cardInfoCom.CardBreach
  cardBreach.c1Ctr.selectedIndex = cardInfo.quality
  cardBreach.c2Ctr.selectedIndex = 0
  local contentList = cardInfoCom.CardAttributeModule.ContentList
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
  local attrData = CardData.CalculatorCardAttr(cardInfo, params)
  contentList:RemoveChildrenToPool()
  for i, v in ipairs(displayAttributeTable) do
    local attribute = contentList:AddItemFromPool()
    attribute:GetChild("NumberTxt").text = attrData[v.id]
    ChangeUIController(attribute, nil, v.index)
  end
  local skillList = uis.Main.CardSkillModule.ContentList
  skillList:RemoveChildrenToPool()
  local skill2Level = cardInfo.skill2Level
  local skillConfig
  local displaySkillTable = {}
  local showSkillId = {
    config.leader_skill,
    config.special_skill,
    config.burst_skill,
    config.normal_skill
  }
  if nil == skill2Level and cardInfo.skillLevels then
    skill2Level = {}
    local skillLevels = cardInfo.skillLevels
    for i, v in ipairs(skillLevels) do
      skill2Level[v.skillId] = v.level
    end
  end
  local tempLv = {}
  for i = 1, #showSkillId do
    skillConfig = TableData.GetConfig(showSkillId[i], "BaseSkill")
    local skillLevel = 1
    if skill2Level[showSkillId[i]] then
      local addLv = 0
      if cardInfo.gradeUpSkills and cardInfo.gradeUpSkills[showSkillId[i]] then
        addLv = cardInfo.gradeUpSkills[showSkillId[i]]
      end
      skillLevel = skill2Level[showSkillId[i]] + addLv
    end
    tempLv[showSkillId[i]] = skillLevel
    if config.normal_skill ~= showSkillId[i] then
      table.insert(displaySkillTable, {
        id = showSkillId[i],
        config = skillConfig,
        type = skillConfig.type,
        level = skillLevel,
        cardInfo = cardInfo
      })
    end
  end
  
  function skillList.itemRenderer(i, item)
    local data = displaySkillTable[i + 1]
    item:GetChild("NameTxt").text = data.config.name()
    local skill = item:GetChild("Skill")
    skill:GetChild("IconLoader").url = UIUtil.GetResUrl(data.config.icon)
    CardMgr.ShowSkillTypeInfo(data.config, item)
    if data.type == SKILL_TYPE_ENUM.LEADER then
      ChangeUIController(item, "c2", cardInfo.skill2Level and cardInfo.skill2Level[data.id] and 0 or 1)
      UIUtil.SetText(skill:GetChild("SkillLock"), T(1311), "LevelTxt")
    end
  end
  
  skillList.numItems = #displaySkillTable
  table.insert(displaySkillTable, 2, {
    id = config.normal_skill,
    type = 1,
    level = tempLv[config.normal_skill],
    cardInfo = cardInfo
  })
  skillList.onClick:Set(function()
    OpenWindow(WinResConfig.DetailsAllSkillWindow.name, nil, displaySkillTable)
  end)
  local gotoBtn = uis.Main.GoToBtn
  if gotoBtn then
    if cardInfo.cardUid and CardData.GetCardDataByUid(cardInfo.cardUid) and sceneType ~= ProtoEnum.SCENE_TYPE.ROGUE then
      if EnterClampUtil.WhetherToEnter(FEATURE_ENUM.TIPS_GOTO_CARD_GROW, false) == false then
        gotoBtn.visible = false
        return
      end
      UIUtil.SetBtnText(gotoBtn, T(10829))
      gotoBtn.visible = true
      gotoBtn.onClick:Set(function()
        if 0 == uis.Main.c2Ctr.selectedIndex then
          CardMgr.InitCtrIndex()
          OpenWindow(WinResConfig.CardDetailsWindow.name, nil, cardId)
          UIMgr:SetWindowArgs(WinResConfig.FormationCardTipsWindow.name, {
            cardInfo,
            closeCallback,
            params,
            0,
            sceneType
          })
        elseif 1 == uis.Main.c2Ctr.selectedIndex and EnterClampUtil.WhetherToEnter(FEATURE_ENUM.HOME_BADGE) then
          OpenWindow(WinResConfig.BadgeWindow.name, nil, cardId)
          UIMgr:SetWindowArgs(WinResConfig.FormationCardTipsWindow.name, {
            cardInfo,
            closeCallback,
            params,
            1,
            sceneType
          })
        end
      end)
    else
      gotoBtn.visible = false
    end
  end
  UIUtil.SetText(uis.Main.AttributeBtn, T(1316))
  UIUtil.SetText(uis.Main.BadgeBtn, T(1317))
  if sceneType == ProtoEnum.SCENE_TYPE.ROGUE then
    FormationCardTipsWindow.InitRogueBadgeList()
  else
    FormationCardTipsWindow.InitBadgeList()
  end
  if page then
    uis.Main.c2Ctr.selectedIndex = page
  end
end

function FormationCardTipsWindow.InitRogueBadgeList()
  local rogueInfo = RogueData.GetRogueInfo()
  if cardInfo and rogueInfo then
    function uis.Main.BadgeList.itemRenderer(ind, badgeCom)
      local suitNum = {}
      
      local suitId = {}
      local list = badgeCom:GetChild("BadgeList")
      local badgeAllId = {}
      local badgeAllData = {}
      local badgeAllBadgeInfo = {}
      if allBadges then
        for i, v in pairs(allBadges) do
          local tempData = TableData.GetConfig(v.badgeId, "BaseBadge")
          if tempData then
            badgeAllData[v.badgeId] = tempData
            badgeAllBadgeInfo[v.badgeId] = v
            table.insert(badgeAllId, v.badgeId)
          end
        end
        if #badgeAllId > 1 then
          table.sort(badgeAllId, function(a, b)
            return badgeAllData[a].type < badgeAllData[b].type
          end)
        end
      end
      
      function list.itemRenderer(i, badge)
        if badgeAllId[i + 1] then
          local id = badgeAllId[i + 1]
          local badgeData = badgeAllData[id]
          local Icon = badge:GetChild("BadgeIcon")
          UIUtil.SetText(Icon, T(1249, cardInfo.badgeId2Levels[id]), "LevelTxt")
          UIUtil.SetText(Icon, badgeData.name(), "NameTxt")
          Icon:GetChild("IconLoader").url = UIUtil.GetResUrl(badgeData.icon)
          ChangeUIController(Icon, "c1", badgeData.star - 1)
          FormationCardTipsWindow.ShowAttribute(badgeAllBadgeInfo[id], badge:GetChild("adgeAttribute"))
          if suitNum[badgeData.suit_group_id] then
            suitNum[badgeData.suit_group_id] = suitNum[badgeData.suit_group_id] + 1
          else
            suitNum[badgeData.suit_group_id] = 1
            table.insert(suitId, badgeData.suit_group_id)
          end
          ChangeUIController(badge, "c1", 0)
        else
          UIUtil.SetText(badge, T(1320), "WordTxt")
          ChangeUIController(badge, "c1", 1)
        end
      end
      
      list.numItems = 3
      local Suit = badgeCom:GetChild("Suit")
      Suit.visible = #badgeAllId > 0 and true or false
      UIUtil.SetText(Suit, T(1185), "TitleTxt")
      local suitList = Suit:GetChild("AllSuitList")
      
      function suitList.itemRenderer(ii, suitCom)
        local suitGroupData = TableData.GetConfig(suitId[ii + 1], "BaseBadgeSuitGroup")
        if suitGroupData then
          UIUtil.SetText(suitCom, T(1319, suitGroupData.name(), suitNum[suitId[ii + 1]]), "NameTxt")
          local suitDesList = suitCom:GetChild("SuitList")
          
          function suitDesList.itemRenderer(i, suit)
            local suitData = TableData.GetConfig(suitGroupData.suit_id[i + 1], "BaseBadgeSuit")
            if suitData then
              UIUtil.SetText(suit, suitData.des(), "WordTxt")
              if 3 == suitNum[suitId[ii + 1]] then
                ChangeUIController(suit, "c1", 1)
              elseif 2 == suitNum[suitId[ii + 1]] then
                ChangeUIController(suit, "c1", 0 == i and 1 or 0)
              else
                ChangeUIController(suit, "c1", 0)
              end
            else
              ChangeUIController(suit, "c1", 0)
            end
          end
          
          suitDesList.numItems = #suitGroupData.suit_id
          suitDesList:ResizeToFit()
        end
      end
      
      suitList.numItems = #suitId
      suitList:ResizeToFit()
    end
    
    uis.Main.BadgeList.numItems = 1
  end
end

function FormationCardTipsWindow.ShowSkillDetail(id, level)
  curShowSkillId = id
  local wordList = uis.Main.WordList
  if 0 == wordList.numItems then
    wordList:AddItemFromPool()
  end
  local content = wordList:GetChildAt(0)
  local skillLevelUp = TableData.GetConfig(id * 1000 + level, "BaseSkillLevelUp")
  content:GetChild("WordTxt").text = skillLevelUp.des and skillLevelUp.des()
  local cardSkillType = content:GetChild("CardSkillType")
  if cardSkillType then
    local wordTxt = cardSkillType:GetChild("WordTxt")
    local baseConfig = TableData.GetConfig(id, "BaseSkill")
    if baseConfig then
      if baseConfig.type == SKILL_TYPE_ENUM.SMALL then
        ChangeUIController(cardSkillType, "c1", 0)
        wordTxt.text = T(10701)
      elseif baseConfig.type == SKILL_TYPE_ENUM.UNIQUE then
        ChangeUIController(cardSkillType, "c1", 1)
        wordTxt.text = T(10700)
      elseif baseConfig.type == SKILL_TYPE_ENUM.BURST_CARD then
        ChangeUIController(cardSkillType, "c1", 1)
        wordTxt.text = T(1099)
      end
    end
  end
end

function FormationCardTipsWindow.GetBadgeInfoByUid(badgeList, badgeUid)
  for i, v in pairs(badgeList) do
    if v.badgeUid == badgeUid then
      return v
    end
  end
end

local GetSort = function(uid)
  local info
  if cardInfo.badgeInfo then
    info = FormationCardTipsWindow.GetBadgeInfoByUid(cardInfo.badgeInfo, uid)
  else
    info = ActorData.GetBadgeInfoByUid(uid)
  end
  if info then
    local badgeData = TableData.GetConfig(info.badgeId, "BaseBadge")
    if badgeData and badgeData.type then
      return badgeData.type
    end
  end
  return 0
end

function FormationCardTipsWindow.InitBadgeList()
  if cardInfo then
    function uis.Main.BadgeList.itemRenderer(ind, badgeCom)
      local suitNum = {}
      
      local suitId = {}
      local list = badgeCom:GetChild("BadgeList")
      if cardInfo.wearBadgeUids and table.getLen(cardInfo.wearBadgeUids) > 1 then
        table.sort(cardInfo.wearBadgeUids, function(a, b)
          return GetSort(a) < GetSort(b)
        end)
      end
      
      function list.itemRenderer(i, badge)
        if cardInfo.wearBadgeUids and cardInfo.wearBadgeUids[i + 1] then
          local info
          if cardInfo.badgeInfo then
            info = FormationCardTipsWindow.GetBadgeInfoByUid(cardInfo.badgeInfo, cardInfo.wearBadgeUids[i + 1])
          else
            info = ActorData.GetBadgeInfoByUid(cardInfo.wearBadgeUids[i + 1])
          end
          if info then
            local badgeData = TableData.GetConfig(info.badgeId, "BaseBadge")
            local Icon = badge:GetChild("BadgeIcon")
            UIUtil.SetText(Icon, T(1249, info.level), "LevelTxt")
            UIUtil.SetText(Icon, badgeData.name(), "NameTxt")
            Icon:GetChild("IconLoader").url = UIUtil.GetResUrl(badgeData.icon)
            ChangeUIController(Icon, "c1", badgeData.star - 1)
            FormationCardTipsWindow.ShowAttribute(info, badge:GetChild("adgeAttribute"))
            if suitNum[badgeData.suit_group_id] then
              suitNum[badgeData.suit_group_id] = suitNum[badgeData.suit_group_id] + 1
            else
              suitNum[badgeData.suit_group_id] = 1
              table.insert(suitId, badgeData.suit_group_id)
            end
            ChangeUIController(badge, "c1", 0)
          end
        else
          UIUtil.SetText(badge, T(1320), "WordTxt")
          ChangeUIController(badge, "c1", 1)
        end
      end
      
      list.numItems = 3
      local Suit = badgeCom:GetChild("Suit")
      Suit.visible = cardInfo.wearBadgeUids and #cardInfo.wearBadgeUids > 0 and true or false
      UIUtil.SetText(Suit, T(1185), "TitleTxt")
      local suitList = Suit:GetChild("AllSuitList")
      
      function suitList.itemRenderer(ii, suitCom)
        local suitGroupData = TableData.GetConfig(suitId[ii + 1], "BaseBadgeSuitGroup")
        if suitGroupData then
          UIUtil.SetText(suitCom, T(1319, suitGroupData.name(), suitNum[suitId[ii + 1]]), "NameTxt")
          local suitDesList = suitCom:GetChild("SuitList")
          
          function suitDesList.itemRenderer(i, suit)
            local suitData = TableData.GetConfig(suitGroupData.suit_id[i + 1], "BaseBadgeSuit")
            if suitData then
              UIUtil.SetText(suit, suitData.des(), "WordTxt")
              if 3 == suitNum[suitId[ii + 1]] then
                ChangeUIController(suit, "c1", 1)
              elseif 2 == suitNum[suitId[ii + 1]] then
                ChangeUIController(suit, "c1", 0 == i and 1 or 0)
              else
                ChangeUIController(suit, "c1", 0)
              end
            else
              ChangeUIController(suit, "c1", 0)
            end
          end
          
          suitDesList.numItems = #suitGroupData.suit_id
          suitDesList:ResizeToFit()
        end
      end
      
      suitList.numItems = #suitId
      suitList:ResizeToFit()
    end
    
    uis.Main.BadgeList.numItems = 1
  end
end

function FormationCardTipsWindow.ShowAttribute(badgeInfo, attributeCom)
  local main = attributeCom:GetChild("AttributeInfo")
  local mainData = TableData.GetConfig(badgeInfo.mainAttribute, "BaseBadgeAttribute")
  if mainData then
    ChangeUIController(main, "c1", BadgeMgr.mainAttributeCtr[mainData.type])
    UIUtil.SetText(main, BadgeData.GetAttributeNameByInfo(mainData.type), "NameTxt")
    UIUtil.SetText(main, BadgeData.GetAttribute(badgeInfo.attributeLevels[badgeInfo.mainAttribute], badgeInfo.mainAttribute, false), "NumberTxt")
  end
  local sort = BadgeMgr.viceAttributeCtr
  local newViceAttribute = {}
  for i, v in pairs(badgeInfo.viceAttributes) do
    local data = TableData.GetConfig(v, "BaseBadgeAttribute")
    if data then
      table.insert(newViceAttribute, data)
    end
  end
  if #newViceAttribute > 1 then
    table.sort(newViceAttribute, function(a, b)
      return sort[a.type] < sort[b.type]
    end)
  end
  local AttributeList = attributeCom:GetChild("AttributeList")
  
  function AttributeList.itemRenderer(i, item)
    local data = newViceAttribute[i + 1]
    ChangeUIController(item, "c1", sort[data.type])
    UIUtil.SetText(item, BadgeData.GetAttributeNameByInfo(data.type), "NameTxt")
    UIUtil.SetText(item, BadgeData.GetAttribute(badgeInfo.attributeLevels[data.id], data.id, false), "NumberTxt")
  end
  
  AttributeList.numItems = #newViceAttribute
end

function FormationCardTipsWindow.InitBtn()
  uis.Main.TouchScreenBtn.onClick:Add(FormationCardTipsWindow.Close)
end

function FormationCardTipsWindow.Close()
  if closeCallback then
    closeCallback()
    closeCallback = nil
  end
  UIMgr:CloseWindow(WinResConfig.FormationCardTipsWindow.name)
end

function FormationCardTipsWindow.OnShown()
  if uis and cardInfo and cardInfo and cardInfo.uin == ActorData.GetUin() then
    cardInfo = CardData.GetCardDataById(cardInfo.cardId)
    FormationCardTipsWindow.UpdateInfo()
  end
end

function FormationCardTipsWindow.OnClose()
  uis = nil
  contentPane = nil
  curShowSkillId = nil
  page = nil
  allBadges = nil
  cardInfo, closeCallback, params = nil, nil, nil
  sceneType = nil
end

function FormationCardTipsWindow.HandleMessage(msgId, para)
end

return FormationCardTipsWindow
