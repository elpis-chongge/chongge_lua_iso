StoryMgr = {
  storyList = {},
  musicData = {},
  plotData = {},
  cgData = {},
  monsterIds = {}
}

function StoryMgr.GetMonsterName(type)
  if 0 == type then
    return T(795)
  elseif 1 == type then
    return T(793)
  elseif 2 == type then
    return T(80300003)
  elseif 3 == type then
    return T(789)
  elseif 4 == type then
    return T(1350)
  end
end

function StoryMgr.SaveMonsterId(ids)
  if ids then
    StoryMgr.monsterIds = ids
  end
end

function StoryMgr.SaveStoryId(ids)
  if StoryMgr.clickedStoryEventId == nil then
    StoryMgr.clickedStoryEventId = {}
  end
  for i, v in pairs(ids) do
    StoryMgr.clickedStoryEventId[v] = true
  end
end

function StoryMgr.SaveStoryEventId(id)
  if id and StoryMgr.clickedStoryEventId[id] == nil then
    StoryMgr.clickedStoryEventId[id] = true
  end
end

function StoryMgr.CheckNew(id)
  if StoryMgr.clickedStoryEventId and id then
    return StoryMgr.clickedStoryEventId[id]
  end
end

function StoryMgr.SaveEventNewReq(ids)
  local new = {}
  for i, v in pairs(ids) do
    if not StoryMgr.CheckNew(v) then
      table.insert(new, v)
    end
  end
  if #new > 0 then
    StoryService.ClickStoryEventReportReq(new, function()
      for i, v in pairs(new) do
        StoryMgr.SaveStoryEventId(v)
      end
      RedDotMgr.UpdateNode(RED_DOT_DATA_TYPE.STORY)
    end)
  end
end

function StoryMgr.InitTab(data, list, callBack, initIndex)
  if #data > 0 and list and callBack then
    local index = initIndex or 0
    list.selectedIndex = -1
    
    function list.itemRenderer(i, item)
      UIUtil.SetText(item, data[i + 1].name(), "WordTxt")
      UIUtil.SetText(item, data[i + 1].name_english(), "SubtitleTxt")
      UIUtil.SetText(item, LuaUtil.FormatNum(i + 1, "00"), "NumberTxt")
      item.soundFmod = SOUND_EVENT_ENUM.COMMON_TAG_ON_CLICK
      item.onClick:Set(function()
        if list.selectedIndex ~= i then
          list.selectedIndex = i
          if callBack then
            callBack(data[i + 1])
          end
        end
      end)
      if i == index then
        item.onClick:Call()
        list:ScrollToView(i)
      end
    end
    
    list.numItems = #data
  end
end

function StoryMgr.CheckNewStoryList(id)
  if StoryMgr.storyList[id] then
    return true
  end
end

function StoryMgr.UnlockByData(data)
  if StoryMgr.storyList[data.id] then
    return true
  end
  if data.child_ids then
    for i = 1, #data.child_ids do
      if StoryMgr.storyList[data.child_ids[i]] then
        return true
      end
    end
  end
end

