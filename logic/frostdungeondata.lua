local dungeonInfo
local ChallengeComparer = function(x, y)
  return x.id < y.id
end
local SetLevelTargetList = function(item)
  if item and item.targets and not item.targets_list then
    local map = item.targets
    local list = {}
    local stageId = item.stageId
    local conf = TableData.GetConfig(stageId, "BaseStage")
    for i, v in ipairs(conf.challenge_condition) do
      table.insert(list, {
        id = v,
        state = ProtoEnum.CHALLENGE_STAT_TYPE.CST_NONE,
        star = i > 1
      })
    end
    for k, v in pairs(map) do
      local i = table.keyof(list, k, "id")
      list[i].state = v
    end
    item.targets_list = list
  end
end
local SetFrostDungeonInfo = function(msg)
  dungeonInfo = msg
  if 0 == dungeonInfo.chapterId then
    local tbl = TableData.GetTable("BaseChapter")
    for _, conf in pairs(tbl) do
      if 8 == conf.type then
        dungeonInfo.chapterId = conf.id
        if not dungeonInfo.stages or not _G.next(dungeonInfo.stages) then
          dungeonInfo.stages = dungeonInfo.stages or {}
          dungeonInfo.openStages = dungeonInfo.openStages or {}
          for _, v in ipairs(conf.stages) do
            table.insert(dungeonInfo.openStages, v)
            table.insert(dungeonInfo.stages, {
              stageId = v,
              buffLayer = 0,
              targets = {},
              openStamp = 0,
              score = 0
            })
          end
        end
        break
      end
    end
    dungeonInfo.chapterTarget = 0
  end
  for _, item in pairs(dungeonInfo.stages) do
    SetLevelTargetList(item)
  end
end
local GetFrostDungeonInfo = function()
  return dungeonInfo
end
local GetLevelList = function()
  if not dungeonInfo then
    return
  end
  local chapterId = dungeonInfo.chapterId
  local conf = TableData.GetConfig(chapterId, "BaseChapter")
  if conf then
    return conf.stages
  end
end
local GetLevelChallenges = function(stageId)
  if dungeonInfo then
    local i = table.keyof(dungeonInfo.stages, stageId, "stageId")
    if i then
      local item = dungeonInfo.stages[i]
      if not item.targets_list then
        SetLevelTargetList(item)
      end
      return item.targets_list
    end
  end
end
return {
  SetFrostDungeonInfo = SetFrostDungeonInfo,
  GetFrostDungeonInfo = GetFrostDungeonInfo,
  GetLevelList = GetLevelList,
  GetLevelChallenges = GetLevelChallenges
}
