RedDotAbyss = {}
local inspectedGrids, inspectedTreasures

function RedDotAbyss.Init()
  local str = PlayerPrefsUtil.GetString(PLAYER_PREF_ENUM.ABYSS_SHOP_INSPECTED_ITEMS, "")
  if string.isEmptyOrNil(str) then
    inspectedGrids = {}
  else
    inspectedGrids = Json.decode(str)
  end
  str = PlayerPrefsUtil.GetString(PLAYER_PREF_ENUM.ABYSS_TREASURE_RECORDS, "")
  if string.isEmptyOrNil(str) then
    inspectedTreasures = {}
  else
    inspectedTreasures = Json.decode(str)
  end
end

function RedDotAbyss.SaveInspectedGrid(gridId, write)
  if not table.contain(inspectedGrids, gridId) then
    table.insert(inspectedGrids, gridId)
    if write then
      PlayerPrefsUtil.SetString(PLAYER_PREF_ENUM.ABYSS_SHOP_INSPECTED_ITEMS, Json.encode(inspectedGrids))
    end
  end
end

function RedDotAbyss.SaveInspectedGrids()
  PlayerPrefsUtil.SetString(PLAYER_PREF_ENUM.ABYSS_SHOP_INSPECTED_ITEMS, Json.encode(inspectedGrids))
end

function RedDotAbyss.Inspected(gridId)
  return table.contain(inspectedGrids, gridId)
end

local hasnewgoods = function(shopType)
  local shopInfo = ShopData.shopInfo[shopType]
  if shopInfo then
    local goods = shopInfo.goods
    local flag = false
    for _, v in pairs(goods) do
      if v.unlocked then
        local gridId = v.gridId
        local exists, _ = table.contain(inspectedGrids, gridId)
        if not exists then
          flag = true
        end
        if 3 == shopType then
          local conf = TableData.GetConfig(v.goodsId, "BaseShopPool")
          local gridConf = TableData.GetConfig(gridId, "BaseShopGrid")
          if type(conf.sell_price_type) == "number" and 1 == conf.sell_price_type and "number" == type(gridConf.sell_limit_time) then
            local remainBoughtNum = math.min(gridConf.sell_limit_time - v.boughtNum, shopInfo.manorFreeCount)
            flag = flag or remainBoughtNum > 0
          end
        end
      end
    end
    return flag
  end
  return false
end

function RedDotAbyss.HasNewGoods()
  return hasnewgoods(3) or hasnewgoods(4)
end

function RedDotAbyss.HasNewGoodsWithShopType(shopType)
  return hasnewgoods(shopType)
end

local hasnewtreasures = function(treasures)
  for _, evt in pairs(treasures) do
    local key = table.keyof(inspectedTreasures, evt.eventId, "id")
    if key then
      if 0 == evt.finishTimestamp and evt.resetTimestamp > inspectedTreasures[key].timestamp then
        return true
      end
    elseif 0 == evt.finishTimestamp then
      return true
    end
  end
  return false
end
local eventsBuffer
local regionlist = {
  2,
  6,
  5
}
local EventFilter_UnlockedRegionTreasure = function(eventInfo)
  local type, subtype = eventInfo.type, eventInfo.subtype
  if (type == AbyssExploreEventID.POSITIVE or type == AbyssExploreEventID.DAILY_RANDOM or type == AbyssExploreEventID.DAILY_RANDOM_NEWBIE) and subtype == AbyssExploreSubEventID.TREASURE then
    local regionId = AbyssExploreMgr.GetRegionId(eventInfo.x, eventInfo.y)
    if AbyssExploreMgr.RegionIsUnlock(regionId) then
      return table.contain(regionlist, regionId)
    end
    return false
  end
  return false
end

function RedDotAbyss.HasNewTreasures()
  eventsBuffer = eventsBuffer or {}
  AbyssExploreData.GetEvents(EventFilter_UnlockedRegionTreasure, eventsBuffer)
  local result = hasnewtreasures(eventsBuffer)
  table.clear(eventsBuffer)
  return result
end

local EventFilter_SpecialUnlockedRegionTreasure = function(eventInfo, regionId)
  local type, subtype = eventInfo.type, eventInfo.subtype
  if (type == AbyssExploreEventID.POSITIVE or type == AbyssExploreEventID.DAILY_RANDOM or type == AbyssExploreEventID.DAILY_RANDOM_NEWBIE) and subtype == AbyssExploreSubEventID.TREASURE and AbyssExploreMgr.RegionIsUnlock(regionId) and AbyssExploreMgr.GetRegionId(eventInfo.x, eventInfo.y) == regionId then
    return true
  end
  return false
