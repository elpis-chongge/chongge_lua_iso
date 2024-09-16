local GetLevelIndex = function(stageId)
  local list = FrostDungeonData.GetLevelList()
  if list then
    local i = table.keyof(list, stageId)
    return i
  end
  return 0
end
local IsLevelUnlock = function(stageId)
  local info = FrostDungeonData.GetFrostDungeonInfo()
  if info.openStages then
    return table.keyof(info.openStages, stageId)
  end
  return false
end
local IsLevelOpen = function(stageId)
  local info = FrostDungeonData.GetFrostDungeonInfo()
  local stages = info.stages
  local k = table.keyof(stages, stageId, "stageId")
  if k then
    local stageInfo = stages[k]
    local now = LoginData.GetCurServerTime()
    return now >= stageInfo.openStamp, stageInfo.openStamp, stageInfo
  end
end
local GetLevelStars = function(stageId)
  local stars = 0
  local challenges = FrostDungeonData.GetLevelChallenges(stageId)
  if challenges and _G.next(challenges) then
    for k, v in pairs(challenges) do
      if v.state > ProtoEnum.CHALLENGE_STAT_TYPE.CST_NONE and v.star then
        stars = stars + 1
      end
    end
    return stars
  end
end
local GetLevelMaxStars = function(stageId)
  local stars = 0
  local challenges = FrostDungeonData.GetLevelChallenges(stageId)
  if challenges and _G.next(challenges) then
    for k, v in pairs(challenges) do
      if v.star then
        stars = stars + 1
      end
    end
    return stars
  end
end
local GetLevelBuffGrade = function(stageId)
  local info = FrostDungeonData.GetFrostDungeonInfo()
  local stages = info.stages
  local k = table.keyof(stages, stageId, "stageId")
  if k then
    return stages[k].buffLayer
  end
  return 0
end
local GetBuffGrade = function(buffId)
  local info = FrostDungeonData.GetFrostDungeonInfo()
  local stages = info.stages
  local result = 0
  for _, v in ipairs(stages) do
    local stageConf = TableData.GetConfig(v.stageId, "BaseStage")
    if type(stageConf.buff_add) and stageConf.buff_add == buffId then
      result = math.max(v.buffLayer, result)
    end
  end
  return result
end
local IsStarted = function(stageId)
  local info = FrostDungeonData.GetFrostDungeonInfo()
  local i = table.keyof(info.stages, stageId, "stageId")
  if i then
    local timestamp = info.stages[i].openStamp
    local curTimestamp = LoginData.GetCurServerTime()
    if timestamp > curTimestamp then
      return false, timestamp - curTimestamp
    end
    return true
  end
  return false
end
local IsHighestLevel = function(stageId)
  local list = FrostDungeonData.GetLevelList()
  if list then
    return type(stageId) == "number" and list[#list] == stageId
  end
  return false
end
local OnBattleComplete = function(msg)
  local info = FrostDungeonData.GetFrostDungeonInfo()
  local preOpenStages = info.openStages
  local preBuffStages = info.stages
  FrostDungeonService.GetFrostDungeonInfoReq(function(msg)
    local new_stages
    for i, v in ipairs(msg.openStages) do
      if not table.keyof(preOpenStages, v) then
        new_stages = new_stages or {}
        table.insert(new_stages, v)
      end
    end
    local grade_change_stages, star_change_stages
    for i, v in ipairs(msg.stages) do
      local newVal = v.buffLayer
      local k = table.keyof(preBuffStages, v.stageId, "stageId")
      if k then
        local preVal = preBuffStages[k].buffLayer
        if 0 == preVal and preVal ~= newVal then
          grade_change_stages = grade_change_stages or {}
          table.insert(grade_change_stages, v.stageId)
        end
        local preTargets = preBuffStages[k].targets_list
        local newTargets = v.targets
        for j, target in ipairs(preTargets) do
          if target.star and target.state == ProtoEnum.CHALLENGE_STAT_TYPE.CST_NONE and newTargets[target.id] and newTargets[target.id] > target.state then
            star_change_stages = star_change_stages or {}
            local exists = table.keyof(star_change_stages, v.stageId, "stageId")
            if exists then
              table.insert(star_change_stages[exists].stars, j - 1)
            else
              table.insert(star_change_stages, {
                stageId = v.stageId,
                stars = {
                  j - 1
                }
              })
            end
          end
        end
      end
    end
    FrostDungeonMgr.__new_stages = new_stages
    FrostDungeonMgr.__grade_change_stages = grade_change_stages
    FrostDungeonMgr.__star_change_stages = star_change_stages
    if UIMgr:IsWindowOpen(WinResConfig.FrostDungeonWindow.name) then
      UIMgr:SendWindowMessage(WinResConfig.FrostDungeonWindow.name, WindowMsgEnum.FrostDungeonWindow.REFRESH_EFFECT_STATE)
    end
  end)
end
return {
  GetLevelIndex = GetLevelIndex,
  GetLevelStars = GetLevelStars,
  GetLevelMaxStars = GetLevelMaxStars,
  GetLevelBuffGrade = GetLevelBuffGrade,
  GetBuffGrade = GetBuffGrade,
  IsStarted = IsStarted,
  IsLevelUnlock = IsLevelUnlock,
  IsLevelOpen = IsLevelOpen,
  IsHighestLevel = IsHighestLevel,
  OnBattleComplete = OnBattleComplete
}
