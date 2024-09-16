RedDotRaidBoss = {}

function RedDotRaidBoss.TodayHasChallengeCount()
  if not RaidBossMgr.IsInProgress() then
    return false
  end
  local serverTimestamp = LoginData.GetCurServerTime()
  local content = TimeUtil.FormatDate("%Y_%m_%d", serverTimestamp)
  local value = PlayerPrefsUtil.GetString(PLAYER_PREF_ENUM.RAID_BOSS_HAS_CHALLENGE_COUNT, "")
  if content == value then
    return false
  end
  local normal = RaidBossData.GetRemainingChallenges(false)
  local hard = RaidBossData.GetRemainingChallenges(true)
  return normal > 0 or hard > 0
end

function RedDotRaidBoss.IsNewSeason()
  local curSeason = PlayerPrefsUtil.GetInt(PLAYER_PREF_ENUM.RAID_BOSS_SEASON_RECORD, -1)
  if curSeason ~= RaidBossData.GetSeason() then
    return true
  end
end

function RedDotRaidBoss.IsNearlyDeadline()
  local serverTime = LoginData.GetCurServerTime()
  local deadline = RaidBossData.GetDeadline()
  local diff = deadline - serverTime
  local threshold = 172800
  if serverTime < deadline and diff < threshold then
    local deadlineRecord = PlayerPrefsUtil.GetString(PLAYER_PREF_ENUM.RAID_BOSS_DEADLINE, "")
    local date = TimeUtil.FormatDate("%Y_%m_%d", serverTime)
    local concat = string.format("%s_%s", deadline, date)
    if concat ~= deadlineRecord then
      return true, diff
    end
  end
  return false, diff
end

function RedDotRaidBoss.HasAnyRewards()
  local raidBossData = RaidBossData.GetRaidBossData()
  if raidBossData then
    local rewardStages = raidBossData.rewardStages
    local chapter = raidBossData.curChapter
    local conf = TableData.GetConfig(chapter, "BaseChapter")
    if conf then
      local levels = conf.stages
      for _, v in ipairs(levels) do
        local i = type(rewardStages) == "table" and table.keyof(rewardStages, v)
        if type(i) ~= "number" and RaidBossMgr.IsPassed(v) then
          return true
        end
      end
    end
  end
  return false
end
