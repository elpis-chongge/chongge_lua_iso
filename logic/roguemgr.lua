RogueMgr = {difficultyLevel = 0}

function RogueMgr.GetTreasureType(type)
  local data = {
    [1] = T(1404),
    [2] = T(1405),
    [3] = T(1406),
    [4] = T(1407),
    [5] = T(1408),
    [6] = T(1409),
    [7] = T(1410),
    [8] = T(1411)
  }
  return data[type]
end

function RogueMgr.GetTreasureLevel(level)
  local allNum = {
    [1] = T(1412),
    [2] = T(1413),
    [3] = T(1414)
  }
  if allNum[level] then
    return allNum[level]
  end
  return ""
end

function RogueMgr.GetRogueTrendBar()
  local allTrend = RogueData.GetRogueTrend()
  local num = 0
  for i, v in pairs(allTrend) do
    if v.taskInfo and v.unlocked and (v.taskInfo.state == ProtoEnum.TASK_STATE.FINISHED or v.taskInfo.state == ProtoEnum.TASK_STATE.REWARD) then
      num = num + 1
    end
  end
  return num
end

function RogueMgr.ClearNewByType(type)
  RogueService.ClearRoguePicNewStateReq(type, function()
    RogueData.UpdatePicInfoNew(type)
    RogueData.ClearPicNewByType(type)
  end)
end

function RogueMgr.CanMapNew()
  local holyMap = RogueData.GetPicNewByType(ProtoEnum.ROGUE_PIC_TYPE.HOLY)
  local treasureMap = RogueData.GetPicNewByType(ProtoEnum.ROGUE_PIC_TYPE.TREASURE)
  if holyMap and table.getLen(holyMap) > 0 or treasureMap and table.getLen(treasureMap) > 0 then
    return true
  end
end

function RogueMgr.CanEventNew()
  local event = RogueData.GetPicNewByType(ProtoEnum.ROGUE_PIC_TYPE.EVENT)
  if event and table.getLen(event) > 0 then
    return true
  end
end

function RogueMgr.CanEndindNew()
  local ending = RogueData.GetPicNewByType(ProtoEnum.ROGUE_PIC_TYPE.ENDING)
  if ending and table.getLen(ending) > 0 then
    return true
  end
end

function RogueMgr.CanTalentNew()
  local themeInfo = RogueData.GetRogueTheme()
  if themeInfo then
    if themeInfo.running then
      return false
    end
    local PreIsContain = function(pre)
      if pre then
        for i, v in pairs(pre) do
          if table.contain(themeInfo.talentIds, v) == false then
            return false
          end
        end
      end
      return true
    end
    local rogueThemeData = TableData.GetConfig(themeInfo.themeId, "BaseRogueTheme")
    if rogueThemeData then
      local num = ActorData.GetItemCount(rogueThemeData.talent_item)
      local data = TableData.GetTable("BaseRogueTalent")
      for i, v in pairs(data) do
        if table.contain(themeInfo.talentIds, v.id) == false and PreIsContain(v.pre) then
          local costArr = GetConfigItemList(v.cost, true)
          if costArr[1] and num >= costArr[1].value then
            return true
          end
        end
      end
    end
  end
  return false
end

function RogueMgr.GetDifficultyData(groupId, lv)
  if lv and groupId then
    local data = TableData.GetTable("BaseRogueDifficulty")
    for i, v in pairs(data) do
      if groupId == v.group_id and lv == v.level then
        return v
      end
    end
  end
end

function RogueMgr.GetWeekTarget()
  local data = TableData.GetTable("BaseTaskTarget")
  local newTb = {}
  for i, v in pairs(data) do
    if 4 == v.type then
      table.insert(newTb, v)
    end
  end
  table.sort(newTb, function(a, b)
    return a.unlock_points < b.unlock_points
  end)
  return newTb
end
