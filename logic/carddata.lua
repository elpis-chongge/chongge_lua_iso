CardData = {tempSkillLv = 0}
CARD_SROT_TYPE = {STRENGRTH = 0, RARITY = 1}
local ownFashions = {}
local tempSortData = {}
local cardJumpSkill = {}

function CardData.InitCardJumpSkillData()
  cardJumpSkill = {}
  local str = PlayerPrefsUtil.GetString(PLAYER_PREF_ENUM.CARD_JUMP)
  if "" ~= str then
    cardJumpSkill = Json.decode(str)
  end
end

function CardData.SaveJump(cardId)
  if not table.contain(cardJumpSkill, cardId) then
    table.insert(cardJumpSkill, cardId)
    local str = Json.encode(cardJumpSkill)
    PlayerPrefsUtil.SetString(PLAYER_PREF_ENUM.CARD_JUMP, str)
  end
end

function CardData.RemoveJump(cardId)
  if table.contain(cardJumpSkill, cardId) then
    for i = #cardJumpSkill, 1, -1 do
      if cardJumpSkill[i] == cardId then
        table.remove(cardJumpSkill, i)
      end
    end
    local str = Json.encode(cardJumpSkill)
    PlayerPrefsUtil.SetString(PLAYER_PREF_ENUM.CARD_JUMP, str)
  end
end

function CardData.CanJump(cardId)
  return table.contain(cardJumpSkill, cardId)
end

function CardData.CanOpenBadge(quality)
  local allCard = ActorData.GetCardList()
  for i, v in pairs(allCard) do
    if quality <= v.quality then
      return true
    end
  end
  return false
end

function CardData.SaveDetailsSortData(data)
  tempSortData = data
end

function CardData.GetDetailsSortData()
  return tempSortData
end

function CardData.ClearDetailsSortData()
  tempSortData = nil
end

function CardData.SaveFashion(msg)
  ownFashions = msg.ownFashions
end

function CardData.SaveOneFashion(fashionId)
  if nil == ownFashions[fashionId] then
    ownFashions[fashionId] = LoginData.GetCurServerTime()
  end
end

function CardData.GetAllFashion()
  return ownFashions
end

function CardData.FashionIsContain(fashionId)
  return ownFashions[fashionId]
end

function CardData.CreateClientUnit(monsterId)
  local unit = {
    uid = 0,
    uin = 0,
    id = 0,
    pos = 0,
    level = 0,
    quality = 0,
    grade = 0,
    fashionId = nil,
    skill2Level = {},
    rank = nil
  }
  if monsterId then
    local monsterConfig = TableData.GetConfig(monsterId, "BaseMonster")
    unit.id = monsterId
    unit.level = monsterConfig.level
    unit.quality = monsterConfig.quality
    unit.grade = monsterConfig.grade
    unit.fashionId = monsterConfig.fashion_id
    unit.skill2Level = CardData.GetConfigSkill(monsterConfig)
    unit.rank = monsterConfig.rank
  end
  return unit
end

function CardData.GetCardSkillFromConfig(cardId, quality, grade)
  local skill2Level = {}
  local skillList = {}
  local cardConfig = TableData.GetConfig(cardId, "BaseCard")
  quality = quality or cardConfig.quality
  grade = grade or cardConfig.grade
  if cardConfig.normal_skill then
    skill2Level[cardConfig.normal_skill] = 0
    table.insert(skillList, {
      id = cardConfig.normal_skill,
      level = 0
    })
  end
  local cardGradeConfig = CardData.GetCardGradeUpConfig(cardId, grade)
  if cardGradeConfig.unique_skill then
    skill2Level[cardGradeConfig.unique_skill] = cardGradeConfig.unique_skill_level
    table.insert(skillList, {
      id = cardGradeConfig.unique_skill,
      level = cardGradeConfig.unique_skill_level
    })
  end
  if cardGradeConfig.special_skill then
    skill2Level[cardGradeConfig.special_skill] = cardGradeConfig.special_skill_level
    table.insert(skillList, {
      id = cardGradeConfig.special_skill,
      level = cardGradeConfig.special_skill_level
    })
  end
  local unlockSkillByGrade = CardData.GetGradeUnlockSkill(cardId, grade)
  for i, v in ipairs(unlockSkillByGrade) do
    skill2Level[v.id] = v.level
    table.insert(skillList, v)
  end
  local unlockSkillByQuality = CardData.GetQualityUnlockSkill(cardId, quality)
  for i, v in ipairs(unlockSkillByQuality) do
    skill2Level[v.id] = v.level
    table.insert(skillList, v)
  end
  return skill2Level, skillList
