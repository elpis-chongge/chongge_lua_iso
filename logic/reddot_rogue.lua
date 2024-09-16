RedDotRogue = {}
local HasNesTreasure = function()
  local themeInfo = RogueGameData.GetThemeInfo()
  local startTimestamp = themeInfo.startTime
  local themeId = themeInfo.themeId
  local jsonStr = PlayerPrefsUtil.GetString(PLAYER_PREF_ENUM.ROGUE_GAME_TREASURE, "", themeId)
  local o
  if not string.isEmptyOrNil(jsonStr) then
    o = Json.decode(jsonStr)
  end
  local treasureIdList = RogueGameData.GetTreasureIdList()
  if o and o.timestamp == startTimestamp and o.items and _G.next(o.items) then
    for i, v in ipairs(treasureIdList) do
      if not table.keyof(o.items, v) then
        return true
      end
    end
  else
    return #treasureIdList > 0
  end
end
local HasNewHalidom = function()
  local themeInfo = RogueGameData.GetThemeInfo()
  local startTimestamp = themeInfo.startTime
  local themeId = themeInfo.themeId
  local jsonStr = PlayerPrefsUtil.GetString(PLAYER_PREF_ENUM.ROGUE_GAME_HALIDOM, "", themeId)
  local o
  if not string.isEmptyOrNil(jsonStr) then
    o = Json.decode(jsonStr)
  end
  local halidomIdList = RogueGameData.GetHalidomIdList()
  if o and o.timestamp == startTimestamp and o.items and _G.next(o.items) then
    for i, v in ipairs(halidomIdList) do
      if not table.keyof(o.items, v) then
        return true
      end
    end
  else
    return #halidomIdList > 0
  end
end
local SaveTreasureIdList = function()
  local themeInfo = RogueGameData.GetThemeInfo()
  local themeId = themeInfo.themeId
  local treasureIdList = RogueGameData.GetTreasureIdList()
  local o = {
    timestamp = themeInfo.startTime,
    items = treasureIdList
  }
  PlayerPrefsUtil.SetString(PLAYER_PREF_ENUM.ROGUE_GAME_TREASURE, Json.encode(o), themeId)
end
local SaveHalidomIdList = function()
  local themeInfo = RogueGameData.GetThemeInfo()
  local themeId = themeInfo.themeId
  local halidomIdList = RogueGameData.GetHalidomIdList()
  local o = {
    timestamp = themeInfo.startTime,
    items = halidomIdList
  }
  PlayerPrefsUtil.SetString(PLAYER_PREF_ENUM.ROGUE_GAME_HALIDOM, Json.encode(o), themeId)
end
local CanLevelReward = function()
  local themeInfo = RogueData.GetRogueTheme()
  if themeInfo then
    return themeInfo.level > themeInfo.rewardedLevel
  end
end
local CanTrendTaskReward = function()
  local task = RogueData.GetRogueTrend()
  if task then
    for i, v in pairs(task) do
      if v.unlocked and v.taskInfo and v.taskInfo.state == ProtoEnum.TASK_STATE.FINISHED then
        return true
      end
    end
  end
end
local CanWeekIntegralReward = function()
  local integralId = TableData.GetConfig(70010039, "BaseFixed").int_value
  local targetData = RogueMgr.GetWeekTarget()
  local weekReward = RogueData.GetWeekReward()
  local integral = ActorData.GetItemCount(integralId)
  if integral and weekReward and targetData then
    for i, v in pairs(targetData) do
      if integral >= v.unlock_points and not table.contain(weekReward, v.id) then
        return true
      end
    end
  end
end
local CanWeekTaskReward = function()
  local task = RogueData.GetWeekTask()
  if task then
    for i, v in pairs(task) do
      if v.state == ProtoEnum.TASK_STATE.FINISHED then
        return true
      end
    end
  end
end
local CanTaskReward = function()
  return CanWeekTaskReward() or CanWeekIntegralReward() or CanTrendTaskReward()
end
RedDotRogue.HasNesTreasure = HasNesTreasure
RedDotRogue.HasNewHalidom = HasNewHalidom
RedDotRogue.SaveTreasureIdList = SaveTreasureIdList
RedDotRogue.SaveHalidomIdList = SaveHalidomIdList
RedDotRogue.CanLevelReward = CanLevelReward
RedDotRogue.CanTaskReward = CanTaskReward
RedDotRogue.CanTrendTaskReward = CanTrendTaskReward
RedDotRogue.CanWeekIntegralReward = CanWeekIntegralReward
RedDotRogue.CanWeekTaskReward = CanWeekTaskReward
