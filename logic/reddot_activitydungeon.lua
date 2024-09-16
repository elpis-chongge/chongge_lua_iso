RedDotActivityDungeon = {}

function RedDotActivityDungeon.CanShowHome(showId)
  return RedDotActivityDungeon.CanMaterialRed(showId) or RedDotActivityDungeon.CanHomePass(showId) or RedDotActivityDungeon.CanTask(showId) or RedDotActivityDungeon.CanSgin(showId)
end

function RedDotActivityDungeon.CanTask(showId)
  if ActivityDungeonData then
    local activityInfo = ActivityDungeonData.GetActivityInfo(showId)
    if activityInfo then
      for i, v in pairs(activityInfo.taskList) do
        if v.state == ProtoEnum.TASK_STATE.FINISHED then
          return true
        end
      end
    end
  end
end

local GetMaxDay = function(showId)
  local data = ActivityDungeonData.GetActivityData(showId)
  if data and data.check_in_id then
    local allSign = TableData.GetTable("BaseActivityCheckIn")
    local max = 0
    for i, v in pairs(allSign) do
      if v.type == data.check_in_id then
        max = math.max(max, v.day)
      end
    end
    return max
  end
end

function RedDotActivityDungeon.CanSgin(showId)
  if ActivityDungeonData then
    local activityInfo = ActivityDungeonData.GetActivityInfo(showId)
    if activityInfo and activityInfo.curDay > 0 then
      local max = GetMaxDay()
      if max then
        max = math.min(max, activityInfo.curDay)
        for i = 1, max do
          if table.contain(activityInfo.signDay, i) == false then
            return true
          end
        end
      end
    end
  end
end

function RedDotActivityDungeon.CanHomePass(showId)
  return RedDotActivityDungeon.CanReward(showId) or RedDotActivityDungeon.DailyTaskComplete(showId)
end

function RedDotActivityDungeon.CanReward(showId)
  if PassportData then
    local info = PassportData.GetActivityPassport(showId)
    if info then
      local GetReward = function(passId)
        for _, vv in pairs(info.rewards) do
          if vv.passId == passId then
            return vv
          end
        end
      end
      for i, v in pairs(info.openList) do
        local infoReward = GetReward(v)
        infoReward = infoReward or {
          rewardLvs = {}
        }
        if table.getLen(infoReward.rewardLvs) < info.lv then
          return true
        end
      end
    end
  end
end

function RedDotActivityDungeon.DailyTaskComplete(showId)
  if PassportData then
    local info = PassportData.GetActivityPassport(showId)
    if info then
      local data = TableData.GetConfig(info.passPortId, "BaseBattlePassport")
      if data and data.level_max > info.lv and 2 == data.group_id then
        for i, vv in pairs(info.dailyTask) do
          if vv.state == ProtoEnum.TASK_STATE.FINISHED then
            return true
          end
        end
      end
    end
    return false
  end
end

function RedDotActivityDungeon.CanMaterialRed(showId)
  if ActivityDungeonData then
    local activityInfo = ActivityDungeonData.GetActivityInfo(showId)
    if activityInfo and activityInfo.creamCount > 0 then
      local configData = ActivityDungeonData.GetActivityData(showId)
      if configData and configData.cream_chapter_ids then
        local arr = Split(configData.cream_chapter_ids, ":")
        if 3 == #arr and table.contain(activityInfo.finishStages, tonumber(arr[2])) then
          local str = PlayerPrefsUtil.GetString(PLAYER_PREF_ENUM.ACTIVIVTY_DUNGEON_DAY)
          if string.isEmptyOrNil(str) or ActivityDungeonMgr.GetCurDay() ~= str then
            return true
          end
        end
      end
    end
  end
end

