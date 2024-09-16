RogueData = {record = nil, taskRefreshStamp = nil}
local rogueInfo
local picInfo = {}
local picNewId = {}
local weekTask = {}
local weekReward = {}

function RogueData.SaveWeekTask(taskList)
  weekTask = taskList
end

function RogueData.GetWeekTask()
  return weekTask
end

function RogueData.SaveWeekReward(reward)
  weekReward = reward
end

function RogueData.GetWeekReward()
  return weekReward
end

function RogueData.GetRogueInfo()
  return rogueInfo
end

function RogueData.GetRogueTheme()
  return rogueInfo.themeInfo
end

function RogueData.GetRogueTrend()
  return rogueInfo.trendInfos
end

function RogueData.GetRogueTrendById(id)
  if rogueInfo.trendInfos then
    for i, v in pairs(rogueInfo.trendInfos) do
      if v.trendId == id then
        return v
      end
    end
  end
end

function RogueData.UpdateThemeInfo(info)
  if info then
    rogueInfo.themeInfo = info
  end
end

function RogueData.UpdateTrendInfos(info)
  if info then
    rogueInfo.trendInfos = info
  end
end

function RogueData.UpdateOneTrendInfos(info)
  for i, v in pairs(rogueInfo.trendInfos) do
    if v.trendId == info.trendId then
      rogueInfo.trendInfos[i] = info
    end
  end
end

function RogueData.SaveRogueInfo(info)
  if info then
    rogueInfo = info
  end
end

local ChallengeTableKey = function(tb)
  local t = {}
  for i, v in pairs(tb) do
    t[v] = v
  end
  return t
end

function RogueData.SavePicInfo(info)
  if info then
    if picInfo[info.picType] == nil then
      picInfo[info.picType] = {}
    end
    picInfo[info.picType] = info
  end
end

function RogueData.UpdatePicInfoNew(type)
  if picInfo and picInfo[type] and picInfo[type].picId2States then
    for i, v in pairs(picInfo[type].picId2States) do
      picInfo[type].picId2States[i] = false
    end
  end
end

function RogueData.GetPicInfoBuyType(type)
  return picInfo[type]
end

function RogueData.SavePicNewId(msg)
  local allType = {
    [ProtoEnum.ROGUE_PIC_TYPE.TREASURE] = msg.newTreasureIds,
    [ProtoEnum.ROGUE_PIC_TYPE.EVENT] = msg.newEventIds,
    [ProtoEnum.ROGUE_PIC_TYPE.ENDING] = msg.newEndingIds,
    [ProtoEnum.ROGUE_PIC_TYPE.HOLY] = msg.newHolyIds
  }
  for i, v in pairs(allType) do
    if nil == picNewId[i] then
      picNewId[i] = {}
    end
    for ii, id in pairs(v) do
      picNewId[i][id] = true
    end
  end
end

function RogueData.GetPicNewByType(type)
  return picNewId[type]
end

function RogueData.ClearPicNewByType(type)
  picNewId[type] = {}
end
