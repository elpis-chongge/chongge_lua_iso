BattleTransform = {}

function BattleTransform.InitLocalVar()
end

local transformWaitList = {}

function BattleTransform.Init()
  transformWaitList = {}
end

function BattleTransform.AddTransform(transformWait)
  table.insert(transformWaitList, 1, transformWait)
end

function BattleTransform.DealTransformWaitList()
  if #transformWaitList <= 0 then
    return false
  end
  local transformOK = false
  local transformBossCamp
  for i = #transformWaitList, 1, -1 do
    transformOK = false
    local v = transformWaitList[i]
    if v.conditionType == BATTLE_TRANSFORM_CONDITION.FRAME and BattleControl.curFixedFrame >= v.conditionValue then
      local unit = BattleScene.GetUnitByUid(v.unitUid)
      if unit and BattleTransform.CanTransform(unit) == true then
        unit:Transform(v.transformTo, v.transformEffect, v.transformKeepSkillIndex, v.sound, true)
        transformOK = true
        if unit.monsterRank >= 3 then
          transformBossCamp = unit.camp
        end
      end
    end
    if true == transformOK then
      table.remove(transformWaitList, i)
    end
  end
  if transformBossCamp then
    for i = #transformWaitList, 1, -1 do
      transformOK = false
      local v = transformWaitList[i]
      if v.conditionType == BATTLE_TRANSFORM_CONDITION.SELF_BOSS_TRANSFORM then
        local unit = BattleScene.GetUnitByUid(v.unitUid)
        if unit and unit.camp == transformBossCamp then
          unit:Transform(v.transformTo, v.transformEffect, v.transformKeepSkillIndex, v.sound)
          transformOK = true
        end
      end
      if true == transformOK then
        table.remove(transformWaitList, i)
      end
    end
  end
  return transformOK
end

function BattleTransform.RemoveTransformWait(unitUid)
  local v
  for i = 1, #transformWaitList do
    v = transformWaitList[i]
    if v.unitUid == unitUid then
      table.remove(transformWaitList, i)
      return
    end
  end
end

function BattleTransform.CanTransform(unit)
  if unit.isStun or unit.isFreeze or unit.isPetrified or unit.isTimePause then
    return false
  end
  if unit.curState == BATTLE_STATE_ENUM.ATTACK or unit.curState == BATTLE_STATE_ENUM.ATTACK_OVER then
    return false
  end
  return true
end

function BattleTransform.Clear()
  transformWaitList = {}
end