end

function CardData.GetGradeUnlockSkill(cardId, grade)
  local unlockSkill = {}
  local allSkill = {}
  local cardConfig = TableData.GetConfig(cardId, "BaseCard")
  for i = cardConfig.grade, cardConfig.grade_max do
    local gradeConfig = CardData.GetCardGradeUpConfig(cardId, i)
    if gradeConfig.unlock_skill_id and 0 ~= gradeConfig.unlock_skill_id then
      if i <= grade then
        table.insert(unlockSkill, {
          id = gradeConfig.unlock_skill_id,
          level = gradeConfig.unlock_skill_level
        })
      end
      table.insert(allSkill, {
        id = gradeConfig.unlock_skill_id,
        level = gradeConfig.unlock_skill_level,
        isUnlock = i <= grade
      })
    end
  end
  return unlockSkill, allSkill
end

function CardData.GetQualityUnlockSkill(cardId, quality)
  local unlockSkill = {}
  local allSkill = {}
  local cardConfig = TableData.GetConfig(cardId, "BaseCard")
  for i = cardConfig.quality, cardConfig.quality_max do
    local qualityConfig = CardData.GetCardQualityUpConfig(cardId, i)
    if qualityConfig.unlock_skill_id and 0 ~= qualityConfig.unlock_skill_id then
      if i <= quality then
        table.insert(unlockSkill, {
          id = qualityConfig.unlock_skill_id,
          level = qualityConfig.unlock_skill_level
        })
      end
      table.insert(allSkill, {
        id = qualityConfig.unlock_skill_id,
        level = qualityConfig.unlock_skill_level,
        isUnlock = i <= quality
      })
    end
  end
  return unlockSkill, allSkill
end

function CardData.GetConfigSkill(config)
  local skill2Level = {}
  local skillList = {}
  if config.ex_skill then
    for _, skillId in ipairs(config.ex_skill) do
      skill2Level[skillId] = 0
      table.insert(skillList, {id = skillId, level = 1})
    end
  end
  if config.unique_skill then
    for _, skillId in ipairs(config.unique_skill) do
      skill2Level[skillId] = 0
      table.insert(skillList, {id = skillId, level = 1})
    end
  end
  if config.special_skill then
    for _, skillId in ipairs(config.special_skill) do
      skill2Level[skillId] = 0
      table.insert(skillList, {id = skillId, level = 1})
    end
  end
  if config.normal_skill then
    skill2Level[config.normal_skill] = 0
    table.insert(skillList, {
      id = config.normal_skill,
      level = 1
    })
  end
  if config.passive_skill then
    for _, skillId in ipairs(config.passive_skill) do
      skill2Level[skillId] = 0
      table.insert(skillList, {id = skillId, level = 1})
    end
  end
  return skill2Level, skillList
end

local t_sort = table.sort

