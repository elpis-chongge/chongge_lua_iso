RedDotArena = {}

function RedDotArena.ShowHome()
  if ArenaData.Info and ArenaData.Info.highRank and ArenaData.Info.rewardPhase and EnterClampUtil.WhetherToEnter(FEATURE_ENUM.ADVENTURE_ARENA, false) then
    local config = TableData.GetTable("BaseArenaRankReward")
    for i, v in pairs(config) do
      if v.phase == ArenaData.Info.rewardPhase and ArenaData.Info.highRank <= v.rank_low and not table.contain(ArenaData.Info.rewardList, v.id) then
        return true
      end
    end
  end
  return false
end

function RedDotArena.ShowArenaDefense()
  return RedDotArena.ArenaDefenseMapNew() or RedDotArena.ArenaDefenseBuildingNew() or RedDotArena.ArenaDefenseEnterNew()
end

function RedDotArena.ArenaDefenseEnterNew()
  return GuideData.CanShowCaption(ArenaMgr.DefenseWinId)
end

function RedDotArena.ArenaDefenseMapNew()
  local allItem = ActorData.GetItems()
  for _, v in ipairs(allItem) do
    if RedDotArena.ArenaOneMapNew(v.itemId) then
      return true
    end
  end
  return false
end

function RedDotArena.ArenaDefenseBuildingNew()
  local allItem = ActorData.GetItems()
  for _, v in ipairs(allItem) do
    if RedDotArena.ArenaOneBuildingNew(v.itemId) then
      return true
    end
  end
  return false
end

function RedDotArena.ArenaOneMapNew(itemId, mapConfig)
  ld("Arena")
  if ArenaData.Info == nil then
    return false
  end
  if nil == mapConfig then
    local itemConfig = TableData.GetConfig(itemId, "BaseItem")
    if itemConfig and itemConfig.type == ProtoEnum.ITEM_TYPE.ARENA_MAP then
      local effectValue = tonumber(itemConfig.effect_value)
      mapConfig = TableData.GetConfig(effectValue, "BaseArenaMap")
    end
  end
  if nil == mapConfig then
    return false
  end
  if 1 ~= mapConfig.initial_tag or mapConfig.use_rank then
    if mapConfig.use_rank then
      local highestRank = ArenaData.Info.historyHighRank
      return highestRank > 0 and highestRank <= mapConfig.use_rank and OprRecordUtil.IsAlreadyRecord(PLAYER_OPERATION_ENUM.ARENA_MAP_NEW, mapConfig.id) == false
    end
    return true
  end
  return false
end

function RedDotArena.ArenaOneBuildingNew(itemId, buildingConfig)
  ld("Arena")
  if ArenaData.Info == nil then
    return false
  end
  if nil == buildingConfig then
    local itemConfig = TableData.GetConfig(itemId, "BaseItem")
    if itemConfig and itemConfig.type == ProtoEnum.ITEM_TYPE.ARENA_BUILDING then
      local buildingId = tonumber(itemConfig.effect_value)
      buildingConfig = TableData.GetConfig(buildingId, "BaseBuilding")
    end
  end
  if nil == buildingConfig then
    return false
  end
  if 1 ~= buildingConfig.initial_tag or buildingConfig.use_rank then
    if buildingConfig.use_rank then
      local highestRank = ArenaData.Info.historyHighRank
      return highestRank > 0 and highestRank <= buildingConfig.use_rank and OprRecordUtil.IsAlreadyRecord(PLAYER_OPERATION_ENUM.ARENA_BUILDING_NEW, buildingConfig.id) == false
    end
    return true
  end
  return false
end
