ArenaMgr = {minRank = 2000, DefenseWinId = 11202}
ARENA_ENUM = {
  BATTLE_NUM_ICON = 70010107,
  BATTLE_CD_EXPEND = 70010108,
  BATTLE_CD_WIN = 70010109,
  BATTLE_CD_LOSER = 70010110,
  UPDATE_ENEMY_CD = 70010112
}

function ArenaMgr.UpdateText(title, name, name_en, des)
  title.TitleTxt.text = name
  title.WordTxt.text = des
  title.SubtitleTxt.text = name_en
end

function ArenaMgr.GetRank(rankWord)
  if ArenaData.Info.matchInfo.rank and ArenaData.Info.matchInfo.rank < ArenaMgr.minRank then
    return ArenaData.Info.matchInfo.rank
  end
  if rankWord then
    return T(1157)
  end
  return T(436)
end

function ArenaMgr.GetRobotName(id, name)
  if nil == id or 0 == id then
    return name
  end
  local nameId = tonumber(id)
  if nameId then
    local data = TableData.GetConfig(nameId, "BaseName")
    if data and data.name then
      return data.name()
    end
  end
  return name
end

function ArenaMgr.CheckTime()
  if ArenaData.Info.seasonStat == ProtoEnum.ARENA_SEASON_STAT.DAILY_SETTLE or ArenaData.Info.seasonStat == ProtoEnum.ARENA_SEASON_STAT.SETTLE or ArenaData.Info.seasonStat == ProtoEnum.ARENA_SEASON_STAT.CLOSE or LoginData.GetCurServerTime() >= ArenaData.Info.seasonEndTime then
    return true
  end
end