function CardData.CalculatorCardAttr(cardData, params)
  local id = cardData.cardId or cardData.id
  local level = cardData.level
  local quality = cardData.quality
  local skill2Level = cardData.skill2Level
  if nil == skill2Level and cardData.skillLevels then
    skill2Level = {}
    local skillLevels = cardData.skillLevels
    for i, v in ipairs(skillLevels) do
      skill2Level[v.skillId] = v.level
    end
  end
  local attributes = {}
  local baseConfig, isMonster, isBuilding = CardData.GetBaseConfig(id)
  if true == isBuilding then
    if baseConfig.monster_id then
      baseConfig = TableData.GetConfig(baseConfig.monster_id, "BaseMonster")
    else
      return {}
    end
  end
  local cardLevelConfig, cardQualityConfig, levelUpAddAttrs, qualityUpAddAttrs, skillAttrs
  if false == isMonster and false == isBuilding then
    cardLevelConfig = CardData.GetCardLevelUpConfig(baseConfig.grow_model_id, level)
    cardQualityConfig = CardData.GetCardQualityUpConfig(id, quality)
    levelUpAddAttrs = GetAddAttrList(cardLevelConfig.add_attr)
    qualityUpAddAttrs = GetAddAttrList(cardQualityConfig.add_attr)
    skillAttrs = CardData.GetSkillAddAttrList(skill2Level)
  end
  local baseAttributeConfig = TableData.GetTable("BaseAttribute")
  local attrValue = 0
  local attrValuePer = 0
  local hpAttrId = ProtoEnum.ATTR_ID.HP
  local mathCeil = math.ceil
  for _, v in pairs(baseAttributeConfig) do
    local attrId = v.id
    if attrId ~= hpAttrId then
      if true == isMonster or true == isBuilding then
        attrValue = baseConfig[v.name] or 0
      else
        attrValue = (baseConfig[v.name] or 0) + (levelUpAddAttrs[attrId] and levelUpAddAttrs[attrId].value or 0) + (qualityUpAddAttrs[attrId] and qualityUpAddAttrs[attrId].value or 0) + (skillAttrs[attrId] and skillAttrs[attrId].value or 0)
        attrValuePer = (levelUpAddAttrs[attrId] and levelUpAddAttrs[attrId].valuePer or 0) + (qualityUpAddAttrs[attrId] and qualityUpAddAttrs[attrId].valuePer or 0) + (skillAttrs[attrId] and skillAttrs[attrId].valuePer or 0)
      end
      if 0 ~= attrValuePer then
        attributes[attrId] = mathCeil(attrValue * (10000 + attrValuePer) / 10000)
      else
        attributes[attrId] = attrValue
      end
    end
  end
  local badgeAttributes = cardData.badgeAttributes
  if badgeAttributes and #badgeAttributes > 0 then
    local tempList, tempId, tempAttrValuePer, tempAttrValue
    for _, v in ipairs(badgeAttributes) do
      tempList = Split(v, ":")
      if 3 == #tempList then
        tempId = tonumber(tempList[1])
        tempAttrValue = tonumber(tempList[2])
        tempAttrValuePer = tonumber(tempList[3])
        if nil == attributes[tempId] then
          attributes[tempId] = 0
        end
        if 0 ~= tempAttrValuePer then
          attributes[tempId] = mathCeil(attributes[tempId] * (10000 + tempAttrValuePer) / 10000)
        end
        if 0 ~= tempAttrValue then
          attributes[tempId] = attributes[tempId] + tempAttrValue
        end
      end
    end
  end
  local rogueData = params and params.rogueData
  if true == isMonster and rogueData and rogueData.difficultyId then
    local rogueDifficultyConfig = TableData.GetConfig(rogueData.difficultyId, "BaseRogueDifficulty")
    if rogueDifficultyConfig then
      local monsterAttribute = rogueDifficultyConfig.monster_attribute
      if monsterAttribute then
        local attrList = GetAddAttrList(monsterAttribute)
        for attrId, v in pairs(attrList) do
          attributes[attrId] = math.ceil(attributes[attrId] * (v.valuePer / 10000))
        end
      end
      local bossMonsterAttribute = rogueDifficultyConfig.boss_monster_attribute
      if bossMonsterAttribute then
        local chapterId = rogueData.chapterId
        if chapterId then
          local chapterConfig = TableData.GetConfig(chapterId, "BaseRogueChapter")
          if chapterConfig and chapterConfig.layer_index >= 5 then
            local difficultyId = rogueData.difficultyId
            if difficultyId then
              local attrList = GetAddAttrList(bossMonsterAttribute)
              for attrId, v in pairs(attrList) do
                attributes[attrId] = math.ceil(attributes[attrId] * (v.valuePer / 10000))
              end
            end
          end
        end
      end
      if baseConfig.rank and baseConfig.rank >= 2 then
        local stageId = params.stageId
        if stageId then
          local stageConfig = TableData.GetConfig(stageId, "BaseStage")
          local rogue_difficulty_field = stageConfig.rogue_difficulty_field
          if rogue_difficulty_field then
            local encounterMonsterAttribute = rogueDifficultyConfig[rogue_difficulty_field]
            if encounterMonsterAttribute then
              local attrList = GetAddAttrList(encounterMonsterAttribute)
              for attrId, v in pairs(attrList) do
                attributes[attrId] = math.ceil(attributes[attrId] * (v.valuePer / 10000))
              end
            end
          end
        end
      end
    end
  end
  if rogueData and false == isMonster then
    local rogueTalentIds = rogueData.rogueTalentIds
    if rogueTalentIds and #rogueTalentIds > 0 then
      local attrList = {}
      for _, talentId in ipairs(rogueTalentIds) do
        local talentConfig = TableData.GetConfig(talentId, "BaseRogueTalent")
        if talentConfig and talentConfig.add_attr then
          local tempList = GetAddAttrList(talentConfig.add_attr)
          MergeTable(attrList, tempList)
        end
      end
      for attrId, v in pairs(attrList) do
        if 0 ~= v.valuePer then
          attributes[attrId] = mathCeil(attributes[attrId] * (10000 + v.valuePer) / 10000)
        end
        if 0 ~= v.value then
          attributes[attrId] = attributes[attrId] + v.value
        end
      end
    end
  end
  if false == isMonster then
    local rogueAttributes
    if params and params.rogueAttributes then
      rogueAttributes = params.rogueAttributes
    else
      rogueAttributes = cardData.rogueAttributes
    end
    if rogueAttributes and #rogueAttributes > 0 then
      local tempList, tempId, tempAttrValuePer, tempAttrValue
      for _, v in ipairs(rogueAttributes) do
        tempList = Split(v, ":")
        if 3 == #tempList then
          tempId = tonumber(tempList[1])
          tempAttrValue = tonumber(tempList[2])
          tempAttrValuePer = tonumber(tempList[3])
          if nil == attributes[tempId] then
            attributes[tempId] = 0
          end
          if 0 ~= tempAttrValuePer then
            attributes[tempId] = mathCeil(attributes[tempId] * (10000 + tempAttrValuePer) / 10000)
          end
          if 0 ~= tempAttrValue then
            attributes[tempId] = attributes[tempId] + tempAttrValue
          end
        end
      end
    end
  end
  attributes[hpAttrId] = attributes[ProtoEnum.ATTR_ID.MAX_HP]
  return attributes
