FormationData = {
  bottomGridWidth = 80,
  bottomGridUIWidth = 80,
  rotation = -60,
  bottomGridScale = 1,
  cachedArenaMapList = nil,
  cachedStagePrepareInfo = nil,
  cachedTeamStateLeft = nil,
  cachedTeamStateRight = nil,
  cachedEnemyList = {}
}

function FormationData.Init()
  FormationData.bottomGridScale = FormationData.bottomGridWidth / FormationData.bottomGridUIWidth
end

function FormationData.GetQualifiedCard(curSelectTeamInfo, selectCardTypeMap, selectElementTypeMap, selectCdTypeMap, filterFunc, sceneType, cardList)
  local list
  if cardList then
    list = cardList
  elseif curSelectTeamInfo then
    list = CardData.GetCardListByTeam(curSelectTeamInfo)
  elseif sceneType == ProtoEnum.SCENE_TYPE.ROGUE then
    list = RogueGameData.GetBattleCardInfoList()
  else
    list = ActorData.GetCardList()
  end
  local filterList = {}
  for i, v in ipairs(list) do
    if nil == filterFunc or true == filterFunc(v) then
      table.insert(filterList, v)
    end
  end
  if table.getLen(selectElementTypeMap) > 0 or table.getLen(selectCardTypeMap) > 0 or table.getLen(selectCdTypeMap) > 0 then
    filterList = CardData.GetChoiceListData({
      selectElementTypeMap,
      selectCardTypeMap,
      selectCdTypeMap
    }, filterList)
  end
  if sceneType ~= ProtoEnum.SCENE_TYPE.GUILD_WAR then
    filterList = CardData.GetSortCardList(filterList)
  end
  return filterList
end

function FormationData.GetEmbattledLimitCardNum(arenaMapId)
  local level = ActorData.GetLevel()
  local config = TableData.GetConfig(level, "BasePlayerLevelUp")
  if arenaMapId then
    local arenaMapConfig = TableData.GetConfig(arenaMapId, "BaseArenaMap")
    return math.min(arenaMapConfig.role_num, config.arrange_num)
  end
  local nextId = config.arrange_next_id
  local nextCount
  if nextId then
    local nextConfig = TableData.GetConfig(nextId, "BasePlayerLevelUp")
    nextCount = nextConfig.arrange_num
  end
  return config.arrange_num, config.arrange_next_id, nextCount
end

function FormationData.GetEmbattledLimitBuildingNum()
  local level = ActorData.GetLevel()
  local config = TableData.GetConfig(level, "BasePlayerLevelUp")
  local nextId = config.cost_next_id
  local nextCount
  if nextId then
    local nextConfig = TableData.GetConfig(nextId, "BasePlayerLevelUp")
    nextCount = nextConfig.cost_num
  end
  return config.cost_num, nextId, nextCount
end

function FormationData.GetArenaMap()
  if FormationData.cachedArenaMapList == nil then
    FormationData.cachedArenaMapList = {}
    local allItem = ActorData.GetItems()
    local itemConfig, effectValue, mapConfig
    for _, v in ipairs(allItem) do
      itemConfig = TableData.GetConfig(v.itemId, "BaseItem")
      if itemConfig and itemConfig.type == ProtoEnum.ITEM_TYPE.ARENA_MAP then
        effectValue = tonumber(itemConfig.effect_value)
        mapConfig = TableData.GetConfig(effectValue, "BaseArenaMap")
        table.insert(FormationData.cachedArenaMapList, mapConfig)
      end
    end
  end
  return FormationData.cachedArenaMapList
end

function FormationData.GetOwnBuilding()
  if FormationData.cachedBuildingList == nil then
    FormationData.cachedBuildingList = {}
    local allItem = ActorData.GetItems()
    local itemConfig
    for _, v in ipairs(allItem) do
      itemConfig = TableData.GetConfig(v.itemId, "BaseItem")
      if itemConfig and itemConfig.type == ProtoEnum.ITEM_TYPE.ARENA_BUILDING then
        local buildingId = tonumber(itemConfig.effect_value)
        local configData = TableData.GetConfig(buildingId, "BaseBuilding")
        local isUnlock = true
        local unlockRank = configData.use_rank
        if unlockRank then
          local highestRank = ArenaData.Info.historyHighRank
          if highestRank <= 0 or unlockRank < highestRank then
            isUnlock = false
          end
        end
        table.insert(FormationData.cachedBuildingList, {
          id = buildingId,
          uid = v.itemUid,
          isUnlock = isUnlock,
          unlockRank = unlockRank
        })
      end
    end
  end
  return FormationData.cachedBuildingList
end

function FormationData.GetBuildingByUid(uid)
  local buildingList = FormationData.GetOwnBuilding()
  for _, v in ipairs(buildingList) do
    if v.uid == uid then
      return v
    end
  end
end

function FormationData.SaveBattleTeamState(msg)
  FormationData.cachedTeamStateLeft = msg.teamState1
  FormationData.cachedTeamStateRight = msg.teamState2
  FormationData.guildWarCompensateUid = msg.guildWarCompensateUid
  FormationData.guildWarCompensateTime = msg.guildWarCompensateTime
  FormationData.guildWarAssistCardInfos = msg.guildWarAssistCardInfos
