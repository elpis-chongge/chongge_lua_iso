RedDotGuildWar = {}
local TodayHasFightCount = function()
  ld("GuildWar")
  local scheduleInfo = GuildWarData.GetGuildScheduleInfo()
  if scheduleInfo and scheduleInfo.state == ProtoEnum.GuildWarState.GWS_FIGHT then
    local lastTimestamp = PlayerPrefsUtil.GetFloat(PLAYER_PREF_ENUM.GUILD_WAR_TODAY_HAS_FIGHT_COUNT, 0)
    local timestamp = LoginData.GetCurServerTime()
    local day, lastDay = math.floor(timestamp / 86400), math.floor(lastTimestamp / 86400)
    if day > lastDay then
      local playerInfo = GuildWarData.GetGuildPlayerInfo()
      if playerInfo then
        local fightCnt = playerInfo.fightCount
        local maxFightCnt = TableData.GetConfig(70011405, "BaseFixed").int_value
        return fightCnt < maxFightCnt
      end
    end
  end
  return false
end

function RedDotGuildWar.CanShowHome()
  local scheduleInfo = GuildWarData.GetGuildScheduleInfo()
  if scheduleInfo and scheduleInfo.state == ProtoEnum.GuildWarState.GWS_FIGHT then
    return RedDotGuildWar.CanTask() or TodayHasFightCount()
  end
end

function RedDotGuildWar.CanTask()
  local taskListData = GuildWarData.GetGuildTaskInfo()
  if taskListData then
    for i, v in pairs(taskListData) do
      if v.state == ProtoEnum.TASK_STATE.FINISHED then
        return true
      end
    end
  end
end

RedDotGuildWar.TodayHasFightCount = TodayHasFightCount