end

function CardData.CalculatorCardAttrForRogue(rogueCardInfo, rogueTalentIds, containAttrEnhance)
  local cardInfo = SimpleCopy(rogueCardInfo.info)
  if containAttrEnhance then
    cardInfo.rogueAttributes = rogueCardInfo.rogueAttributes
  end
  return CardData.CalculatorCardAttr(cardInfo, {rogueTalentIds = rogueTalentIds})
end

function CardData.GetBaseConfig(id)
  local config, isMonster, isBuilding = nil, false, false
  config = TableData.GetConfig(id, "BaseCard", true)
  if nil == config then
    config = TableData.GetConfig(id, "BaseMonster", true)
    if nil == config then
      config = TableData.GetConfig(id, "BaseBuilding", true)
      if config then
        isBuilding = true
      end
    else
      isMonster = true
    end
  end
  if nil == config then
    printError("未找到对应角色配置", id)
  end
  return config, isMonster, isBuilding
end

function CardData.GetCardLevelUpConfig(type, level)
  local id = type * 1000 + level
  local config = TableData.GetConfig(id, "BaseCardLevelUp")
  if nil == config then
    printError("未找到对应卡牌升级配置", id)
  end
  return config
end

function CardData.GetCardLevelUpCostConfig(type, level)
  local id = type * 1000 + level
  local config = TableData.GetConfig(id, "BaseCardLevelUpCost")
  if nil == config then
    printError("未找到对应卡牌升级配置", id)
  end
  return config
end

function CardData.GetCardGradeUpConfig(id, grade)
  if id and grade then
    local index = id * 1000 + grade
    local config = TableData.GetConfig(index, "BaseCardGradeUp")
    if nil == config then
      printError("未找到对应卡牌觉醒配置", id)
    end
    return config
  end
end

function CardData.GetCardQualityUpConfig(id, quality)
  if id and quality then
    local index = id * 1000 + quality
    local config = TableData.GetConfig(index, "BaseCardQualityUp")
    if nil == config then
      printError("未找到对应卡牌突破配置", id)
    end
    return config
  end
end

function CardData.GetSkillAddAttrList(skill2Level)
  local skillLevelUpConfig = TableData.GetTable("BaseSkillLevelUp")
  local config
  local attrList = {}
  local tempList
  for skillId, skillLevel in pairs(skill2Level) do
    config = skillLevelUpConfig[skillId * 1000 + skillLevel]
    if config then
      tempList = GetAddAttrList(config.add_attr)
      MergeTable(attrList, tempList)
    end
  end
  return attrList
end