end

function FormationData.IsLimitCardType(cardId, mapId)
  local mapConfig = TableData.GetConfig(mapId, "BaseMap")
  local cardConfig = TableData.GetConfig(cardId, "BaseCard")
  local limitCardType = mapConfig.limit_card_type
  local cardType = cardConfig.type
  if table.contain(limitCardType, cardType) then
    return true
  end
end

function FormationData.SaveStagePrepareInfo(info)
  FormationData.cachedStagePrepareInfo = info
end

function FormationData.GetStagePrepareInfo(sceneType, stageId)
  local cachedStagePrepareInfo = FormationData.cachedStagePrepareInfo
  if nil == cachedStagePrepareInfo then
    return
  end
  if stageId and stageId == cachedStagePrepareInfo.stageId then
    return cachedStagePrepareInfo
  elseif nil == stageId and sceneType == cachedStagePrepareInfo.sceneType then
    return cachedStagePrepareInfo
  end
end

function FormationData.GetChildIndexByGridIndex(curCard2Pos, index)
  local count = 0
  for i, v in pairs(curCard2Pos) do
    if v < index then
      count = count + 1
    end
  end
  return count
end

function FormationData.GetOppositeIndex(curGridIndex, mapId)
  local mapConfig = TableData.GetConfig(mapId, "BaseMap")
  local sizeX = mapConfig.size[1]
  return (sizeX + 1 - math.floor(curGridIndex / 100)) * 100 + curGridIndex % 100
end

function FormationData.GetBadgeList()
  local allBadge = SimpleCopy(ActorData.GetAllBadgeInfo())
  for i, v in ipairs(allBadge) do
    local badgeConfig = TableData.GetConfig(v.badgeId, "BaseBadge")
    v.unlock = EnterClampUtil.TestBadgeCondition(badgeConfig.unlock_level, badgeConfig.unlock_stageId) and 1 or 0
  end
  table.sort(allBadge, function(a, b)
    if a.unlock ~= b.unlock then
      return a.unlock > b.unlock
    elseif a.level ~= b.level then
      return a.level > b.level
    elseif a.grade ~= b.grade then
      return a.grade > b.grade
    else
      local starA = TableData.GetConfig(a.badgeId, "BaseBadge").star
      local starB = TableData.GetConfig(b.badgeId, "BaseBadge").star
      if starA ~= starB then
        return starA > starB
      else
        return a.badgeId > b.badgeId
      end
    end
  end)
  return allBadge
end

function FormationData.UpdateEnemyCache(position, range, unitType, buildingType)
  if buildingType and buildingType ~= BATTLE_BUILDING_TYPE.BLOCK and buildingType ~= BATTLE_BUILDING_TYPE.ATTACK then
    return
  end
  local cachedEnemyList = FormationData.cachedEnemyList
  local enemy = FormationUnit.New(position, range, unitType, buildingType)
  table.insert(cachedEnemyList, enemy)
end

function FormationData.ClearEnemyCache()
  FormationData.cachedEnemyList = {}
end

function FormationData.GetCardDataByUid(cardUid, sceneType)
  if sceneType == ProtoEnum.SCENE_TYPE.GUILD_WAR then
    local card = CardData.GetCardDataByUid(cardUid)
    if card then
      return card
    end
    local assistCardInfos = FormationData.guildWarAssistCardInfos or {}
    for i, v in ipairs(assistCardInfos) do
      if v.cardUid == cardUid then
        return v
      end
    end
  else
    return CardData.GetCardDataByUid(cardUid)
  end
end

function FormationData.GetLeaderSkillInfo(cardInfo, sceneType)
  if sceneType == ProtoEnum.SCENE_TYPE.GUILD_WAR then
    local cardId = cardInfo.cardId
    local cardConfig = TableData.GetConfig(cardId, "BaseCard")
    local leaderSkillId = cardConfig.leader_skill
    local skillBaseConfig = TableData.GetConfig(leaderSkillId, "BaseSkill")
    if cardInfo.quality >= skillBaseConfig.unlock_quality_level then
      return leaderSkillId, 1
    end
  else
    return CardData.GetLeaderSkillInfo(cardInfo)
  end
end

function FormationData.GetRogueEffectFormation()
  ld("Rogue")
  local treasureList = RogueGameData.GetTreasureIdList()
  local effectCardTypeList = {}
  for _, id in ipairs(treasureList) do
    local treasureConfig = TableData.GetConfig(id, "BaseRogueTreasure")
    if 18 == treasureConfig.function_type then
      effectCardTypeList[tonumber(treasureConfig.function_parameter)] = 1
    end
  end
  return effectCardTypeList
end

function FormationData.ClearCacheData()
  FormationData.cachedEnemyList = {}
  FormationData.cachedArenaMapList = nil
  FormationData.cachedTeamStateLeft = nil
  FormationData.cachedTeamStateRight = nil
  FormationData.cachedBuildingList = nil
  FormationData.guildWarCompensateUid = nil
  FormationData.guildWarCompensateTime = nil
  FormationData.guildWarAssistCardInfos = nil
end
