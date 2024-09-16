SweepData = {}

function SweepData.InitSweepTarget(data)
  SweepData.sweepTarget = data
end

function SweepData.InitSweepRecord(data)
  SweepData.sweepRecord = data
end

function SweepData.GetFromCardId(stageId)
  if SweepData.sweepTarget and SweepData.sweepTarget.stageId == stageId then
    return SweepData.sweepTarget.fromCardId
  end
end

function SweepData.GetItemId(stageId)
  if SweepData.sweepTarget and SweepData.sweepTarget.stageId == stageId then
    return SweepData.sweepTarget.targetItemId
  end
end

function SweepData.GetItemGotCount(stageId)
  if SweepData.sweepTarget and SweepData.sweepTarget.stageId == stageId then
    return SweepData.sweepTarget.curItemGotCount
  end
end

function SweepData.GetTargetItemCount(stageId)
  if SweepData.sweepTarget and SweepData.sweepTarget.stageId == stageId then
    return SweepData.sweepTarget.targetItemCount
  end
end

function SweepData.UpdateItemGotCount(rewards)
  if SweepData.sweepTarget then
    local itemId = SweepData.sweepTarget.targetItemId
    local count = 0
    for i, v in ipairs(rewards) do
      if v.itemId == itemId then
        count = count + v.count
      end
    end
    SweepData.sweepTarget.curItemGotCount = SweepData.sweepTarget.curItemGotCount + count
  end
end

function SweepData.GetSweepResult()
  return SweepData.sweepRecord and SweepData.sweepRecord.cachedSweepResult or {}
end

function SweepData.ClearData()
  SweepData.ClearSweepTarget()
  SweepData.ClearSweepRecord()
end

function SweepData.ClearSweepTarget()
  SweepData.sweepTarget = nil
end

function SweepData.ClearSweepRecord()
  SweepData.sweepRecord = nil
end
