BattleRecord = {}
local record = {}
local enableRecord = false

function BattleRecord.SetEnableRecord(enable)
  enableRecord = enable
end

function BattleRecord.Init()
  if true ~= enableRecord then
    return
  end
  record = {
    replayBasic = {mapId = nil, time = nil},
    unitInitList = {},
    unitUpdateList = {},
    bulletInitList = {},
    bulletUpdateList = {},
    skillInitList = {},
    skillUpdateList = {},
    hurtDisplayList = {},
    rageDisplayList = {},
    buffWordsDisplayList = {},
    buffEffectDisplayList = {}
  }
end

function BattleRecord.SaveBasic(mapId, time)
  if true ~= enableRecord then
    return
  end
  if mapId then
    record.replayBasic.mapId = mapId
  end
  if time then
    record.replayBasic.time = time
  end
end

function BattleRecord.SaveUnitInit(params)
  if true ~= enableRecord then
    return
  end
  local unitInit = {
    uid = params.uid,
    hp = params.hp,
    max_hp = params.max_hp,
    rage = params.rage,
    max_rage = params.max_rage,
    position = params.position
  }
  table.insert(record.unitInitList, unitInit)
end

function BattleRecord.SaveUnitUpdate(params)
  if true ~= enableRecord then
    return
  end
  local frame = BattleControl.curFixedFrame
  record.unitUpdateList[frame] = record.unitUpdateList[frame] or {}
  local savedUpdate = record.unitUpdateList[frame][params.uid] or {}
  local unitUpdate = {
    uid = params.uid,
    position = params.position or savedUpdate.position,
    modelTimeScale = params.modelTimeScale or savedUpdate.modelTimeScale,
    state = params.state or savedUpdate.state
  }
  record.unitUpdateList[frame][params.uid] = unitUpdate
end

function BattleRecord.SaveHurtDisplayList(params)
  if true ~= enableRecord then
    return
  end
  local frame = BattleControl.curFixedFrame
  record.hurtDisplayList[frame] = record.hurtDisplayList[frame] or {}
  local display = {
    uid = params.uid,
    num = params.num,
    displayType = params.displayType,
    hurtEffect = params.displayType,
    hurtExtraParams = params.hurtExtraParams
  }
  table.insert(record.hurtDisplayList[frame], display)
end

function BattleRecord.SaveRageDisplayList(params)
  if true ~= enableRecord then
    return
  end
  local frame = BattleControl.curFixedFrame
  record.rageDisplayList[frame] = record.rageDisplayList[frame] or {}
  local display = {
    uid = params.uid,
    num = params.num
  }
  table.insert(record.rageDisplayList[frame], display)
end

function BattleRecord.SaveBuffWordsDisplayList(params)
  if true ~= enableRecord then
    return
  end
  local frame = BattleControl.curFixedFrame
  record.buffWordsDisplayList[frame] = record.buffWordsDisplayList[frame] or {}
  local display = {
    uid = params.uid,
    path = params.path
  }
  table.insert(record.buffWordsDisplayList[frame], display)
end

function BattleRecord.SaveBuffEffectDisplayList(params)
  if true ~= enableRecord then
    return
  end
  local frame = BattleControl.curFixedFrame
  record.buffEffectDisplayList[frame] = record.buffEffectDisplayList[frame] or {}
  local display = {
    uid = params.uid,
    name = params.name,
    path = params.path,
    type = params.type
  }
  table.insert(record.buffEffectDisplayList[frame], display)
end

function BattleRecord.SaveBulletInit(params)
  if true ~= enableRecord then
    return
  end
  local bulletInit = {
    uid = params.uid,
    resourcePath = params.resourcePath
  }
  table.insert(record.bulletInitList, bulletInit)
end

function BattleRecord.SaveBulletUpdate(params)
  if true ~= enableRecord then
    return
  end
  local bulletUpdate = {
    position = params.position,
    scale = params.scale
  }
  table.insert(record.bulletUpdateList, bulletUpdate)
end

function BattleRecord.SaveRecordFile()
  if true ~= enableRecord then
    return
  end
  local time = os.date("%Y%m%d%H%M%S")
  FileManager.WriteFile("LuaScript/TestRecord/Record_" .. time .. ".txt", PrintTable(record))
end
