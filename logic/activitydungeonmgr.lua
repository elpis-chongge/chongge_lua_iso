ActivityDungeonMgr = {}

function ActivityDungeonMgr.OpenWindow(showId)
  ActivityDungeonData.SaveShowId(showId)
  local data = ActivityDungeonData.GetActivityData()
  if data then
    if 1 == data.show_id then
      OpenWindow(WinResConfig.ActivityDungeonWindow.name)
    elseif 2 == data.show_id then
      OpenWindow(WinResConfig.Activity2DungeonWindow.name)
    elseif 3 == data.show_id then
      OpenWindow(WinResConfig.Activity3DungeonWindow.name)
    end
  end
end

function ActivityDungeonMgr.GetUnlockPlotId()
  local activityInfo = ActivityDungeonData.GetActivityInfo()
  local data = ActivityDungeonData.GetActivityData()
  local storyId = {}
  if activityInfo and data then
    for i = 1, #data.story_id do
      local dataStory = TableData.GetConfig(data.story_id[i], "BaseStory")
      if dataStory then
        local arr = Split(dataStory.open_condition, ":")
        local stageId = tonumber(arr[2])
        if 2 == #arr and tonumber(arr[1]) == CONDITION_ENUM.STAGE and table.contain(activityInfo.finishStages, stageId) then
          table.insert(storyId, dataStory.id)
        end
      end
    end
  end
  return storyId
end

function ActivityDungeonMgr.GetCurDay()
  return TimeUtil.FormatDate("%Y%m%d", LoginData.GetCurServerTime())
end

function ActivityDungeonMgr.SaveDay()
  PlayerPrefsUtil.SetString(PLAYER_PREF_ENUM.ACTIVIVTY_DUNGEON_DAY, ActivityDungeonMgr.GetCurDay())
end

function ActivityDungeonMgr.MergeItemNum(rewards)
  local newReward = {}
  local AddItem = function(drop)
    local isFind = false
    for i, v in ipairs(newReward) do
      if v.item.itemId == drop.item.itemId and v.item.tupleType == ProtoEnum.TUPLE_TYPE.ITEM then
        isFind = true
        newReward[i].item.count = newReward[i].item.count + drop.item.count
        break
      end
    end
    if false == isFind then
      table.insert(newReward, drop)
    end
  end
  for i = 1, #rewards do
    AddItem(rewards[i])
  end
  return newReward
end

function ActivityDungeonMgr.CheckActivityEnd()
  local activityInfo = ActivityDungeonData.GetActivityInfo()
  if activityInfo and LoginData.GetCurServerTime() >= activityInfo.baseInfo.endStamp then
    MessageBox.Show(T(1618), {
      touchCallback = function()
        UIMgr:CloseToWindow(WinResConfig.HomeWindow.name)
      end
    })
  end
end