function CardData.GetCardDataById(cardId)
  local cardList = ActorData.GetCardList()
  for _, v in ipairs(cardList) do
    if v.cardId == cardId then
      return v
    end
  end
end

function CardData.GetCardDataByUid(cardUid)
  local cardList = ActorData.GetCardList()
  for _, v in ipairs(cardList) do
    if v.cardUid == cardUid then
      return v
    end
  end
end

function CardData.GetSortCardList(cardList)
  cardList = cardList or ActorData.GetCardList()
  t_sort(cardList, CardData.DefaultSort)
  local t = {}
  for i, v in pairs(cardList) do
    table.insert(t, v)
  end
  return t
end

function CardData.GetSortCardListByStar(cardList)
  cardList = cardList or ActorData.GetCardList()
  t_sort(cardList, CardData.SortByCardStar)
  local t = {}
  for i, v in pairs(cardList) do
    table.insert(t, v)
  end
  return t
end

function CardData.DefaultSortWithType(a, b)
  local aData = CardData.GetBaseConfig(a.cardId)
  local bData = CardData.GetBaseConfig(b.cardId)
  if aData.type ~= bData.type then
    return aData.type < bData.type
  else
    return CardData.DefaultSort(a, b)
  end
end

function CardData.DefaultSort(a, b)
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

function CardData.SortByCardStar(a, b)
  local aData = CardData.GetBaseConfig(a.cardId)
  local bData = CardData.GetBaseConfig(b.cardId)
  if aData.star and bData.star then
    if aData.star == bData.star then
      if a.level == b.level then
        return a.cardId > b.cardId
      else
        return a.level > b.level
      end
    else
      return aData.star > bData.star
    end
  end
end

local CheckCdTime = function(configData, cdChoiceInfo, choice)
  if not choice then
    return true
  end
  if configData then
    local skillData = TableData.GetConfig(configData.burst_skill, "BaseSkill")
    if skillData and skillData.cd and cdChoiceInfo[skillData.cd] then
      return true
    end
  end
end
local CheckOccupation = function(configData, choiceInfo, choice)
  if not choice then
    return true
  end
  if configData and configData.type and choiceInfo[configData.type] then
    return true
  end
end
local CheckElement = function(configData, choiceInfo, choice)
  if not choice then
    return true
  end
  if configData and configData.element_type and choiceInfo[configData.element_type[1]] then
    return true
  end
end

function CardData.GetChoiceListData(data, cardList)
  if data then
    cardList = cardList or ActorData.GetCardList()
    local configData
    local tb = {}
    local isChoice, elementBol, occupationBol, cdBol
    for i, v in pairs(data[1]) do
      if v then
        elementBol = true
        break
      end
    end
    for i, v in pairs(data[2]) do
      if v then
        occupationBol = true
        break
      end
    end
    if data[3] then
      for i, v in pairs(data[3]) do
        if v then
          cdBol = true
          break
        end
      end
    end
    if elementBol or cdBol or elementBol then
      isChoice = true
    end
    for _, v in ipairs(cardList) do
      configData = CardData.GetBaseConfig(v.cardId)
      if CheckElement(configData, data[1], elementBol) and CheckOccupation(configData, data[2], occupationBol) and CheckCdTime(configData, data[3], cdBol) then
        table.insert(tb, v)
      end
    end
    return tb, isChoice
  end
end

function CardData.GetCardStarDebrisNum(cardId)
  local data = TableData.GetConfig(cardId, "BaseCardGradeUp")
  if data then
    local tb = GetConfigItemList(data.cost)
    for i, v in pairs(tb) do
      if v.id ~= COMMON_ITEM_ID.GAME_COIN then
        return ActorData.GetItemCount(v.id)
      end
    end
  end
  return 0
end

function CardData.GetCardListByTeam(teamInfo)
  local list = {}
  if teamInfo then
    local ids = teamInfo.cardIds
    local card
    for _, id in ipairs(ids) do
      card = CardData.GetCardDataById(id)
      table.insert(list, card)
    end
  end
  return list
end

function CardData.GetMonsterFashionConfig(monsterId)
  if nil == monsterId then
    return
  end
  local monsterConfig = TableData.GetConfig(monsterId, "BaseMonster")
  local fashionId = monsterConfig.fashion_id
  return TableData.GetConfig(fashionId, "BaseFashion"), monsterConfig
end

function CardData.GetCardGradeLv(cardId)
  local cardInfo = CardData.GetCardDataById(cardId)
  if cardInfo then
    return cardInfo.grade
  end
