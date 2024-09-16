RedDotStory = {}

function RedDotStory.HomeTaskRed()
  return RedDotStory.ItemRedDot() or RedDotStory.MonsterRedDot(TableData.GetTable("BaseStoryMonster")) or RedDotStory.MusicRedDot(TableData.GetTable("BaseSound")) or RedDotStory.CGRedDotByTypeData(TableData.GetTable("BaseStoryCg"))
end

function RedDotStory.CGRedDotByTypeData(data)
  for i, v in pairs(data) do
    if RedDotStory.MusicOneShowByChapterId(v.id) then
      return true
    end
  end
end

function RedDotStory.MusicShowByChapterId(id)
  local data = TableData.GetConfig(id, "BaseSoundChapter")
  if data then
    for i = 1, #data.child_ids do
      if RedDotStory.MusicOneShowByChapterId(data.child_ids[i]) then
        return true
      end
    end
  end
end

function RedDotStory.MusicOneShowByChapterId(id)
  if StoryMgr.CheckNewStoryList(id) and not StoryMgr.CheckNew(id) then
    return true
  end
end

function RedDotStory.MusicRedDot(data)
  for i, v in pairs(data) do
    if StoryMgr.CheckNewStoryList(v.id) and not StoryMgr.CheckNew(v.id) then
      return true
    end
  end
end

function RedDotStory.MonsterByCamp(campId)
  local config = TableData.GetTable("BaseStoryMonster")
  local tb = {}
  for i, v in pairs(config) do
    if campId == v.camp_id and RedDotStory.MonsterOneLock(v.id) then
      return true
    end
  end
end

function RedDotStory.MonsterOneLock(id)
  if table.contain(StoryMgr.monsterIds, id) and not StoryMgr.CheckNew(id) then
    return true
  end
end

function RedDotStory.MonsterRedDot(data)
  if data then
    for i, v in pairs(data) do
      if RedDotStory.MonsterOneLock(v.id) then
        return true
      end
    end
  end
end

function RedDotStory.ItemOneLock(id)
  if ActorData.GetItemCount(id) > 0 and not StoryMgr.CheckNew(id) then
    return true
  end
end

function RedDotStory.ItemRedDot()
  local config = TableData.GetTable("BaseItem")
  for i, v in pairs(config) do
    if 106 == v.type and ActorData.GetItemCount(v.id) > 0 and not StoryMgr.CheckNew(v.id) then
      return true
    end
  end
end