end

function RedDotAbyss.HasNewTreasuresWithRegionId(regionId)
  eventsBuffer = eventsBuffer or {}
  AbyssExploreData.GetEvents(EventFilter_SpecialUnlockedRegionTreasure, eventsBuffer, regionId)
  local result = hasnewtreasures(eventsBuffer)
  table.clear(eventsBuffer)
  return result
end

function RedDotAbyss.SaveInspectedTreasure(eventInfo, write)
  local regionId = AbyssExploreMgr.GetRegionId(eventInfo.x, eventInfo.y)
  local unlock = AbyssExploreMgr.RegionIsUnlock(regionId)
  if unlock then
    if 0 == eventInfo.finishTimestamp then
      local key = table.keyof(inspectedTreasures, eventInfo.eventId, "id")
      if not key then
        table.insert(inspectedTreasures, {
          id = eventInfo.eventId,
          timestamp = eventInfo.resetTimestamp
        })
      else
        inspectedTreasures[key].timestamp = eventInfo.resetTimestamp
      end
    end
    if write then
      local str = Json.encode(inspectedTreasures)
      PlayerPrefsUtil.SetString(PLAYER_PREF_ENUM.ABYSS_TREASURE_RECORDS, str)
    end
  end
end

function RedDotAbyss.BossChallengeIsNew()
  local unlocked = EnterClampUtil.WhetherToEnter(FEATURE_ENUM.ADVENTURE_BOSS, false)
  local guide = PlayerPrefsUtil.GetInt(PLAYER_PREF_ENUM.ABYSS_GUIDE_BOSS_CHALLENGE, -1)
  return unlocked and guide < 0
end

function RedDotAbyss.ExpeditionIsNew()
  local unlocked = EnterClampUtil.WhetherToEnter(FEATURE_ENUM.ADVENTURE_DREAMLAND, false)
  local guide = PlayerPrefsUtil.GetInt(PLAYER_PREF_ENUM.ABYSS_GUIDE_EXPEDITION, -1)
  return unlocked and guide < 0
end

function RedDotAbyss.BuildingIsNew()
  local unlocked = EnterClampUtil.WhetherToEnter(FEATURE_ENUM.TIDE_DUNGEON, false)
  local guide = PlayerPrefsUtil.GetInt(PLAYER_PREF_ENUM.ABYSS_GUIDE_BUILDING, -1)
  return unlocked and guide < 0
end

function RedDotAbyss.RoguelikeIsNew()
  local unlocked = EnterClampUtil.WhetherToEnter(FEATURE_ENUM.ADVENTURE_ROGUE, false)
  local guide = PlayerPrefsUtil.GetInt(PLAYER_PREF_ENUM.ABYSS_GUIDE_ROGUE, -1)
  return unlocked and guide < 0
end

function RedDotAbyss.FrostDungeonIsNew()
  local unlocked = EnterClampUtil.WhetherToEnter(FEATURE_ENUM.FROST_DUNGEON, false)
  local guide = PlayerPrefsUtil.GetInt(PLAYER_PREF_ENUM.ABYSS_GUIDE_FROSTDUNGEON, -1)
  return unlocked and guide < 0
end

function RedDotAbyss.HasNewFunction()
  return RedDotAbyss.BossChallengeIsNew() or RedDotAbyss.RoguelikeIsNew() or RedDotAbyss.BuildingIsNew()
end

function RedDotAbyss.TideDungeonHasAnyRewardsByType(dungeonType)
  local info = TideDungeonData.GetTideDungeonInfo(dungeonType)
  if info and info.inOpenTime then
    local stage = info.currentStage
    local chapterConf = TableData.GetConfig(info.currentChapter, "BaseChapter")
    local stages = chapterConf.stages
    local rewardedStages = info.rewardedStages
    local stageIndex = 0
    if stage > 0 then
      for i, v in ipairs(stages) do
        if stage == v then
          stageIndex = i
          break
        end
      end
    else
      stageIndex = 4
    end
    local rewardable = false
    for i = 1, stageIndex - 1 do
      if rewardedStages then
        if not table.keyof(rewardedStages, stages[i]) then
          rewardable = true
          break
        end
      else
        rewardable = true
        break
      end
    end
    return rewardable
  end
end

function RedDotAbyss.TideDungeonHasAnyRewards()
  for i, v in pairs(AbyssTideDungeon) do
    if RedDotAbyss.TideDungeonHasAnyRewardsByType(v) then
      return true
    end
  end
end
