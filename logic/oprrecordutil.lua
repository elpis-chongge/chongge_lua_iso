local OprRecordUtil = {}
local _records = {}
PLAYER_OPERATION_ENUM = {
  ARENA_MAP_NEW = 1,
  ARENA_BUILDING_NEW = 2,
  ADVENTURE_NEW = 3,
  OPEN_BADGE = 4,
  BOSS_STAGE_OPEN = 5
}

function OprRecordUtil.SaveRecord(oprType, values)
  ActorService.ReportOperateRecordReq(oprType, values)
  _records[oprType] = values
end

function OprRecordUtil.CacheRecord(records)
  _records = {}
  for i, v in ipairs(records) do
    _records[v.opType] = v.values
  end
end

function OprRecordUtil.GetRecord(oprType)
  return _records[oprType] or {}
end

function OprRecordUtil.IsAlreadyRecord(oprType, value)
  local tempList = _records[oprType]
  if nil == tempList then
    return false
  end
  return table.contain(tempList, value)
end

function OprRecordUtil.Clear()
  _records = {}
end

return OprRecordUtil
