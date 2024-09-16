ArenaData = {defenseFormation = nil}
ArenaData.Rank = nil
ArenaData.Info = nil
ArenaData.records = nil
local cachedBattleRecord = {}

function ArenaData.GetCurArenaLevel()
  if 0 == ArenaData.Info.matchInfo.level then
    return 1
  end
  return ArenaData.Info.matchInfo.level
end

function ArenaData.SaveAllDefenseFormation(msg)
  ld("Formation", function()
    ArenaData.ModifyDefensePos(msg.defenseFormation)
  end)
  ArenaData.defenseFormation = msg.defenseFormation
end

function ArenaData.GetDefenseFormation()
  return ArenaData.defenseFormation
end

function ArenaData.ModifyDefensePos(defenseFormation)
  local arenaMapId = defenseFormation.arenaMapId
  local arenaMapConfig = TableData.GetConfig(arenaMapId, "BaseArenaMap")
  local mapId = arenaMapConfig.map_id
  local cardUid2Pos = defenseFormation.cardUid2Pos or {}
  local buildUid2Pos = defenseFormation.buildUid2Pos or {}
  for uid, pos in pairs(cardUid2Pos) do
    cardUid2Pos[uid] = FormationData.GetOppositeIndex(pos, mapId)
  end
  for uid, pos in pairs(buildUid2Pos) do
    buildUid2Pos[uid] = FormationData.GetOppositeIndex(pos, mapId)
  end
end

function ArenaData.SaveChallengeStageRsp(data)
  ArenaData.challengeStageRsp = data
end

function ArenaData.GetChallengeStageRsp()
  local data = ArenaData.challengeStageRsp
  ArenaData.challengeStageRsp = nil
  return data
end

function ArenaData.ClearBattleRecord()
  cachedBattleRecord = {}
end

function ArenaData.CacheBattleRecord(msg)
  msg.record.battleData = Net.DecodePb("BattleCompleteData", msg.record.data)
  cachedBattleRecord[msg.record.battleUid] = msg.record
end

function ArenaData.GetBattleRecord(battleUid)
  return cachedBattleRecord[battleUid]
end