end

function CardData.GetMonsterRankName(rank)
  return T(80300001 + rank)
end

function CardData.GetSkillTypeName(skillType, color, isMonster)
  if skillType == SKILL_TYPE_ENUM.NORMAL then
    return T(10801)
  elseif skillType == SKILL_TYPE_ENUM.SMALL then
    if isMonster then
      return T(10807)
    else
      return color and T(1144) or T(10802)
    end
  elseif skillType == SKILL_TYPE_ENUM.UNIQUE then
    if isMonster then
      return T(10808)
    else
      return T(10803)
    end
  elseif skillType == SKILL_TYPE_ENUM.PASSIVE then
    if isMonster then
      return T(10809)
    else
      return T(10804)
    end
  elseif skillType == SKILL_TYPE_ENUM.EX then
    if isMonster then
      return T(10809)
    else
      return T(10806)
    end
  elseif skillType == SKILL_TYPE_ENUM.BURST_CARD then
    return T(1084)
  elseif skillType == SKILL_TYPE_ENUM.BURST then
  elseif skillType == SKILL_TYPE_ENUM.LEADER then
    return T(1309)
  end
end

function CardData.GetFormatNum(num)
  if 1 == num then
    return T(903)
  elseif 2 == num then
    return T(904)
  elseif 3 == num then
    return T(905)
  end
end

function CardData.GetElementTxt(elementType)
  if nil == elementType then
    return ""
  end
  local type = elementType[1]
  if type == BATTLE_UNIT_ELEMENT_TYPE.WATER then
    return T(611)
  elseif type == BATTLE_UNIT_ELEMENT_TYPE.FIRE then
    return T(612)
  elseif type == BATTLE_UNIT_ELEMENT_TYPE.WOOD then
    return T(613)
  elseif type == BATTLE_UNIT_ELEMENT_TYPE.DARK then
    return T(614)
  elseif type == BATTLE_UNIT_ELEMENT_TYPE.LIGHT then
    return T(615)
  end
  return ""
end

function CardData.GetOccupationTxt(occupation)
  if 1 == occupation then
    return T(616)
  elseif 2 == occupation then
    return T(617)
  elseif 4 == occupation then
    return T(619)
  elseif 5 == occupation then
    return T(620)
  end
end

function CardData.SortTeamCardList(card2posList)
  local cardList = {}
  local cardData, cardId, cardConfig, isMonster, isBuilding
  for cardUid, pos in pairs(card2posList) do
    cardData = CardData.GetCardDataByUid(cardUid)
    cardId = cardData.cardId
    cardConfig, isMonster, isBuilding = CardData.GetBaseConfig(cardId)
    table.insert(cardList, {
      cardData = cardData,
      cardId = cardId,
      posX = math.floor(pos / 100),
      posY = pos % 100,
      type = false == isBuilding and cardConfig.type or 999
    })
  end
  table.sort(cardList, function(a, b)
    if a.type ~= b.type then
      return a.type < b.type
    elseif a.posX == b.posX then
      return a.posY < b.posY
    else
      return a.posX > b.posX
    end
  end)
  return cardList
end

function CardData.GetBadgeAddAttribute(cardId)
  local cardInfo = cardId and CardData.GetCardDataById(cardId) or CardMgr.cardInfoData
  local add = {}
  if cardInfo then
    for i, v in pairs(cardInfo.badgeAttributes) do
      local arr = Split(v, ":")
      if 3 == #arr then
        local id = tonumber(arr[1])
        local cardAttribute = cardInfo.attributes[id] or 0
        add[id] = math.ceil(cardAttribute * (tonumber(arr[3]) / 10000)) + tonumber(arr[2])
      end
    end
  end
  return add
end

function CardData.GetLeaderSkillInfo(cardInfo)
  local skill2Level = cardInfo.skill2Level
  return CardData.GetLeaderSkillInfoFromSkill2Level(skill2Level)
end

function CardData.GetLeaderSkillInfoFromSkill2Level(skill2Level)
  if skill2Level then
    local leaderSkillType = SKILL_TYPE_ENUM.LEADER
    for skillId, skillLevel in pairs(skill2Level) do
      local skillConfig = TableData.GetConfig(skillId, "BaseSkill")
      if skillConfig.type == leaderSkillType then
        return skillId, skillLevel
      end
    end
  end
end