function RedDotActivityDungeon.CanDailyNew(showId)
  if ActivityDungeonData then
    local activityInfo = ActivityDungeonData.GetActivityInfo(showId)
    local time = LoginData.GetCurServerTime()
    for i, v in pairs(activityInfo.normalChapter) do
      if v <= time then
        local chapterData = TableData.GetConfig(i, "BaseChapter")
        if chapterData then
          if chapterData.pre == nil or 0 == chapterData.pre then
            if AdventureData.CanShowStageNew(i) then
              return true
            end
          else
            local preChapterData = TableData.GetConfig(chapterData.pre, "BaseChapter")
            if preChapterData then
              local endStage = preChapterData.stages[#preChapterData.stages]
              if table.contain(activityInfo.finishStages, endStage) and AdventureData.CanShowStageNew(i) then
                return true
              end
            end
          end
        end
      end
    end
  end
end

function RedDotActivityDungeon.CanBossNew(showId)
  if ActivityDungeonData then
    local activityInfo = ActivityDungeonData.GetActivityInfo(showId)
    if activityInfo then
      local configData = ActivityDungeonData.GetActivityData(showId)
      if configData and configData.boss_chapter_ids then
        local arr = Split(configData.boss_chapter_ids, ":")
        if 2 == #arr and table.contain(activityInfo.finishStages, tonumber(arr[2])) then
          local time = LoginData.GetCurServerTime()
          for i, v in pairs(activityInfo.bossChapter) do
            local chapterData = TableData.GetConfig(i, "BaseChapter")
            if chapterData then
              for index = 1, #chapterData.stages do
                if not table.contain(activityInfo.finishStages, chapterData.stages[index]) then
                  local stageData = TableData.GetConfig(chapterData.stages[index], "BaseStage")
                  if stageData and (stageData.unlock_time == nil or time >= activityInfo.baseInfo.startStamp + stageData.unlock_time) and (nil == stageData.pre or 0 == stageData.pre or table.contain(activityInfo.finishStages, stageData.pre)) and AdventureData.CanShowStageNew(stageData.id) then
                    return true
                  end
                end
              end
            end
          end
        end
      end
    end
  end
end

function RedDotActivityDungeon.MiniGame1_TaskRewardable()
  if Activity1_MiniGameData then
    local info = Activity1_MiniGameData.GetMiniGameInfo()
    if info then
      for i, v in pairs(info.taskList) do
        if v.state == ProtoEnum.TASK_STATE.FINISHED then
          return true
        end
      end
    end
  end
end

function RedDotActivityDungeon.MiniGame1_DailyTaskRewardable()
  if Activity1_MiniGameData then
    local info = Activity1_MiniGameData.GetMiniGameInfo()
    if info then
      local rewarded = info.miniDailyStat >= ProtoEnum.TASK_STATE.REWARD
      local finished = info.miniDailyStat >= ProtoEnum.TASK_STATE.FINISHED
      return finished and not rewarded
    end
  end
end

function RedDotActivityDungeon.MiniGame2_TaskRewardable()
  if Activity2_MiniGameData then
    local info = Activity2_MiniGameData.GetMiniGameInfo()
    if info then
      for i, v in pairs(info.taskList) do
        if v.state == ProtoEnum.TASK_STATE.FINISHED then
          return true
        end
      end
    end
  end
end

function RedDotActivityDungeon.MiniGame2_DailyTaskRewardable()
  if Activity2_MiniGameData then
    local info = Activity2_MiniGameData.GetMiniGameInfo()
    if info then
      local rewarded = info.miniDailyStat >= ProtoEnum.TASK_STATE.REWARD
      local finished = info.miniDailyStat >= ProtoEnum.TASK_STATE.FINISHED
      return finished and not rewarded
    end
  end
end

function RedDotActivityDungeon.MiniGame3_TaskRewardable()
  if Activity3_MiniGameData then
    local info = Activity3_MiniGameData.GetMiniGameInfo()
    if info then
      for i, v in pairs(info.taskList) do
        if v.state == ProtoEnum.TASK_STATE.FINISHED then
          return true
        end
      end
    end
  end
end

function RedDotActivityDungeon.MiniGame3_DailyTaskRewardable()
  if Activity3_MiniGameData then
    local info = Activity3_MiniGameData.GetMiniGameInfo()
    if info then
      local rewarded = info.miniDailyStat >= ProtoEnum.TASK_STATE.REWARD
      local finished = info.miniDailyStat >= ProtoEnum.TASK_STATE.FINISHED
      return finished and not rewarded
    end
  end
end