function StoryMgr.GetMusicNum(data)
  if data.child_ids then
    local num = 0
    for i = 1, #data.child_ids do
      if StoryMgr.storyList[data.child_ids[i]] then
        num = num + 1
      end
    end
    return T(746, num, #data.child_ids)
  end
end

function StoryMgr.GetUnlockData(data)
  local t = {}
  for i, v in ipairs(data) do
    if StoryMgr.storyList[v] then
      table.insert(t, v)
    end
  end
  return t
end

function StoryMgr.InitData()
  StoryMgr.storyList = ActorData.GetStoryList()
  StoryMgr.musicData = StoryMgr.GetMusicData()
  StoryMgr.plotData = StoryMgr.GetPlotData()
  StoryMgr.cgData = StoryMgr.GetCgData()
end

function StoryMgr.GetUnlockId(id)
  local storyData = TableData.GetConfig(id, "BaseStory")
  local arr = Split(storyData.open_condition, ":")
  if 2 == #arr then
    if tonumber(arr[1]) == 70020100 and ActorData.GetLevel() >= tonumber(arr[2]) then
      return -1
    elseif tonumber(arr[1]) == 70020200 then
      return tonumber(arr[2])
    end
  end
end

function StoryMgr.GetPlotData()
  local t = {}
  local info = AdventureData.GetSceneData(ProtoEnum.SCENE_TYPE.MAIN_LINE)
  if info then
    local stageId = info.currentStage
    local chapterId = info.currentChapter
    if 0 == stageId then
      local chapterData = TableData.GetConfig(chapterId, "BaseChapter")
      if chapterData then
        stageId = chapterData.stages[#chapterData.stages] + 1
      end
    end
    local config = TableData.GetTable("BaseStoryChapter")
    t.activityData = {}
    t.mainData = {}
    local unlockId, unlockChapter
    for _, v in pairs(config) do
      unlockChapter = false
      for i = 1, #v.child_ids do
        unlockId = StoryMgr.GetUnlockId(v.child_ids[i])
        if unlockId and stageId > unlockId then
          StoryMgr.storyList[v.child_ids[i]] = 0
          if false == unlockChapter then
            if 1 == v.type then
              table.insert(t.mainData, v)
            elseif 2 == v.type then
              table.insert(t.activityData, v)
            end
            unlockChapter = true
          end
        else
          break
        end
      end
    end
    if #t.activityData > 1 then
      table.sort(t.activityData, function(a, b)
        return a.sort < b.sort
      end)
    end
    if #t.mainData > 1 then
      table.sort(t.mainData, function(a, b)
        return a.sort < b.sort
      end)
    end
  end
  return t
end

function StoryMgr.GetMusicData()
  local config = TableData.GetTable("BaseSoundChapter")
  local tb = {}
  for i, v in pairs(config) do
    table.insert(tb, v)
  end
  if #tb > 1 then
    table.sort(tb, function(a, b)
      return a.sort < b.sort
    end)
  end
  return tb
end

function StoryMgr.GetMonsterDataByCampId(id)
  local config = TableData.GetTable("BaseStoryMonster")
  local tb = {}
  local num = 0
  local totalNum = 0
  for i, v in pairs(config) do
    if id == v.camp_id then
      if tb[v.type] == nil then
        tb[v.type] = {}
      end
      v.lock = table.contain(StoryMgr.monsterIds, v.id)
      table.insert(tb[v.type], v)
      if v.lock then
        num = num + 1
      end
      totalNum = totalNum + 1
    end
  end
  for i, v in pairs(tb) do
    table.sort(v, StoryMgr.SortLock)
  end
  return tb, T(746, num, totalNum), num > 0
end

function StoryMgr.SortLock(a, b)
  if a.lock and not b.lock then
    return true
  elseif not a.lock and b.lock then
    return false
  else
    return a.sort < b.sort
  end
end

function StoryMgr.GetPlotItem()
  local config = TableData.GetTable("BaseItem")
  local tb = {}
  local lock = {}
  for i, v in pairs(config) do
    if 106 == v.type then
      table.insert(tb, v)
      lock[v.id] = ActorData.GetItemCount(v.id) > 0
    end
  end
  if #tb > 1 then
    table.sort(tb, function(a, b)
      if lock[a.id] and not lock[b.id] then
        return true
      elseif not lock[a.id] and lock[b.id] then
        return false
      elseif a.sort and b.sort then
        return a.sort < b.sort
      end
    end)
  end
  return tb
end

function StoryMgr.GetCgData()
  local config = TableData.GetTable("BaseStoryCg")
  local t = {}
  t.activityData = {}
  t.activityMax = 0
  t.mainData = {}
  t.mainMax = 0
  t.otherData = {}
  t.otherMax = 0
  t.mainLock = {}
  t.activityLock = {}
  t.otherLock = {}
  for i, v in pairs(config) do
    if 1 == v.type then
      t.mainMax = t.mainMax + 1
      if StoryMgr.UnlockByData(v) then
        t.mainLock[v.id] = true
      end
      table.insert(t.mainData, v)
    elseif 2 == v.type then
      t.activityMax = t.activityMax + 1
      if StoryMgr.UnlockByData(v) then
        t.activityLock[v.id] = true
      end
      table.insert(t.activityData, v)
    elseif 3 == v.type then
      t.otherMax = t.otherMax + 1
      if StoryMgr.UnlockByData(v) then
        t.otherLock[v.id] = true
      end
      table.insert(t.otherData, v)
    end
  end
  if #t.activityData > 1 then
    table.sort(t.activityData, function(a, b)
      return a.sort < b.sort
    end)
  end
  if #t.mainData > 1 then
    table.sort(t.mainData, function(a, b)
      return a.sort < b.sort
    end)
  end
  if #t.otherData > 1 then
    table.sort(t.otherData, function(a, b)
      return a.sort < b.sort
    end)
  end
  return t
end
